import sys
import jieba
from gensim import corpora, models, similarities
import pandas as pd
import pickle # serialization

url = "C:\\Data_Program\\C#\\CPython-2\\movie.csv"
movie = pd.read_csv(url)

if len(sys.argv) == 1:
	print('no argument',flush=True)
pass

print(f"sys.argv[0] : {sys.argv[0]}",flush=True)
print(f"sys.argv[1] : {sys.argv[1]}",flush=True)

class Recommender:
	def __init__(self, movie):
		self.movie = movie
		self.dictionary = None
		self.corpus_tfidf = None
		self.tfidf_model = None
		self.corpus_similarity = None
	
	
	def preprocess(self):
		# 用jieba找出關鍵字
		doc_list = self.movie['story'].apply(lambda x: [word for word in jieba.cut(x)])
        
		#利用corpora的函示庫，編碼【推薦文章關鍵字】
		self.dictionary = corpora.Dictionary(doc_list)

		# 將【推薦文章】轉換到空間座標
		corpus = [self.dictionary.doc2bow(doc) for doc in doc_list]

		# 建立tf-idf model，將空間座標，利用tf-idf校正
		self.tfidf_model = models.TfidfModel(corpus)
		self.corpus_tfidf = self.tfidf_model[corpus]
	pass
	def recommend(self, doc_test):
		# 挑出【測試文字】的關鍵字，將測試文章轉為向量表示
		doc_test_list = [word for word in jieba.cut(doc_test)]
		print(f"\n測試文字關鍵字: ", doc_test_list)
		#利用corpora的函示庫，編碼【測試文字關鍵字】
		doc_test_vec = self.dictionary.doc2bow(doc_test_list)
		#空間座標，利用tf-idf校正
		test_tfidf = self.tfidf_model[doc_test_vec]


		# 建立cosin similarity的模型，計算【測試文字】對每個推薦文章的cosin similarity
		if self.corpus_similarity is None:
			self.corpus_similarity=similarities.SparseMatrixSimilarity(self.corpus_tfidf,num_features = 
			len(self.dictionary.keys()))
			sim = self.corpus_similarity[test_tfidf]

            # 根據cosin similarity排序，並取出前三筆推薦
			result = sorted(enumerate(sim), key=lambda keyword: keyword[1], reverse=True)
			top1 = self.movie.loc[[result[0][0]], ['movie_title','link','story']].values.tolist()
			top2 = self.movie.loc[[result[1][0]], ['movie_title','link','story']].values.tolist()
			top3 = self.movie.loc[[result[2][0]], ['movie_title','link','story']].values.tolist()
			print("\n根據【測試文章】所【推薦之top1電影】: ", top1)
			print("\n根據【測試文章】所【推薦之top2電影】: ", top2)
			print("\n根據【測試文章】所【推薦之top3電影】: ", top3)
			#top = [top1,top2,top3]
		#return top
	pass
pass


if __name__ == "__main__":
	mr = Recommender(movie)
	mr.preprocess()
	mr.recommend(sys.argv[1])


    




