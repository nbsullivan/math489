
library(expm)
library(ggplot2)
# Base Matrices

A <- matrix( c(0,-1,0,1,0,0,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)
R <- matrix( c(1,0,1,0,1,0,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)
U <- matrix( c(1,0,0,0,1,1,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)
Px <- matrix( c(-1,0,0,0,1,0,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)
Py <- matrix( c(1,0,0,0,-1,0,0,0,1), nrow =3, ncol = 3, byrow= TRUE)

# inverse matrices

B <- solve(A)
L <- solve(R)
D <- solve(U)


pointorginal <- matrix( c(2,2,2,2.2,2.2,2,.4,.2,0,0,.2,.2,1,1,1,1,1,1), nrow = 3, ncol = 6, byrow = TRUE)

orginal_df <- data.frame(t(pointorginal))
orginal_df$transform <- "orginal"


#q1
q1 <- A %*% pointorginal
q1a2 <- A %^% 2 %*% pointorginal
q1a3 <- A %^% 3 %*% pointorginal


q1p_df <- data.frame(t(q1))
q1a2_df <- data.frame(t(q1a2))
q1a3_df <- data.frame(t(q1a3))

q1p_df$transform <- "A"
q1a2_df$transform <- "A^2"
q1a3_df$transform <- "A^3"

q1_df <- rbind(orginal_df, q1p_df, q1a3_df, q1a2_df)

ggplot(data = q1_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 1")

ggsave(file = "Question1.jpeg")
#q2

q2a <- B %*% pointorginal

q2b <- A %*% A %*% A %*% pointorginal

q2a_df <- data.frame(t(q2a))
q2b_df <- data.frame(t(q2b))

q2a_df$transform <- "B"
q2b_df$transform <- "A^3"

q2_df <- rbind(orginal_df, q2a_df, q2b_df)

ggplot(data = q2_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 2")

ggsave(file = "Question2.jpeg")

#q3

# applying transforms to orginal points
q3u <- U %*% pointorginal
q3d <- D %*% pointorginal
q3l <- L %*% pointorginal
q3r <- R %*% pointorginal

# converting points to dataframes
q3u_df <- data.frame(t(q3u))
q3d_df <- data.frame(t(q3d))
q3l_df <- data.frame(t(q3l))
q3r_df <- data.frame(t(q3r))

# adding transformation names

q3u_df$transform <- "U"
q3d_df$transform <- "D"
q3l_df$transform <- "L"
q3r_df$transform <- "R"

q3_df <- rbind(orginal_df, q3u_df, q3d_df, q3l_df, q3r_df)

ggplot(data = q3_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 3")

ggsave(file = "Question3.jpeg")
#q4

# applying transforms to orginal points
q4Px <- Px %*% pointorginal
q4Py <- Py %*% pointorginal
q4PxPy <- Px %*% Py %*% pointorginal
q4AA <- A %*% A %*% pointorginal

# converting points to dataframes
q4Px_df <- data.frame(t(q4Px))
q4Py_df <- data.frame(t(q4Py))
q4PxPy_df <- data.frame(t(q4PxPy))
q4AA_df <- data.frame(t(q4AA))

# adding transformation names

q4Px_df$transform <- "Px"
q4Py_df$transform <- "Py"
q4PxPy_df$transform <- "PxPy"
q4AA_df$transform <- "AA"
q4_df <- rbind(orginal_df, q4Px_df, q4Py_df, q4PxPy_df, q4AA_df)

ggplot(data = q4_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 4")

ggsave(file = "Question4.jpeg")

# q5

# so we will flip across the x-axis then move 4 units to the right by applying R^4
q5d <- R %*% R %*% R %*% R %*% Px %*% pointorginal

q5_df <- data.frame(t(q5d))

q5_df$transform <- "R^4 * Px"

q5d_df <- rbind(orginal_df, q5_df)

ggplot(data = q5d_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 5")

ggsave(file = "Question5.jpeg")

# q6

q6r2pxl2 <- R %*% R %*% Px %*% L %*% L %*% pointorginal
q6r4px <- R %*% R %*% R %*% R %*% Px %*% pointorginal
q6pxl4 <- Px %*% L %*% L %*% L %*% L %*% pointorginal

q6r2pxl2_df <- data.frame(t(q6r2pxl2))
q6r4px_df <- data.frame(t(q6r4px))
q6pxl4_df <- data.frame(t(q6pxl4))

q6r2pxl2_df$transform <- "R^2 * Px * L^2"
q6r4px_df$transform <- "R^4 * Px"
q6pxl4_df$transform <- "Px * L^4"

q6_df <- rbind(orginal_df, q6pxl4_df, q6r4px_df, q6r2pxl2_df)

ggplot(data = q6_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 6")

ggsave(file = "Question6.jpeg")


#q7 make a p at (1,3)^T

q7 <- L %*% U %*% U %*% U %*% Py %*% pointorginal

q7p_df <- data.frame(t(q7))
q7p_df$transform <- "L*U^3*Py"

q7_df <- rbind(orginal_df, q7p_df)

ggplot(data = q7_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 7")

ggsave(file = "Question7.jpeg")

#q8 make p at (1,3)^T but without using Py...

q8 <-  U %*% U %*% U %*% L %*% Px %*% A %*% A %*% pointorginal

q8p_df <- data.frame(t(q8))
q8p_df$transform <- "U^3*L*Px*A^2"

q8_df <-rbind(orginal_df, q8p_df)

ggplot(data = q8_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 8")

ggsave(file = "Question8.jpeg")

# q9 make a q at (-1,-2)^t (upper right hand corner)
# do it two ways once without A or B once without Px or Py

# q9a is without Px or Py
# q9b is without A or B
q9a <- D %*% A %*% A %*% pointorginal
q9b <- D %*% Px %*% Py %*% pointorginal

q9a_df <- data.frame(t(q9a))
q9b_df <- data.frame(t(q9b))

q9a_df$transform <- "D*A^2"
q9b_df$transform <- "D*Px*Py"

q9_df <- rbind(orginal_df, q9a_df, q9b_df)

ggplot(data = q9_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 9")

ggsave(file = "Question9.jpeg")
# q10 turn the "b" into a a large "d" double the size of the "b" centered about the orgin

# we will need an additonal matrix E22 which will expand by double
# the magnitude of each set of points

E22 <- matrix( c(2,0,0,0,2,0,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)

q10 <-  E22 %*% R %*% R %*% Px %*% pointorginal

q10D_df <- data.frame(t(q10))
q10D_df$transform <- "E22*R^2*Px"


q10_df <- rbind(orginal_df, q10D_df)

ggplot(data = q10_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 10")

ggsave(file = "Question10.jpeg")
# q11 using Z as described below apply Z repeatedly to the "b", computer Z^2 and Z^3
# will we ever return to I3?

Z <- matrix( c(.8,-.6,0,.6,.8,0,0,0,1), nrow = 3, ncol = 3, byrow = TRUE)

q11a <- Z %*% pointorginal
q11b <- Z %*% Z %*% pointorginal
q11c <- Z %*% Z %*% Z %*% pointorginal

q11a_df <- data.frame(t(q11a))
q11b_df <- data.frame(t(q11b))
q11c_df <- data.frame(t(q11c))

q11a_df$transform <- "Z"
q11b_df$transform <- "Z^2"
q11c_df$transform <- "Z^3"

q11_df <- rbind(orginal_df, q11a_df, q11b_df, q11c_df)

ggplot(data = q11_df, aes(x = X1, y = X2, color = transform)) +
  geom_hline(aes(yintercept = 0)) +
  geom_vline(aes(xintercept = 0)) +
  geom_path() +
  ggtitle("Question 11")

ggsave(file = "Question11.jpeg")

getwd()
 