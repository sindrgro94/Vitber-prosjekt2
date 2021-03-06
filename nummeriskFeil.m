%Evaluering av nummerisk feil
function [feil_RK4,feil_Euler,xAnalytic] = nummeriskFeil(timestep)
xPosStart = 1*10^(-3);
yPosStart = 0;
xVelStart = 0;
yVelStart = 0;
Vdc = 3.2222; %for fem perioder kan vi bruke Vdc = 3.2222
Vac = 0;
omega = 0;
r0 = 0.0030;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
totalTime = 20*10^(-6);

totPoints = uint32(totalTime/timestep)+1;

%%u = 1.660539040*10^(-27)
%%e = 1.60217657*10^(-19) 

%%Preallokering for RK4
xPos = zeros(1,totPoints);
yPos = zeros(1,totPoints);
xVel = zeros(1,totPoints);
yVel = zeros(1,totPoints);
feil_RK4 = zeros(1,totPoints);
xAnalytic = zeros(1,totPoints);

%%Preallokerer for Euler
xPosEuler = zeros(1,totPoints);
yPosEuler = zeros(1,totPoints);
xVelEuler = zeros(1,totPoints);
yVelEuler = zeros(1,totPoints);
feil_Euler = zeros(1,totPoints);


count = 1; %Tellevariabel

%%Startverdier for RK4
xPos(count) = xPosStart;
yPos(count) = yPosStart;
xVel(count) = xVelStart;
yVel(count) = yVelStart;

%%Startverdier for Euler
xPosEuler(count) = xPosStart;
yPosEuler(count) = yPosStart;
xVelEuler(count) = xVelStart;
yVelEuler(count) = yVelStart;



for time=0:timestep:totalTime
    count = count+1;
    %feil RK4
    [xPos(count),xVel(count),yPos(count),yVel(count)] = RK4Step(timestep,xPos(count-1),yPos(count-1),xVel(count-1),yVel(count-1),...
        Vdc,Vac,omega,time,r0,q,mass);
   
    %feil Euler
    [xPosEuler(count),yPosEuler(count),xVelEuler(count),yVelEuler(count)] = forwardEulerOneStep...
        (timestep,xPosEuler(count-1),yPosEuler(count-1),xVelEuler(count-1),yVelEuler(count-1),...
        Vdc,Vac,omega,time,r0,q,mass);
    

    %Finner analytisk l�sning i hver posisjon og finner feilen 
    xAnalytic(count) = xPosStart*cos(sqrt(Vdc*2*q/(mass*r0^2))*time);
    feil_Euler(count) = abs(xAnalytic(count)-xPosEuler(count));
    feil_RK4(count) = abs(xAnalytic(count)-xPos(count));
end

 t = 0:timestep:totalTime;

%   hold on
% % plot(t,xPos(1:length(t)))
% % plot(t,xAnalytic(1:length(t)))
% % figure()
%  plot(t,feil_RK4(1:length(t)),'g')
% % 
% % hold on
% % figure()
% % plot(t,xPosEuler(1:length(t)),'r')
% % plot(t,x(1:length(t)),'r')
% % figure()
%  plot(t,feil_Euler(1:length(t)))
 fig = figure(); 
hold on
 
  plot(t,feil_Euler(1:length(t)))
  plot(t,feil_RK4(1:length(t)),'r')
  set(gca,'FontSize',12);
  xlabel('t')
  ylabel('Absolutt feil')
  title('Absolutt feil s.f.a. tiden')
  legend('Euler','RK4')
saveTightFigure(fig,'absoluttFeil')




