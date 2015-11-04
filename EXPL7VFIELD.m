[x1,x2] = meshgrid(0:0.2:3.5,0:0.2:3.5);
dx1 = 2*x1 - x1.^2 - x1.*x2;
dx2 = 3*x2 - 2*x1.*x2 - x2.^2;

quiver(x1,x2,dx1,dx2,10)




