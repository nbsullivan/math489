function fourierseries(Li, modes, resolution, sqrlobound, sqrhighbound)
syms n t x

% adjust the bounds of n to get number of summed modes note even modes are
% zero so use twice as many...
L = Li;
n = 1:2*modes;
x0 = linspace(0,L,resolution);

y = linspace(0,1,resolution);

%there is probably a better way to do this... forming the squarewave
% adjust the if condition to reshape the square wave
for i = 1:length(x0)
    %assigning y(i) = 0 as determined by the function
    if x0(i) < sqrlobound || x0(i) > sqrhighbound
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
ynval  = subs(ynf, x, x0);

%plotting.
hold on
plot(x0,ynval)
plot(x0,y)
hold off

% %starting to work on the gibbs phenom errors part...
% 
% yerror = ynval - y;
% 
% plot(x0,yerror)

end

