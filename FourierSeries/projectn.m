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
% print('q1plot','-djpeg')
saveas(gcf, 'q1plot.pdf');
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
% print('q2plot','-djpeg')
saveas(gcf, 'q2plot.pdf');
hold off


% figure
% hold on
% plot(x, y10error)
% title('Error of 10th Fourier Approximation')
% xlabel('x')
% ylabel('y')
% legend('Tenth approximation - Square wave')
% print('q2errorplot','-djpeg')

%q3
%lets take the 20th,40th,80th approximations and check thier error
[y20, y] = fourierseries(1, 20, 200, .25, .75);
[y40, ya] = fourierseries(1, 40, 200, .25, .75);
[y80, yb] = fourierseries(1, 80, 200, .25, .75);

%calculate the error for each approximation

% Use trapz() to compute the L^2([0, 1]) norm of the difference
L2norm = @(x) trapz(x.^2);
y10error = L2norm(y10 - y);
y20error = L2norm(y20 - y);
y40error = L2norm(y40 - y);
y80error = L2norm(y80 - y);
X = [10 20 40 80].';
Y = [y10error y20error y40error y80error].';

%plotting errors
%make these plots show up more...
figure
hold on
bar(X, Y);
title('Error in L^2([0, 1]) norms of differences')
xlabel('number of nonzero modes')
ylabel('error')
% legend('10th approximation', '20th approximation', '40th approximation', '80th approximation')
% print('q3plot','-djpeg')
saveas(gcf, 'q3plot.pdf')
hold off

%q4
[yq410, yq4] = fourierseries(1, 10, 200, 3/8, 5/8);
[yq420, yq4a] = fourierseries(1, 10, 200, 3/8, 5/8);
[yq440, yq4b] = fourierseries(1, 10, 200, 3/8, 5/8);
[yq480, yq4c] = fourierseries(1, 10, 200, 3/8, 5/8);

figure
hold on
plot(x, yq4)
plot(x, yq410)
title('Narrower Square Wave with 10 Nonzero Fourier Modes')
xlabel('x')
ylabel('y')
legend('Exact Square Wave', 'Tenth Appromimation')
% print('q4plot','-djpeg')
saveas(gcf, 'q4plot.pdf');
hold off

% Errors

y410error = L2norm(yq410 - y);
y420error = L2norm(yq420 - y);
y440error = L2norm(yq440 - y);
y480error = L2norm(yq480 - y);
X = [10 20 40 80].';
Y = [y10error y20error y40error y80error].';

%plotting errors
%make these plots show up more...
figure
hold on
bar(X, Y);
title('Error in L^2([0, 1]) norms of differences')
xlabel('number of nonzero modes')
ylabel('error')
% legend('10th approximation', '20th approximation', '40th approximation', '80th approximation')
saveas(gcf, 'q4errorplot.pdf')
hold off
