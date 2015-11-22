syms n t k
% setting up n t and k as symbolics

% setting interval length and that we want the first 20 terms of cn
% as the the even cns will be zero

L = 1;
n = 1:20;

%defining the cns
cn = (2/L)*int(sin((n*pi*t)/L),t,1/4,3/4);

% alocating space for x and y where y is our basic squarewave
x = linspace(0,1);
y = linspace(0,1);

%there is probably a better way to do this...
for i = 1:length(x)
    %assigning y(i) = 0 as determined by the function
    if x(i) < .25 || x(i) > .75
        y(i) = 0;
    % and assigning y(i) when it should be...
    else 
        y(i) = 1;
    end
end

y1 = cn(1) * sin((1*pi*x)/L);
y2 = y1 + cn(3) * sin((3*pi*x)/L);
y3 = y2+ cn(5) * sin((5*pi*x)/L);
y4 = y3+ cn(7) * sin((7*pi*x)/L);
y5 = y4+ cn(9) * sin((9*pi*x)/L);
y6 = y5+ cn(11) * sin((11*pi*x)/L);
y7 = y6+ cn(13) * sin((13*pi*x)/L);
y8 = y7+ cn(15) * sin((15*pi*x)/L);
y9 = y8+ cn(17) * sin((17*pi*x)/L);
y10 = y9+ cn(19) * sin((19*pi*x)/L);
%first 3 modes
hold on
plot(x,y)
plot(x,y1)
plot(x,y2)
plot(x,y3)
title('First 3 Fourier Modes')
hold off
print('Q1Fouirer','-dpng')
% first 10 modes
hold on
plot(x,y)
plot(x,y1)
plot(x,y2)
plot(x,y3)
plot(x,y4)
plot(x,y5)
plot(x,y6)
plot(x,y7)
plot(x,y8)
plot(x,y9)
plot(x,y10)
title('First 10 Fourier Modes')
hold off
print('Q2Fourier', '-dpng')

