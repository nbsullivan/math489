function [ modes ] = NonzeroModes( cn, N )
%NONZEROMODES Find nonzero modes
%   cn is a function that gives the Fourier coefficient and N is a matural
%   number. Output is a matrix modes of column vectors representing nonzero
%   modes in which the first entry is the term's index and the second is
%   the value of the term.

epsilon = 1e-14;
k = 1;
j = 1;
modes = zeros(2, N);

% continue execution until we have N nonzero modes
while k < N + 1
    % is c_j close enough to zero that it's more or less zero?
    if abs(cn(j)) > epsilon
        modes(1, k) = j;
        modes(2, k) = cn(j);
        k = k + 1;
    end
    
    j = j + 1;
end

end