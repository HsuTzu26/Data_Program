x <- c(0.15,0.17,0.194,0.178,0.164,0.144)
y <- c(0.149,0.169,0.1775,0.1575,0.184,0.163)
plot(x, y)

cor(x,y)
cor.test(x,y)

plot(x,y)
abline(lm(y~x),col="red")
legend("topleft", legend=c("r=0.4484821", "p-value=0.3724"))
