import jieba
from gensim import corpora, models, similarities
#gensim 將文檔轉換為語意向量、corpora、models 主題建模、simlarities 計算相似度
from gensim.similarities import MatrixSimilarity
import pandas as pd
import pickle 
import copy
#serialization
from hanziconv import HanziConv


import sys

if len(sys.argv) == 1:
    print('no argument',flush=True)
    sys.exit()
pass

print(f"sys.argv[0] : {sys.argv[0]}",flush=True)
print(f"sys.argv[1] : {sys.argv[1]}",flush=True)


class movie_recommend:
  def __init__(self,url="movie.csv"):
    self.url = url 
  pass
pass

def train(self):
  self.movie = pd.read_csv(self.url)
  #挑出每一篇【推薦文章】的關鍵字
  all_doc = self.movie["story"].values.tolist()
  all_doc_list = []
  for doc in all_doc:
    doc_list = [word for word in jieba.cut(doc)]
    #jieba.cut 利用jieba找出關鍵字
    all_doc_list.append(doc_list)
  pass
  #print("\n推薦文章關鍵字:",all_doc_list)

  #利用corpora函式庫，產生【推薦文章關鍵字編碼】
  self.dictionary = corpora.Dictionary(all_doc_list)
  #列出有多少編碼
  #print("\n列出有多少編碼:",dictionary.keys())
  #print("\n列出關鍵字與編碼的對應關係:",(dictionary.token2id))
  corpus = [self.dictionary.doc2bow(doc) for doc in all_doc_list]
  #列印出(編號、頻次數)。doc2bow將所有單詞取『集合』，並分配ID號
  #print("\n校正前的推薦文章空間座標:",corpus)
  #建立tf-idf_model
  self.tfidf_model = models.TfidfModel(corpus)
  #利用tf-idf校正空間座標
  self.corpus_tfidf = self.tfidf_model[corpus]
  #print("\n利用TF-IDF模型校正後的推薦文章空間座標:")
pass

movie_recommend.training = train

def recommend(self,doc_test):
  doc_test_list = [word for word in jieba.cut(doc_test)]
  print("\n測試文字關鍵字", doc_test_list)
  #利用corpora函式庫，產生【測試文章關鍵字編碼】

  doc_test_vec = self.dictionary.doc2bow(doc_test_list)
  print("\n校正前的測試文章空間座標:" , doc_test_list)
  #利用tf-idf校正空間座標
  test_tfidf = self.tfidf_model[doc_test_vec]
  print('\n利用TF-IDF模型校正後的測試文章空間座標:')
  for i in test_tfidf:
    print(i)
  #建立corpus_similarity_的模型
  corpus_similarity_ = similarities.SparseMatrixSimilarity(self.corpus_tfidf, num_features=len(self.dictionary.keys()))
  # 計算【測試文章】對【推薦電影】的cosin similarity
  sim = corpus_similarity_[test_tfidf]

  result = sorted(enumerate(sim), key=lambda keyword: keyword[1], reverse=True)

  top1=self.movie.loc[[result[0][0]], ['movie_title','link','story']].values.tolist()
  top2=self.movie.loc[[result[1][0]], ['movie_title','link','story']].values.tolist()
  top3=self.movie.loc[[result[2][0]], ['movie_title','link','story']].values.tolist()
  b=HanziConv.toTraditional(top1[0][0])

  print(f"\naa根據【測試文章】所【推薦之top1電影】:{HanziConv.toTraditional(top1[0][0])} {HanziConv.toTraditional(top1[0][1])} {HanziConv.toTraditional(top1[0][2])}")
  print(f"\n根據【測試文章】所【推薦之top2電影】:{HanziConv.toTraditional(top2[0][0])} {HanziConv.toTraditional(top1[0][1])} {HanziConv.toTraditional(top1[0][2])}")
  print(f"\n根據【測試文章】所【推薦之top電影】:{HanziConv.toTraditional(top3[0][0])} {HanziConv.toTraditional(top1[0][1])} {HanziConv.toTraditional(top1[0][2])}")


pass

movie_recommend.testing = recommend

model = movie_recommend("movie.csv")
model.training()
#model.testing("電算中心")

f = open('model.p', 'wb')
pickle.dump(model, f)
f.close()

f = open('model.p', 'rb')

model = pickle.load(f)
model.testing(sys.argv[1])
f.close()