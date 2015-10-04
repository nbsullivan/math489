library(expm)
library(ggplot2)

# TODOS:
# 1. q1, run function for needed numbers of points and then plot them.
# 2. q5, find a matrix that will produce the ellispe. run function and plot
# see https://en.wikipedia.org/wiki/Matrix_representation_of_conic_sections
# 3. q6, figure out what you want to define as "close" to X1 and then plot them
# 4. do q7, q8


# this will perform most of the computations needed

matrix.rotate <- function(x0, matrot, point){
  # start a list with x0 as its only values
  lst <- c(x0)
  
  # set up x current with the intial conditions
  x.current <- x0
  
  for(i in 1:point){
    x.new <- x.current %*% matrot
    lst <- c(lst, x.new)
    x.current <- x.new
  }
  print(lst)  
  matrix.final <- matrix(lst, nrow = 2, ncol = point + 1)
  return(matrix.final)
}

# q1 consider x(n+1) = x(n) and Ax(n)
# with A = ((.995,-.1)(.1,.995))
# pick some x in R2 and compute first 10 points
# then first 20, then first 100

A = matrix(c(.995, -.1, .1, .995), nrow = 2, ncol = 2)

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q1.100 <- matrix.rotate(x0, A, 100)

A100_df <- data.frame(t(q1))

ggplot(data = A100_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  ggtitle("Question 1")

# q2 now use B = ((1,-.1),(.1,.99))
# compute first 100 points and plot

B = matrix(c(1, -.1, .1, .99), nrow = 2, ncol = 2)

q2.100 <- matrix.rotate(x0, B, 5)

B100_df <- data.frame(t(q2.100))
B100_df$transform <- "no P"

ggplot(data = B100_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  ggtitle("Question 2")

# q3 compute the Vr Vi of one of the eigen vectors of B let
# let P = (Vr,Vi) what shape will the points in q2 become
# when mulitiplied by P^-1

P <- matrix(c(0.7071, 0.0354, 0,0.7062), nrow = 2, ncol = 2)
P.inverse <- solve(P)

q3 <- P.inverse %*%  q2.100

q3_df <- data.frame(t(q3))
q3_df$transform <- "P^-1"

q2q3_df <- rbind(B100_df, q3_df)

ggplot(data = q2q3_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  ggtitle("Question 3")

# q4 Dianonalize A and B are the Vr Vi of an complex eigen
# vector are they orthogonal

# q5 find a matrix such that the points form a very long narrow
# ellipse

# q6 for E values of A compute angle by which A rotates points.
# if X(0) = (1,0) find values for n in which X(n) is very close
# the x1 axis. then repeat for B

# q7 compute first 100,000 points affected by A, only plot
# every 314th point, then every 3137th point.

# q8 let A+ = 1.01 A solve x(n+1) = A+x(n) and plot first 200
# points repeat for .99A, 1.01B and .99B
