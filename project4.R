library(expm)
library(ggplot2)

# TODOS:
# 1. q1, run function for needed numbers of points and then plot them. 
# 2. q5, find a matrix that will produce the ellispe. run function and plot
# see https://en.wikipedia.org/wiki/Matrix_representation_of_conic_sections
# 3. q6, figure out what you want to define as "close" to X1 and then plot them
# 4. do q7, q8q3


# this will perform most of the computations needed

matrix.rotate <- function(x0, matrot, point){
  # start a list with x0 as its only values
  lst <- c(x0)
  
  # set up x current with the intial conditions
  x.current <- t(x0)
  
  for(i in 1:point){
    x.new <-  matrot %*% x.current
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
#############################
#A should wrtiten in this way
#############################
A = matrix(c(.995, .1, -.1, .995), nrow = 2, ncol = 2)


x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q1.10 <- matrix.rotate(x0, A, 10)
q1.20 <- matrix.rotate(x0, A, 20)
q1.100 <- matrix.rotate(x0, A, 100)

A10_df <- data.frame(t(q1.10))
A20_df <- data.frame(t(q1.20))
A100_df <- data.frame(t(q1.100))

ggplot(data = A10_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 1_First 10 Points")

ggplot(data = A20_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 1_First 20 Points")

ggplot(data = A100_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 1_First 100 points")

# q2 now use B = ((1,-.1),(.1,.99))
# compute first 100 points and plot
#############################
#B should written in this way
#############################
B = matrix(c(1, .1, -.1, .99), nrow = 2, ncol = 2)

q2.100 <- matrix.rotate(x0, B, 5)
#############################################################
# Is here should be 100 instead of 5,as the question stated?#
#############################################################
q2.100 <- matrix.rotate(x0, B, 100)
B100_df <- data.frame(t(q2.100))
B100_df$transform <- "no P"

ggplot(data = B100_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 2")

# q3 compute the Vr Vi of one of the eigen vectors of B let
# let P = (Vr,Vi) what shape will the points in q2 become
# when mulitiplied by P^-1

P <- matrix(c(0.7071, 0.0354, 0,0.7062), nrow = 2, ncol = 2)
#####################################################################
#P should be matrix(c(0.7071, -0.0354, 0,0.7062), nrow = 2, ncol = 2)
######################################################################
P <- matrix(c(0.7071, 0.0354, 0,-0.7062), nrow = 2, ncol = 2)
P.inverse <- solve(P)

q3 <- P.inverse %*%  q2.100

q3_df <- data.frame(t(q3))
q3_df$transform <- "P^-1"

q2q3_df <- rbind(B100_df, q3_df)

ggplot(data = q2q3_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 3")

# q4 Dianonalize A and B are the Vr Vi of an complex eigen
# vector are they orthogonal
########################
# prove it analytically#
########################



# q5 find a matrix such that the points form a very long narrow
# ellipse
#######################
# I can not come up one:-(
##################################

M = matrix(c(cos(5*pi/180), sin(5*pi/180), -sin(5*pi/180), cos(5*pi/180)), nrow = 2, ncol = 2)
V = matrix(c(1, 0, 0, 4), nrow = 2, ncol = 2)

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q5.100 <- matrix.rotate(x0, M, 100)

q5.100 <- V%*%q5.100

M100_df <- data.frame(t(q5.100))

ggplot(data = M100_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) + 
  ggtitle("Question 5_Long Narrow Ellipse")


# q6 for E values of A compute angle by which A rotates points.
# if X(0) = (1,0) find values for n in which X(n) is very close
# the x1 axis. then repeat for B
q6.A30000 <- matrix.rotate(x0, A, 30000)
A30000_df <- data.frame(t(q6.A30000))
A30000_df$ID <- 0:(nrow(A30000_df)-1)   # note indexing by 0 corresponds to power

A30000_df.sub <- subset(A30000_df, abs(X2) < 0.05 )
nA <- A30000_df.sub[1:100,3]            # n's corresponding to close points for A
nA_df <- data.frame(nA)
nA_df$ID <- 0:(nrow(nA_df)-1)

ggplot(data = nA_df, aes(x = ID, y = nA)) +
        geom_point() +
        stat_smooth(formula = y ~ x) + 
        xlab("n") + 
        ylab("Power of A") + 
        ggtitle("Question 6_Powers of A Close to x-axis")

ggplot(data = A30000_df.sub, aes(x = X1, y = X2)) +
        geom_hline(aes(yintercept = 0)) +
        geom_vline(aes(xintercept = 0)) +
        geom_point() +
        ylim(-1,1) + 
        coord_equal(ratio=1) +
        ggtitle("Question 6_Close Points for A")


q6.B30000 <- matrix.rotate(x0, B, 30000)
B30000_df <- data.frame(t(q6.B30000))
B30000_df$ID <- 0:(nrow(A30000_df)-1)   # note indexing by 0 corresponds to power

B30000_df.sub <- subset(B30000_df, abs(X2) < 0.05 )
nB <- B30000_df.sub[1:100,3]            # n's corresponding to close points for B
nB_df <- data.frame(nA)
nB_df$ID <- 0:(nrow(nB_df)-1)

ggplot(data = nB_df, aes(x = ID, y = nB)) +
        geom_point() +
        stat_smooth(formula = y ~ x) + 
        xlab("n") + 
        ylab("Power of B")  +
        ggtitle("Question 6_Powers of B Close to x-axis")


ggplot(data = B30000_df.sub, aes(x = X1, y = X2)) +
        geom_hline(aes(yintercept = 0)) +
        geom_vline(aes(xintercept = 0)) +
        geom_point() +
        ylim(-1,1) + 
        coord_equal(ratio=1) +
        ggtitle("Question 6_Close Points for B")



# q7 compute first 100,000 points affected by A, only plot
# every 314th point, then every 3137th point.

A = matrix(c(.995, .1, -.1, .995), nrow = 2, ncol = 2)

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q7.100000 <- matrix.rotate(x0, A, 100000)

######################################################################
# here, should write another functions to make it only generates every 
######################################################################
A100000_df <- data.frame(t(q7.100000))

ggplot(data = A100000_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 7_First 100000 Points")

ggplot(data = A100000_df[seq(1,nrow(A100000_df), by = 314), ], aes(x = X1, y = X2)) +
        geom_hline(aes(yintercept = 0)) +
        geom_vline(aes(xintercept = 0)) +
        geom_point() +
        coord_equal(ratio=1) +
        ggtitle("Question 7_Every 314th Point")

ggplot(data = A100000_df[seq(1,nrow(A100000_df), by = 3137), ], aes(x = X1, y = X2)) +
        geom_hline(aes(yintercept = 0)) +
        geom_vline(aes(xintercept = 0)) +
        geom_point() +
        coord_equal(ratio=1) +
        ggtitle("Question 7_Every 3137th Point")



A100000_df_1000 <- A100000_df[seq(1,nrow(A100000_df), by = 1000), ]
A100000_df_1000$transform <- "1000th"

A100000_df_17000 <- A100000_df[seq(1,nrow(A100000_df), by = 17000), ]
A100000_df_17000$transform <- "17000th"

A100000_df_2 <- rbind(A100000_df_1000,A100000_df_17000)

ggplot(data = A100000_df_2, aes(x = X1, y = X2, color = factor(transform))) +
        geom_hline(aes(yintercept = 0)) +
        geom_vline(aes(xintercept = 0)) +
        geom_point() +
        scale_color_manual(values=c("#000000", "#D55E00")) + 
        coord_equal(ratio=1) +
        ggtitle("Question 7_Every 1000th Point")


# q8 let A+ = 1.01 A solve x(n+1) = A+x(n) and plot first 200
# points repeat for .99A, 1.01B and .99B
# A+ = 1.01 A
A = matrix(c(.995, .1, -.1, .995), nrow = 2, ncol = 2)
Aplus=1.01*A

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q8.200 <- matrix.rotate(x0, Aplus, 200)
Aplus200_df <- data.frame(t(q8.200))

ggplot(data = Aplus200_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 8_First 200 Points_1.01A")


#A+ = 0.99A
A = matrix(c(.995, .1, -.1, .995), nrow = 2, ncol = 2)
Apluss=0.99*A

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q88.200 <- matrix.rotate(x0, Apluss, 200)
Apluss200_df <- data.frame(t(q88.200))

ggplot(data = Apluss200_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 8_First 200 Points_0.99A")

#B+ = 1.01 B
B = matrix(c(1, .1, -.1, .99), nrow = 2, ncol = 2)
Bplus=1.01*B

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q8b.200 <- matrix.rotate(x0, Bplus, 200)
Bplus200_df <- data.frame(t(q8b.200))

ggplot(data = Bplus200_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 8_First 200 Points_1.01B")


#B+ = 0.99B
B = matrix(c(1, .1, -.1, .99), nrow = 2, ncol = 2)
Bpluss=0.99*A

x0 = matrix(c(1,0), nrow = 1, ncol = 2)

q88b.200 <- matrix.rotate(x0, Bpluss, 200)
Bpluss200_df <- data.frame(t(q88b.200))

ggplot(data = Bpluss200_df, aes(x = X1, y = X2)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_point() +
  coord_equal(ratio=1) +
  ggtitle("Question 8_First 200 Points_0.99B")