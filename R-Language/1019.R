pkgs <- c("gapminder", "dplyr","ggplot2") #使用c 函數一次裝多個套件
install.packages(pkgs)
library(dplyr) #管線操作軟體
library(gapminder) #練習用的資料集
library(ggplot2)
str(gapminder)
x <- 1200
x %>% log %>% sqrt %>% mean # 結果等同下式
mean(sqrt(log(x)))

colnames(gapminder)

str(gapminder)

unique(gapminder$country) 

gapminder %>% filter(year == 2007) %>% View()

gapminder %>% filter(year == 2007) %>% select(country)%>% View()

gapminder %>% mutate(pop_new = pop / 1000)

gapminder %>% arrange(year)

gapminder %>% filter(year == 2007) %>% summarise(sum(pop))

gapminder %>% filter(year == 2007) %>% group_by(continent)%>% summarise(sum(pop))

dim(gapminder) # 查看多少筆資料多少變數
gapminder %>% dim() #
head(gapminder) # 查看資料前六筆
gapminder %>% head() #
str(gapminder)
tail(gapminder)
colnames(gapminder)
summary(gapminder) #彙總值
unique(gapminder$country) #查看國家欄位有哪些獨立資料值unique(gapminder$continent)
unique(gapminder$year) #Year僅有12個年度

# filter()
filter(gapminder, country == "Taiwan") %>%View() #國家欄為台灣的資料
gapminder %>%
filter(country %in% c("Taiwan", "Japan")) %>% View() # A %in% B：A是否在B 中
# select() 選出符合條件欄位
gapminder %>% select(country, continent)%>% View() #立即查看結果
gc <-gapminder %>% select(country, continent) #將結果指定給gc變數
# arrange() 資料排序
gapminder %>% arrange(pop)

# summarise() 挑選符合年度為2007，並將pop轉為數值後求出彙總值
gapminder %>% filter(year == 2007) %>% summarise(sum(as.numeric(pop)))
#as.numeric()-確保轉為數字
#想瞭解各年度的人口值
# group_by() 以年度合併資料，並求出pop彙總值
gapminder %>% group_by(year) %>% summarise(sum(as.numeric(pop))) %>% View()
gap_year<- gapminder %>% group_by(year) %>%
  summarise(sum(as.numeric(pop))) #資料另存入變數
gap_year #查看變數值
names(gap_year) <- c("year","sum_pop") #改欄位變數名稱

#dplyr 與ggplot2結合
#畫出各年度的彙總值
ggplot(gap_year)+ geom_point(aes(x = year, y = sum_pop))
ggplot(gap_year)+ geom_point(aes(x = year, y = sum_pop,size=sum_pop))





# Practice
##1挑出2007年度資料，比較五大洲的pop與lifeExp及gdpPercap的關係
gapminder %>% filter(year == 2007) %>% View()

str(gapminder)
unique(gapminder$year)
gapminder_2007 <- gapminder %>%filter(year == 2007)

ggplot(gapminder_2007)+ geom_point(aes(x = pop, 
    y = gdpPercap,size=gdpPercap, color=continent)) + 
    scale_x_log10() + scale_y_log10()

##2 找出2007年度中亞洲的國家-gdpPercap由大到小排列，pop由小到大
gapminder %>% filter(year == 2007, continent=="Asia") %>%
  arrange(pop, desc(gdpPercap)) %>% View()

##3 找出2007年度中亞洲的國家，並比較pop與lifeExp的關係
gapminder_2007_Asia <- gapminder %>% filter(year == 2007, continent=="Asia") %>%
  arrange(pop, desc(gdpPercap))
gapminder_2007_Asia

ggplot(gapminder_2007_Asia)+ geom_point(aes(x = pop, 
    y = lifeExp,size=gdpPercap, color=country)) + 
    scale_x_log10() + scale_y_log10()


