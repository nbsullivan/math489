function [ ft ] = FourierModesEval( modes, t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
sines = sin(modes(1, :) * pi * t);
cns = conj(modes(2, :)');
ft = sines * cns;
end
