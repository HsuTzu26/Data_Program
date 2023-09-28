#參考 https://github.com/ywchiu/rcrawler
#https://medium.com/@eric61011/%E4%BD%BF%E7%94%A8r%E8%AA%9E%E8%A8%80%E9%80%B2%E8%A1%8C%E7%88%AC%E8%9F%B2-936637f272cb
#file:///C:/Users/user/Downloads/20160324-bigdataworkshop-r-160324104041%20(2).pdf
#網路爬蟲實作 – 用 R 語言打造自己的爬蟲程式
#使用R語言進行簡單的網頁爬蟲
#請注意，這是一個教學程式範例，網頁爬蟲，是用來快速抓取網頁中的資料，
#必須對每一個不同的網頁，進行詳細的解析，並針對不同的網頁架構進行程式
#撰寫，才能順利擷取資料。

# 前置準備
# 第一步：下載並安裝安裝R
# 請到R首頁下載並安裝R: http://www.r-project.org
# 注意盡量不去更動安裝路徑
# 第二步：下載並安裝Rstudio
# 請到官網下載Rstudio: http://rstudio.org

# 安裝程式碼所需要的套件。
# 其中「rvest」套件是網路爬蟲會用到的函式庫。
#「magrittr」則提供管線操作語法，例如本文範例程式的「%>%」語法。
# 將程式碼全選，再按Run執行。
# 

install.packages("rvest")
library(rvest)
install.packages("magrittr")
library(magrittr)

#url = "https://www.mobile01.com/forumtopic.php?c=29"
#url = "http://www.appledaily.com.tw/realtimenews/section/new/"
url = "https://tw.appledaily.com/new/realtime"
htmlContent = read_html(url)
htmlContent %>% iconv(from='UTF-8', to='UTF-8')
# Windows 平台需要透過iconv 轉換編碼
# %>% : pipeline 做傳遞資料用

#
#titlePath = "/html/body/div[1]/div[3]/div[2]/div[3]/div[6]/table/tbody/tr[1]/td[1]/span/a"
#titlePath = "//*[@id="maincontent"]/div[6]/table/tbody/tr[1]/td[1]/span/a"
#titles = htmlContent %>% html_nodes(xpath = titlePath) %>% html_text()

#使用開發人員工具複製DOM 元素路徑
#右鍵點選選取元素-> Copy -> Copy selector
#注意: li.rtddt.slvl 每篇文章都有 “.rtddt”

rtddt <- htmlContent %>% html_nodes('.rtddt')
rtddt[1] %>% iconv(from='UTF-8', to='UTF-8')
time <- rtddt %>%
  html_nodes('time') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')
title <- rtddt %>%
  html_nodes('h1') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')
category <- rtddt %>%
  html_nodes('h2') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')
url <- rtddt %>%
  html_nodes('a') %>%
  html_attr('href') %>%  #使用html_attr 抓取href
  iconv(from='UTF-8', to='UTF-8')

#domain = "https://tw.appledaily.com/new/realtime"
#不一定要將domain name 連結上去，要觀察原來網頁中 href 的內容
#url <- gsub(domain, "", url)
#url <- paste0(domain, url)

applenews <- data.frame(time =time, title= title, category = category, url = url)
#applenews

#作一些簡單分析
applenews[applenews$category=="生活",]
sum(applenews$category=="生活")
applenews[applenews$category=="娛樂",]
sum(applenews$category=="娛樂")
applenews[applenews$category=="政治",]
sum(applenews$category=="政治")
applenews[applenews$category=="社會",]
sum(applenews$category=="社會")
applenews[applenews$category=="國際",]
sum(applenews$category=="國際")

table(applenews$category)

#若有登入帳號即可利用以下方式讀取文章內容
#需要先登入
#但是，html_nodes('.articulum.trans')，不太對，抓不到
#html_nodes('.ndArticle_margin') %>% html_nodes('p') 比較抓的到
applenews$url <- as.character(applenews$url)
applenews$content <- sapply(applenews$url, function(e){read_html(e) %>% html_nodes('.articulum.trans') %>% html_text() %>% iconv(from='UTF-8', to='UTF-8') } )


#more tries
#現在我們用一個更好的例子
#我們搜尋 ”營養食品” 這個關鍵字，如下 
#https://tw.appledaily.com/search/result?querystrS=營養食品
#因為編碼的關係，顯示如下:
#https://tw.appledaily.com/search/result?querystrS=%E7%87%9F%E9%A4%8A%E9%A3%9F%E5%93%81


url = "https://tw.appledaily.com/search/result?querystrS=%E7%87%9F%E9%A4%8A%E9%A3%9F%E5%93%81"
htmlContent = read_html(url)
htmlContent %>% iconv(from='UTF-8', to='UTF-8')
# Windows 平台需要透過iconv 轉換編碼
# %>% : pipeline 做傳遞資料用

#使用開發人員工具複製DOM 元素路徑
#右鍵點選選取元素-> Copy -> Copy selector
#注意: li.item 每篇文章都有 “.item”. that is <li class="item">

rtddt <- htmlContent %>% html_nodes('.item')

rtddt[1] %>% iconv(from='UTF-8', to='UTF-8')
time <- rtddt %>%
  html_nodes('time') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')
ellipsis <- rtddt %>%  #ellipsis
  html_nodes('p') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')
# category <- rtddt %>%
#   html_nodes('h2') %>%
#   html_text() %>%
#   iconv(from='UTF-8', to='UTF-8')

title <- rtddt %>%
  html_nodes('h2') %>%
  html_nodes('a') %>%
  html_text() %>%
  iconv(from='UTF-8', to='UTF-8')

url <- rtddt %>%
  html_nodes('h2') %>%
  html_nodes('a') %>%
  html_attr('href') %>%  #使用html_attr 抓取href
  iconv(from='UTF-8', to='UTF-8')

#domain = "https://tw.appledaily.com/new/realtime"
#不一定要將domain name 連結上去，要觀察原來網頁中 href 的內容
#url <- gsub(domain, "", url)
#url <- paste0(domain, url)

applenews <- data.frame(time =time, title= title, ellipsis= ellipsis, url = url)
#applenews

#若有登入帳號即可利用以下方式讀取文章內容
#用這個比較正確
applenews$url <- as.character(applenews$url)
applenews$content <- sapply(applenews$url, function(e){read_html(e) %>% 
    html_nodes('.ndArticle_margin') %>% html_nodes('p') %>%
    html_text() %>% iconv(from='UTF-8', to='UTF-8') } )

applenews_ok = applenews[!(applenews$content=="character(0)"),]
applenews_ok = applenews_ok[c(1,2,3,4)]
#save applenews$content 會出錯，debuging 中
write.csv(applenews_ok,file="applenews_content.csv", row.names = F)

#整理資料後做分析
#使用jiebaR 斷詞
install.packages("jiebaR")
library("jiebaR")
mixseg = worker()
segment(code= as.character(applenews$title[1]) , jiebar= mixseg)
segment(code= as.character(applenews$ellipsis[1]) , jiebar= mixseg)
segment(code= as.character(applenews$content[1]) , jiebar= mixseg)

#計算詞頻title
word <- unlist(sapply(applenews$title, function(e)
  segment(code= as.character(e) , jiebar = mixseg)))
tb <- table(word)

install.packages("wordcloud")
library(wordcloud)
wordcloud(names(tb), tb,scale=c(4,.5) , min.freq = 1, 
          random.order = F, ordered.colors = F, colors = rainbow(length(1:5)))

# ------------------------------------#
#計算詞頻ellipsis
word <- unlist(sapply(applenews$ellipsis, function(e)
  segment(code= as.character(e) , jiebar = mixseg)))
tb <- table(word)

#install.packages("wordcloud")
#library(wordcloud)
wordcloud(names(tb), tb,scale=c(5,.5) , min.freq = 1, 
          random.order = F, ordered.colors = F, colors = rainbow(length(1:8)))


#計算詞頻content
#note: applenews$content can not be empty. need to check on this

word <- unlist(sapply(applenews_ok$content, function(e)
  segment(code= as.character(e) , jiebar = mixseg)))
tb <- table(word)

#install.packages("wordcloud")
#library(wordcloud)
wordcloud(names(tb), tb,scale=c(4,.5) , min.freq = 1, 
          random.order = F, ordered.colors = F, colors = rainbow(length(1:5)))
