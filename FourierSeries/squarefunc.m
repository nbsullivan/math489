function [ ft ] = squarefunc( t, a, b )
%SQUAREFUNC Square wave
%   Function for Fourier series project with lower bound a and upper bound
%   b.

% ft is 1 if t in (a, b) and 0 otherwise
ft(t > a & t < b) = 1;
ft(t <= a) = 0;
ft(t >= b) = 0;


end

