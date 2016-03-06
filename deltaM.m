%Funskjon for å bestemme deltaM
function [masse] = deltaM()
timestep = 10^-8;
xPosStart = 1*10^(-3);
yPosStart = 0;
xVelStart = 0;
yVelStart = 0;
zVelStart = 5000;
Vdc = 7; %for fem perioder kan vi bruke Vdc = 3.2222
Vac = 45;
omega = 0;
r0 = 0.0030;
q = 1.60217657*10^(-19);
%mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);
u = 1.660539040*10^(-27);
count = 0;
for m = 0:u:(60*u)
    tic
    count = count +1;
   thru =  RK4success(timestep,xPosStart,yPosStart,...
    xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,m,totalTime);
if thru == 1
    gjennom(count) = 1;
    masse(count)=u*m;
else
    gjennom(count)=0;
end
toc
end

plot(gjennom)
    