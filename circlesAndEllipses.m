%EXPLORATION: CIRCLES AND ELLIPSES
close all

A = [0.995 -0.1; 0.1 0.995];
B = [1 -0.1; 0.1 0.99];
x0 = [1;0];

% Eigenstuff of A
[Va,Da] = eig(A);
a = Va(:,1);
aR = real(a);
aI = imag(a);
eigsA = Da(Da(:)~=0);
[Vb,Db] = eig(B);
b = Vb(:,1);
bR = real(b);
bI = imag(b);
P = [bR, bI];
eigsB = Db(Db(:)~=0);

% Eigenstuff of B
eigA = eigsA(1);
eigB = eigsB(1);
thetaA = atand(imag(eigA)/real(eigA));
thetaB = atand(imag(eigB)/real(eigB));

% Defining for 8
Aplus = 1.01*A;
Aminus = 0.99*A;
Bplus = 1.01*B;
Bminus = 0.99*B;

% Circle matrix to deform into ellipse
C = [cosd(5) cosd(90+5); sind(5) sind(90+5)];
[Vc,Dc] = eig(C);
% c = Vb(:,1);
% cR = real(c);
% cI = imag(c);
% Q = [cR, cI];

%% Rotation Angle Close Points
N = nan*zeros(1001,2);
for i = 1:1001
   N(i,1) = round((i-1)*180/thetaA);
   N(i,2) = round((i-1)*180/thetaB);
end

figure
subplot(1,2,1)
hold on
grid on
for i = N(1:1:length(N)/1,1)'
    x = A^i*x0;
    plot(x(1),x(2),'.')
    axis([-1.5 1.5 -1 1])
    axis equal
end
title('A')

subplot(1,2,2)
hold on
grid on
for i = N(1:1:length(N)/1,2)'
    x = B^i*x0;
    plot(x(1),x(2),'.')
    axis([-1.5 1.5 -1 1])
    axis equal
end
title('B')

%% Plotting

%10 points of A
figure
subplot(2,2,1)
hold on
grid on
for i = 0:10
   x = A^i*x0;
   plot(x(1),x(2),'.')
   axis([-1 1 -1 1])
   axis equal
end

%20 points of A
subplot(2,2,2)
hold on
grid on
for i = 0:20
   x = A^i*x0;
   plot(x(1),x(2),'.')
   axis([-1 1 -1 1])
   axis equal
end

%100 points of A
subplot(2,2,3)
hold on
grid on
for i = 0:100
   x = A^i*x0;
   plot(x(1),x(2),'.')
   axis([-1 1 -1 1])
   axis equal
end
%%%%%%%%%%%%%%%
%10 points of B
figure
subplot(2,2,1)
hold on
grid on
for i = 0:10
   x = B^i*x0;
   plot(x(1),x(2),'.r')
   axis([-1 1 -1 1])
   axis equal
end

%20 points of B
subplot(2,2,2)
hold on
grid on
for i = 0:20
   x = B^i*x0;
   plot(x(1),x(2),'.r')
   axis([-1 1 -1 1])
   axis equal
end

%100 points of B
subplot(2,2,3)
hold on
grid on
for i = 0:100
   x = B^i*x0;
   plot(x(1),x(2),'.r')
   axis([-2 2 -2 2])
   axis equal
end
%%%%%%%%%%%%%%%
% Applying P^-1 to 10 points of B
figure
subplot(2,2,1)
hold on
grid on
for i = 0:10
   x = P^-1*B^i*x0;
   plot(x(1),x(2),'.g')
   axis([-2 2 -2 2])
   axis equal
end

% Applying P^-1 to 20 points of B
subplot(2,2,2)
hold on
grid on
for i = 0:20
   x = P^-1*B^i*x0;
   plot(x(1),x(2),'.g')
   axis([-2 2 -2 2])
   axis equal
end

% Applying P^-1 to 100 points of B
subplot(2,2,3)
hold on
grid on
for i = 0:100
   x = P^-1*B^i*x0;
   plot(x(1),x(2),'.g')
   axis equal
end
%%%%%%%%%%%%%%%
% Plot of circle 10 points
figure
subplot(2,2,1)
hold on
grid on
for i = 0:10
   x = C^i*x0;
   plot(x(1),x(2),'.m')
   axis([-2 2 -2 2])
   axis equal
end

% Plot of circle 20 points
subplot(2,2,2)
hold on
grid on
for i = 0:20
   x = C^i*x0;
   plot(x(1),x(2),'.m')
   axis([-2 2 -2 2])
   axis equal
end

% Plot of circle 100 points
subplot(2,2,3)
hold on
grid on
for i = 0:100
   x = [1 3; 0 1]*C^i*x0;
   plot(x(1),x(2),'.m')
   axis equal
end
%%%%%%%%%%%%%%%
% Plotting every 1000th and 17000th point
figure

hold on
grid on
for i = 0:1000:100000
   x = A^i*x0;
   plot(x(1),x(2),'.k')
   axis equal
end
for i = 0:17000:100000
    x = A^i*x0;
    plot(x(1),x(2),'.r')
end
%%%%%%%%%%%%%%%
% Plotting every 600th point
figure

hold on
grid on
for i = 0:600:100000
   x = A^i*x0;
   plot(x(1),x(2),'.k')
   axis equal
end
for i = 0:14286:100000
    x = A^i*x0;
    %plot(x(1),x(2),'.r')
end
%%%%%%%%%%%%%%%
% Plotting every 500th point and some randomth points
figure

hold on
grid on
for i = 0:500:100000
   x = A^i*x0;
   plot(x(1),x(2),'.k')
   axis equal
end
for i = 0:14286:100000
    x = A^i*x0;
    %plot(x(1),x(2),'.r')
end

