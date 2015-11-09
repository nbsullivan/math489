function ExplorationBeats(e)
%Numerical solution of coupled differential equations
%
%Here we are searching for the numerical solution to a system of second degree 
%differential equations:
%
%(d/dt)^2 x1 = -x1 + e*x2,
%(d/dt)^2 x2 = e*x1 - x2.
%
%The standard solver in MATLAB is ode45 which solves first order differential 
%equations. To use this for second degree cases, we have the following techinque:
%
%1) Let y1 = dx1/dt and y2 = dx2/dt. Then, dy1/dt = d^2 x1/dt^2 and dy2/dt = d^2 
%x2/dt^2. We now have a system of four first order differential equations:
%
%dx1/dt = y1
%dx2/dt = y2
%dy1/dt = d^2 x1/dt^2 = -x1 + e*x2
%dy2/dt = d^2 x2/dt^2 = e*x1 - x2
%
%2) The MATLAB solver prefers variables to have the same letter, so we declare 
%the following: z(1) = x1, z(2) = x2, z(3) = y1, z(4) = y2. In MATLAB code we 
%write the following:

%Value for time
time = 1.5*(2*pi/e);

%The following function sets the variables for the ode solver
    function dz = eqsys(t,z)   %output = functionName(inputs)
        dz = nan*zeros(4,1); %preallocates column vector
        dz(1) = z(3);
        dz(2) = z(4);
        dz(3) = -z(1) + e*z(2);
        dz(4) = e*z(1) - z(2);
    end

%Here we call the ode solver and store as an array [time, values]
%ode45 accepts reference function, time duration, and initial conditions
[T,Z] = ode45(@eqsys,[0 time],[1 0 0 0]);

%We retrieve the values for x1 and x2
X1 = Z(:,1);
X2 = Z(:,2);

%Plotting the graphs
hold on
plot(T,X1,'b','linewidth',2);
plot(T,X2,'r','linewidth',2);

plot([1/e, 1/e],[max([X1;X2]), min([X1;X2])],'--k');

%plot(T,(X1+X2)/2,'g','linewidth',2);  %remove leading '%' to activate
%plot(T,(X1-X2)/2,'m','linewidth',2);  %remove leading '%' to activate

legend('x1','x2','1/e','x1+x2/2','x1-x2/2')
xlabel('time')
ylabel('population')
hold off

end