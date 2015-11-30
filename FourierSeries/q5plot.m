
g = @(epsilon) (1/25) * (sin(25 * pi * epsilon))./(sin(pi * epsilon));
figure;
ezplot(g, 0, 1);
saveas(gcf, 'q5plot.pdf');
