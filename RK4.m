%% kj?rer hele forward euler
function xPos= RK4(timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    Vdc,Vac,omega,r0,q,mass,totalTime)

totPoints = uint32(totalTime/timestep);
%%u = 1.660539040*10^(-27)
%%e = 1.60217657*10^(-19) 
%%Preallokering
xPos = zeros(1,totPoints);
yPos = zeros(1,totPoints);
xVel = zeros(1,totPoints);
yVel = zeros(1,totPoints);
count = 1;
%%Startverdier
xPos(count) = xPosStart;
yPos(count) = yPosStart;
xVel(count) = xVelStart;
yVel(count) = yVelStart;
hold on
for time=0:timestep:totalTime
    count = count+1;
    xPos(count) = RK4Step...
        (timestep,xPos(count-1),yPos(count-1),xVel(count-1),yVel(count-1),...
        Vdc,Vac,omega,time,r0,q,mass);
    plot(count*timestep,xPos)
end
%%plot(xPos*10^3,yPos*10^3,'r');


end