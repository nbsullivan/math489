syms n t

% adjust the bounds of n to get number of summed modes note even modes are
% zero so use twice as many...
L = 1;
n = 1:60;
x0 = linspace(0,1);

y = linspace(0,1);

%there is probably a better way to do this... forming the squarewave
% adjust the if condition to reshape the square wave
for i = 1:length(x0)
    %assigning y(i) = 0 as determined by the function
    if x0(i) < .25 || x0(i) > .75
        y(i) = 0;
    % and assigning y(i) when it should be...
    else 
        y(i) = 1;
    end
end

% create the cn vector
cn = (2/L)*int(sin((n*pi*t)/L),t,1/4,3/4);
% creating the sin vector
sinn = sin((n*pi*x)/L);

%multiply them elementwise and sum them up note even terms of cn = 0
ynf = sum(cn.*sinn);

% subsitute values in for x to get our function values
ynval  = subs(ynf, x, linspace(0,1));

%plotting.
hold on
plot(x0,ynval)
plot(x0,y)
hold off

