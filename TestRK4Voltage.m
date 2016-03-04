%%Test av RK4
function TestRK4Voltage()
voltageStep = 0.1;
lengde = 0.1;
zVelStart = 5000;
omega = 10^7;
timestep = 3 * 10^(-10);%%Dobbeltsjekk at denne er riktig
xPosStart = 0;
yPosStart = 0;
xVelStart = 0;
yVelStart = 0;
r0 = 0.003;
q = 1.60217657*10^(-19);
mass = 28*1.660539040*10^(-27);
count = 1;
for Vdc = 1:voltageStep:10
    for Vac = 5:voltageStep:60
        success =  RK4success(timestep,xPosStart,yPosStart,...
        xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass);
        if success == 1
        xAxes(count) = Vdc;
        yAxes(count) = Vac;
        count = count + 1;
        end
    end
end
plot(xAxes,yAxes);
end