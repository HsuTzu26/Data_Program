#線性聯立方程式
#AX=B
#> A = rbind(c(1, -1/4), c(-1/4, 1))
#> B = matrix(c(1,2), nrow=2, ncol=1)
#求解 X
A <-  rbind(c(1, -1/4), c(-1/4, 1))
A
B <-  matrix(c(1,2), nrow=2, ncol=1)
B
X <- solve(A, B)
X

#反矩陣再求解
# AX=B
# IA AX = IA B
# X= IA B
IA <- solve(A)
X <- IA %*% B

#第二題，求解

W <- matrix(c(1, 2, 6, 5, -3, 1, 2, 7, -1), nrow=3, byrow=TRUE)
W
C <- matrix(c(23, 2, 13), nrow=3, ncol=1)
C
X <- solve(W, C)
X

#反矩陣再求解
# AX=B
# IA AX = IA B
# X= IA B
IW <- solve(W)
X <- IW %*% C




W <- matrix(c(1, 2, 6, 5, -3, 1, 2, 7, -1), nrow=3, byrow=TRUE)

v1 <- c(1,2,6)
v2 <- c(5,-3,1)
v3 <- c(2,7,-1)
V <- rbind(v1,v2,v3)
B <- rbind(23,2,13)

v1
v2
v3
V
B

IV <- solve(V)
X <- IV %*% B

