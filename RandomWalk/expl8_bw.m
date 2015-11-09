function dx = expl8_bw(t,x) 

dx = zeros(2,1);                        % create structure for soln

dx(1) = -(2*x(1) - x(1).^2 - x(1).*x(2));     % first eqn
dx(2) = -(3*x(2) - 2*x(1).*x(2) - x(2).^2);   % second eqn

% to plot our solution, use command prompt 