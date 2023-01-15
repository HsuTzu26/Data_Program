
#### Class 類神經分析實例 ####

load('D:/rtemp/DATA_TRAIN_20221207.RData')
load('D:/rtemp/DATA_TEST_20221207.RData')


library(neuralnet)
library(Metrics)

S = Sys.time()
Model_nn <- neuralnet(Y ~ ., 
                      data = DATA_TRAIN, 
                      hidden = 2, threshold = 0.01, 
                      stepmax = 1e+05, rep = 3)
E = Sys.time()
print(E - S)
plot(Model_nn, rep="best")

nn_vaild <- predict(object = Model_nn, newdata = DATA_TEST)
nn_vaild_class <- ifelse(nn_vaild[, 1] >= 0.5, 'Y', 'N')
data_class <- ifelse(DATA_TEST$Y == 1, 'Y', 'N')
accuracy(nn_vaild_class, data_class)


