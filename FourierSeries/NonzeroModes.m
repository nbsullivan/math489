function [ modes ] = NonzeroModes( cn, N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

epsilon = 1e-14;
k = 1;
j = 1;
modes = zeros(2, N);

while k < N + 1
    if abs(cn(j)) > epsilon
        modes(1, k) = j;
        modes(2, k) = cn(j);
        k = k + 1;
    end
    
    j = j + 1;
end

end

