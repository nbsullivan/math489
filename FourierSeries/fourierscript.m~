
cn = @(n) (2/(n * pi)) * (cos(n * pi / 4) - cos(3 * n * pi / 4));

modes = NonzeroModes(cn, 5);
ft = @(t) FourierModesEval(modes, t);

ezplot(ft);
