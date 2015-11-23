%q1
[y1, y] = fourierseries(1, 1, 200, .25, .75);
[y2, ya] = fourierseries(1, 2, 200, .25, .75);
[y3, yb] = fourierseries(1, 3, 200, .25, .75);
x = linspace(0,1,200);

%plot of first 3
figure
hold on
plot(x, y)
plot(x, y1, '--')
plot(x, y2, ':')
plot(x, y3, '.')
title('Square Wave with First 3 Nonzero Fourier Modes')
xlabel('x')
ylabel('y')
legend('Exact Square Wave','One Fourier Mode','Two Fourier Modes','Three Fourier Modes')
print('q1plot','-djpeg')
hold off

%q2
[y10, ya] = fourierseries(1, 10, 200, .25, .75);
%plotting 10th fourier approximation
figure
hold on
plot(x, y)
plot(x, y10)
title('Square Wave with 10 Nonzero Fourier Modes')
xlabel('x')
ylabel('y')
legend('Exact Square Wave','Ten Fourier Modes')
print('q2plot','-djpeg')
hold off

%calculating differences

y10error = y10 - y;

figure
hold on
plot(x, y10error)
title('Error of 10th Fourier Approximation')
xlabel('x')
ylabel('y')
legend('Tenth approximation - Square wave')
print('q2errorplot','-djpeg')

%q3
%lets take the 20th,40th,80th approximations and check thier error
[y20, y] = fourierseries(1, 20, 200, .25, .75);
[y40, ya] = fourierseries(1, 40, 200, .25, .75);
[y80, yb] = fourierseries(1, 80, 200, .25, .75);

%calculate the error for each approximation
y20error = y20 - y;
y40error = y40 - y;
y80error = y80 - y;

%plotting errors
%make these plots show up more...
figure
hold on
plot(x, y20error, '--')
plot(x, y40error, ':')
plot(x, y80error, '.')
title('Error of Further Fourier Approximation')
xlabel('x')
ylabel('y')
legend('20th approximation', '40th approximation', '80th approximation')
print('q3plot','-djpeg')
hold off

%q4
[yq410, yq4] = fourierseries(1, 10, 200, 3/8, 5/8);

figure
hold on
plot(x, yq4)
plot(x, yq410)
title('Narrower Square Wave with 10 Nonzero Fourier Modes')
xlabel('x')
ylabel('y')
legend('Exact Square Wave', 'Tenth Appromimation')
print('q4plot','-djpeg')
hold off

yq410error = yq410 - yq4;

figure
hold on
plot(x, yq410error)
title('Error of 10th Fourier Approximation')
xlabel('x')
ylabel('y')
legend('Tenth approximation - Square wave')
print('q4errorplot','-djpeg')


