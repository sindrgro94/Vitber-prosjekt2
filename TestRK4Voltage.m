%%Test av RK4
function TestRK4Voltage()
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
voltageStep = 0.5;
counter = 1;
for Vdc = 1:voltageStep:10
    for Vac = 5:1:60
        success = RK4success(timestep,xPosStart,yPosStart,...
        xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
        if success == 1
            yAxes(counter) = Vdc;
            xAxes(counter) = Vac;
            counter = counter + 1;
        end
    end
end
plot(xAxes,yAxes,'x');
ylabel('Vdc');
xlabel('Vac');
end