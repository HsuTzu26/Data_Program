#### Class 決策樹實例 ####
## 從目前有貸款帳戶出未來有機會貸款的人
# 1. 使用XXX切分訓練資料集與預測資料集
# 2. 挑選出目前有存款的帳戶當作活戶
# 3. 將目前是否有貸款的帳戶當作目標
# 4. 不列入貸款相關的欄位
# 5. 補值(NA補0)

## 讀取資料 ##
load('D:/rtemp/data_20221228.RData')


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


## 選取要建模的資料欄位 ##
install.packages("dplyr")
library(dplyr)

DATA_CLN <- data %>% 
  filter(Deposit_Cnt == 1 & Annual_Income_Amt > 0) %>%
  #mutate(Y = as.factor(ifelse(is.na(Loan_Cnt), 'N', 'Y'))) %>%
  mutate(Y = Active_Loan_Cust_Ind) %>%
  select(# "Party_ID", 
    # "Birth_Dt", "Auto_Clearing_House_Ind", "Salary_Trf_Ind", "Staff_Ind", 
    "Gender_Cd", "Marital_Cd", "Edu_Cd", "House_Owner_Ind", #"AGE", 
    "Annual_Income_Amt", 
    "Deposit_Cnt", "Deposit_Amt",# "Loan_Cnt", "Loan_Amt", "Wm_Cnt", "Wm_Amt",
    "IBank_Open_Ind", "IBank_APP_Open_Ind", 
    "Active_Invest_WM_Ind",# "Invest_WM_Ind", 
    # "USL_Cust_Ind", "Active_USL_Cust_Ind", "SL_Cust_Ind", "Active_SL_Cust_Ind", "PL_Cust_Ind", "Active_PL_Cust_Ind", 
    # "Active_Loan_Cust_Ind", 
    "Active_CC_Cust_Ind",# "CC_Cust_Ind", 
    "Active_Debit_Card_Ind",# "Debit_Card_Ind", 
    "Active_Chip_Card_Ind",# "Chip_Card_Ind", 
    "Y")

levels(DATA_CLN$Y)
DATA_CLN$Y <- relevel(DATA_CLN$Y, ref = 'Y')
levels(DATA_CLN$Y)

for(i in colnames(DATA_CLN)) {
  cat(i, 'class is: ', class(DATA_CLN[,i]), 
      '\t na count: ', length(which(is.na(DATA_CLN[,i]) == T)), '\n')
}

## Split Data to Train and Vail ##
install.packages("caTools")
library(caTools)
set.seed(5555)
split <- sample.split(DATA_CLN[, 'Y'], SplitRatio = 0.8)
DATA_TRAIN <- DATA_CLN[split, ]
DATA_TEST <- DATA_CLN[!split, ]

table(DATA_CLN$Y) / dim(DATA_CLN)[1]
table(DATA_TRAIN$Y) / dim(DATA_TRAIN)[1]
table(DATA_TEST$Y) / dim(DATA_TEST)[1]

#### Build Model classification ####
pkgs <- c("Metrics","ROCit")
install.packages(pkgs)
library(Metrics) #validation
library(ROCit)

## Decision Tree ##
install.packages("rpart")
library(rpart)

Start = Sys.time()
Model_rpart <- rpart(Y ~ ., data = DATA_TRAIN, method = 'class')
End = Sys.time()
print(End-Start)
Model_rpart
summary(Model_rpart)
print(Model_rpart)
summary(Model_rpart, cp=0.05) # cp:剪枝
print(Model_rpart, cp=0.05)

plot(Model_rpart, margin=0.1)
text(Model_rpart,use.n=TRUE, cex=0.8)

rpart_vaild <- predict(object = Model_rpart, newdata = DATA_TEST, type = 'class')
accuracy(rpart_vaild, DATA_TEST$Y)
caret::confusionMatrix(rpart_vaild, DATA_TEST$Y)

rpart_vaild_prob <- predict(object = Model_rpart, newdata = DATA_TEST, type = 'prob')
roc_rpart <- rocit(rpart_vaild_prob[,1], DATA_TEST$Y, negref = 'N', method = 'binormal')
plot(roc_rpart)


## Random Forest ##
install.packages("randomForest")
library(randomForest)

Start = Sys.time()
set.seed(5555)
Model_rf <- randomForest(Y ~ ., data = DATA_TRAIN, ntree=500)
End = Sys.time()
print(End-Start)
Model_rf
importance(Model_rf)
print(Model_rf)

plot(Model_rf)
varImpPlot(Model_rf)

rf_vaild <- predict(object = Model_rf, newdata = DATA_TEST, type = 'class')
accuracy(rf_vaild, DATA_TEST$Y)
caret::confusionMatrix(rf_vaild, DATA_TEST$Y)

rf_vaild_prob <- predict(object = Model_rf, newdata = DATA_TEST, type = 'prob')
roc_rf <- rocit(rf_vaild_prob[,1], DATA_TEST$Y, negref = 'N', method = 'binormal')
plot(roc_rf)


#### Build Model Regression ####
## 篩選出Deposit_Amt介於5萬到100萬之間的資料 ##
DATA_CLN_reg <- DATA_CLN %>%
  select(-Y) %>% 
  filter(Deposit_Amt <= 1000000 & 
           Deposit_Amt >= 50000)

split_reg <- sample.split(DATA_CLN_reg[, 'Deposit_Amt'], SplitRatio = 0.8)
DATA_TRAIN_reg <- DATA_CLN_reg[split_reg, ]
DATA_TEST_reg <- DATA_CLN_reg[!split_reg, ]

summary(DATA_CLN_reg$Deposit_Amt)
summary(DATA_TRAIN_reg$Deposit_Amt)
summary(DATA_TEST_reg$Deposit_Amt)

## Decision Tree ##
Start = Sys.time()
Model_rpart_reg <- rpart(Deposit_Amt ~ ., data = DATA_TRAIN_reg)
End = Sys.time()
print(End-Start)
Model_rpart_reg
summary(Model_rpart_reg)
print(Model_rpart_reg)
summary(Model_rpart_reg, cp=0.05)
print(Model_rpart_reg, cp=0.05)

plot(Model_rpart_reg, margin=0.1)
text(Model_rpart_reg,use.n=TRUE, cex=0.8)

rpart_vaild_reg <- predict(object = Model_rpart_reg, newdata = DATA_TEST_reg)
summary(rpart_vaild_reg)
mse(rpart_vaild_reg, DATA_TEST_reg$Deposit_Amt)
rmse(rpart_vaild_reg, DATA_TEST_reg$Deposit_Amt)
mae(rpart_vaild_reg, DATA_TEST_reg$Deposit_Amt)
mape(rpart_vaild_reg, DATA_TEST_reg$Deposit_Amt)



## Random Forest ##
Start = Sys.time()
Model_rf_reg <- randomForest(Deposit_Amt ~ ., data = DATA_TRAIN_reg, ntree=500)
End = Sys.time()
print(End-Start)
Model_rf_reg
importance(Model_rf_reg)
print(Model_rf_reg)

plot(Model_rf_reg)
varImpPlot(Model_rf_reg)

rf_vaild_reg <- predict(object = Model_rf_reg, newdata = DATA_TEST_reg)
summary(rf_vaild_reg )
mse(rf_vaild_reg, DATA_TEST_reg$Deposit_Amt)
rmse(rf_vaild_reg, DATA_TEST_reg$Deposit_Amt)
mae(rf_vaild_reg, DATA_TEST_reg$Deposit_Amt)
mape(rf_vaild_reg, DATA_TEST_reg$Deposit_Amt)



#### advence use caret ####
install.packages("caret")
library(caret)
names(getModelInfo())

## Decision Tree ##
Start = Sys.time()
Model_rpart <- train(Y ~ ., data = DATA_CLN, method = 'rpart', cp = TRUE)
End = Sys.time()
print(End-Start)

Model_rpart
rpart_vaild <- predict(object = Model_rpart, newdata = DATA_CLN, type = 'raw')
confusionMatrix(rpart_vaild, DATA_CLN$Y)


## Random Forest ##
Start = Sys.time()
Model_rf <- train(Y ~ ., data = DATA_CLN, method = 'rf', importance = TRUE, ntree = 50)
End = Sys.time()
print(End-Start)

Model_rf
varImp(Model_rf)
rf_vaild <- predict(object = Model_rf, newdata = DATA_CLN, type = 'raw')
confusionMatrix(rf_vaild, DATA_CLN$Y)


## eXtreme Gradient Boosting ##
set.seed(5555)

param <- expand.grid(
  nrounds = 100,
  max_depth = 6,
  eta = 0.3,
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = 1,
  subsample = 1
)
# nrounds (# Boosting Iterations)
# max_depth (Max Tree Depth)
# eta (Shrinkage)
# gamma (Minimum Loss Reduction)
# colsample_bytree (Subsample Ratio of Columns)
# min_child_weight (Minimum Sum of Instance Weight)
# subsample (Subsample Percentage)

Start = Sys.time()
Model_xgb <- train(Y ~ ., data = DATA_CLN, method = 'xgbTree', 
                   tuneGrid = param)
End = Sys.time()
print(End-Start)
xgb_vaild <- predict(object = Model_xgb, newdata = DATA_CLN, type = 'raw')
confusionMatrix(xgb_vaild, DATA_CLN$Y)

tune_param <- expand.grid(
  nrounds = 500,
  eta = c(0.025, 0.05, 0.1, 0.3),
  max_depth = c(2, 3, 4, 5, 6),
  gamma = 0,
  colsample_bytree = 1,
  min_child_weight = 1,
  subsample = 1
)
tune_control <- caret::trainControl(
  method = "cv", # cross-validation
  number = 3, # with n folds 
  #index = createFolds(tr_treated$Id_clean), # fix the folds
  verboseIter = FALSE, # no training log
  allowParallel = TRUE # FALSE for reproducible results 
)
Start = Sys.time()
Tune_xgb <- train(Y ~ ., data = DATA_CLN, method = 'xgbTree', 
                  tuneGrid = tune_param, trControl = tune_control)
End = Sys.time()
print(End-Start)
xgb_tune <- predict(object = Tune_xgb, newdata = DATA_CLN, type = 'raw')
confusionMatrix(xgb_tune, DATA_CLN$Y)
End = Sys.time()
print(End-Start)

ggplot(Tune_xgb) +
  coord_cartesian(ylim = c(quantile(Tune_xgb$results$Accuracy, probs = 0.9), 
                           min(Tune_xgb$results$Accuracy))) +
  theme_bw()


