%%Test av RK4
function TestRK4Voltage()
[timestep,xPosStart,yPosStart,xVelStart, yVelStart,...
    zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime] = getVariables();
voltageStep = 0.5;
VacStart = 5;
counter = 1;
for Vdc = 1:voltageStep:10
    first = 1; %%optimalisering for ? slippe ? kj?re RK4 s? mange ganger
    for Vac = VacStart:1:60
        success = RK4success(timestep,xPosStart,yPosStart,...
        xVelStart, yVelStart,zVelStart,Vdc,Vac,omega,r0,q,mass,totalTime);
        if success == 1
            yAxes(counter) = Vdc;
            xAxes(counter) = Vac;
            counter = counter + 1;
            if first == 1
                VacStart = Vac;
                first = 0;
            end
        end
    end
end
plot(xAxes,yAxes,'x');
ylabel('Vdc');
xlabel('Vac');
xlim([5 60]);
ylim([1 10]);
end