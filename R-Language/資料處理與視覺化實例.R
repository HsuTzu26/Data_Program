
## dplyr基本指令 ##
library(dplyr)
# filter
diamonds %>% 
  filter(cut == 'Premium')

diamonds %>% 
  filter(cut == 'Premium' & carat >= 0.5)

diamonds %>% 
  filter(cut %in% c('Premium', 'Ideal'))

diamonds %>% 
  filter(cut %in% c('Premium', 'Ideal') | carat >= 1)

# select
diamonds %>% 
  select(carat, cut, clarity, depth)

# summarise
diamonds %>% 
  summarise(avg = mean(depth))

# group_by
diamonds %>% 
  group_by(cut) %>% 
  summarise(avg = mean(depth))

# mutate
diamonds %>% 
  mutate(volume = x * y * z)

# arrange
diamonds %>% 
  arrange(carat)

diamonds %>% 
  arrange(desc(carat))

# sample_n
diamonds %>% 
  sample_n(5)

## ggplot2基本指令 ##
library(ggplot2)
# Step1. Data
ggplot(data = diamonds)

# Step2. Aesthetic
ggplot(data = diamonds, aes(x = color, y = price))

# Step3. Geometry
ggplot(data = diamonds, aes(x = color, y = price)) + 
  geom_col()

# Step4. Facet
ggplot(data = diamonds, aes(x = color, y = price)) + 
  geom_col() + 
  facet_grid(cut~.)

ggplot(data = diamonds, aes(x = color, y = price, fill = cut)) + 
  geom_col()

# Step5. Statistics
ggplot(data = diamonds, aes(x = color, y = price)) + 
  geom_col() + 
  stat_summary(fun.min = function(y) mean(y) - sd(y), 
               fun.max = function(y) mean(y) + sd(y), 
               position ='dodge', 
               geom = 'errorbar')

# Step6. Coordinates
ggplot(data = diamonds, aes(x = color)) + 
  geom_bar() + 
  # facet_grid(cut~.) + 
  coord_cartesian(ylim = c(1000, 5000))

# Step7. Theme
ggplot(data = diamonds, aes(x = color, y = price)) + 
  geom_col() + 
  facet_grid(cut~.) + 
  labs(x = 'diamond color[from D(best) to J(worst)]', 
       y = 'price in US dollars(sum)',
       title = 'Prices of over 50,000 round cut diamonds',
       subtitle = 'A dataset containing the prices and other attributes of almost 54,000 diamonds.',
       caption = 'diamonds{ggplot2}')



#### Class 資料處理與視覺化實例 ####
library(dplyr)
library(lubridate)
library(ggplot2)
load('D:/data.RData')

## 資料整理 ##
data$AGE <- year(Sys.time()) - year(data$Birth_Dt)

class(data$Gender_Cd)
levels(data$Gender_Cd)
levels(data$Gender_Cd) <- c('M', 'F')
levels(data$Gender_Cd)

class(data$Marital_Cd)
levels(data$Marital_Cd)
levels(data$Marital_Cd) <- c('Unmarried', 'Married')
levels(data$Marital_Cd)

class(data$Edu_Cd)
levels(data$Edu_Cd)
levels(data$Edu_Cd) <- c('PhD', 'Master', 'Bachelor', 'Specialist', 'High School')
levels(data$Edu_Cd)

summary(data$Annual_Income_Amt)

data$House_Owner_Ind = as.factor(as.character(data$House_Owner_Ind))
levels(data$House_Owner_Ind)
table(data$House_Owner_Ind)


for(i in colnames(data)) {
  if(i == 'Party_ID') {
    print(i)
  } else if(class(data[,i]) == 'factor') {
    print(i)
    print(levels(data[,i]))
    print(table(data[,i], useNA = 'always'))
  } else {
    print(i)
    print(summary(data[,i]))
  }
  print('--------------------------------')
}


## 基本資料
# Gender_Cd Marital_Cd Edu_Cd AGE
##金額
# Annual_Income_Amt Loan_Cnt Deposit_Cnt Wm_Cnt Loan_Amt Deposit_Amt Wm_Amt
## 特徵
# House_Owner_Ind Salary_Trf_Ind Staff_Ind
# IBank_Open_Ind IBank_APP_Open_Ind
# Invest_WM_Ind Active_Invest_WM_Ind  
# USL_Cust_Ind Active_USL_Cust_Ind SL_Cust_Ind Active_SL_Cust_Ind PL_Cust_Ind Active_PL_Cust_Ind Active_Loan_Cust_Ind 
# CC_Cust_Ind Active_CC_Cust_Ind 
# Debit_Card_Ind Active_Debit_Card_Ind 
# Chip_Card_Ind Active_Chip_Card_Ind

#### 客戶基本特徵 ####
## 性別學歷關係 ##
gender_edu = data %>%
  group_by(Gender_Cd, Edu_Cd) %>%
  count()

ggplot(gender_edu, aes(x=Gender_Cd, y=Edu_Cd)) + 
  geom_raster(aes(fill=n))

ggplot(gender_edu) + 
  geom_col(aes(x=Edu_Cd, y=n, fill=Gender_Cd), position = 'dodge')

ggplot(gender_edu) + 
  geom_col(aes(x=Edu_Cd, y=n, fill=Gender_Cd), position = 'fill')

ggplot(gender_edu) + 
  geom_col(aes(x=Edu_Cd, y=n, fill=Gender_Cd), position = 'stack')

## 為銀行員工比例 ##
staff = data %>%
  group_by(Staff_Ind) %>%
  count()
ggplot(staff, aes(x=Staff_Ind, y=n, fill=Staff_Ind)) + 
  geom_col(position = 'dodge')

data %>%
  group_by(Staff_Ind) %>%
  count() %>% 
  ggplot(aes(x=Staff_Ind, y=n, fill=Staff_Ind)) + 
  geom_col(position = 'dodge')

## 為銀行薪轉戶比例 ##
data %>%
  group_by(Salary_Trf_Ind) %>%
  count() %>% 
  ggplot(aes(x=Salary_Trf_Ind, y=n, fill=Salary_Trf_Ind)) + 
  geom_col(position = 'dodge')

## 年齡與婚姻關係 ##
age_marriage = data %>%
  group_by(AGE, Marital_Cd) %>%
  count()

ggplot(age_marriage, aes(x=AGE, y=n, fill=Marital_Cd)) + 
  geom_col(position = 'dodge')

data %>%
  group_by(AGE) %>% 
  count() %>% 
  ggplot(aes(x=AGE, y=n)) + 
  geom_col(fill='blue', position = 'dodge')

## 年齡與已買房關係 ##
data %>%
  group_by(AGE, House_Owner_Ind) %>% 
  count() %>% 
  ggplot(aes(x=AGE, y=n, fill=House_Owner_Ind)) + 
  geom_col(position = 'dodge') + 
  # coord_cartesian(xlim = c(20, 80)) +
  scale_x_continuous(limits=c(20,80), n.breaks = 20)

