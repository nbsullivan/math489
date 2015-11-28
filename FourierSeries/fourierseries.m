function [ynval, y] = fourierseries(Li, modes, resolution, sqrlobound, sqrhighbound)


% adjust the bounds of n to get number of summed modes note even modes are
% zero so use twice as many...
L = Li;
t = linspace(0, L, resolution);
y = squarefunc(t, sqrlobound, sqrhighbound);


% create the cn vector
sf = @(x) sin((n * t * pi)/L);
cf = @(n) (2/L) * integral(@(x) sin(n*x*pi/L), sqrlobound, sqrhighbound);
modes_matrix = NonzeroModes(cf, modes);
% vector of nonzero modes
cn = modes_matrix(2, :).';
% vector of indices
n = modes_matrix(1, :).';
% creating the sin vector
sinn = sin((n*pi*t)/L);

%multiply them elementwise and sum them up note even terms of cn = 0
% ynf = sum(cn.*sinn);


% subsitute values in for x to get our function values
% ynval  = subs(ynf, x, x0);

% we aren't using symbolic math so subs is not necessary
% sum(cn .* sinn) is the same as cn.' * sinn

ynval = cn.' * sinn;

end
