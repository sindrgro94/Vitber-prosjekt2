function plotTestRK4Voltage(xAxes,yAxes)
l = length(xAxes);
newX(1) = xAxes(1);
newY(1) = yAxes(1);
counter = 1;
for i=2:l
    if yAxes(i)>yAxes(i-1)
        counter = counter + 1;
        newX(counter)=xAxes(i);
        newY(counter)=yAxes(i);
        newXend(counter-1)=xAxes(i-1);
        newYend(counter-1)=yAxes(i-1);
    end
end
if (yAxes(l) == yAxes(l-1))
    newXend(counter)=xAxes(l);
    newYend(counter)=yAxes(l);
end
newXend = flip(newXend);
newYend = flip(newYend);
newX = [newX,newXend];
newY = [newY,newYend];
h = figure(2);
plot(newX,newY);
title('stabilitets-diagram')
ylabel('Vdc');
xlabel('Vac');
xlim([5 60]);
ylim([1 10]);
%saveTightFigure(h,'Stabilitets-diagram');
end
