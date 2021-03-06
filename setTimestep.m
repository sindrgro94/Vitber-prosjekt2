%bestemme nummerisk feil
function [tidsstegRK4,tidsstegEuler]=setTimestep()
start = 7;
slutt = 9;
count = 1;
for i = start:0.5:slutt
    tic
    timestep = 10^(-i);
    %finner nummerisk feil for alle posisjoner 
[feil_RK4,feil_Euler,xAnalytic] = nummeriskFeil(timestep);
    %Finner st�rste relativ feil for RK4
[absErrorRK4(count),position] = max(feil_RK4);
relErrorRK4(count) = absErrorRK4(count)/abs(xAnalytic(position));
    %finner st�rste relativ feil for Euler
[absErrorEuler(count),position] = max(feil_Euler);
relErrorEuler(count) = absErrorEuler(count)/abs(xAnalytic(position));

if relErrorRK4(count)<10^-4
    tidsstegRK4(count) = i;
end

if relErrorEuler(count)<10^-4
    tidsstegEuler(count) = i;
end


count = count+1;
toc
end


t = (start:0.5:slutt);
relErrorEuler = log10(relErrorEuler);
relErrorRK4 = log10(relErrorRK4);
% relErrorEuler = relErrorEuler;
% relErrorRK4 = relErrorRK4;
fig = figure();
hold on
plot(t,relErrorEuler)
plot(t,relErrorRK4,'r')
%xlim([start,slutt])
set(gca,'FontSize',12);
xlabel('-log(t)')
ylabel('log(\epsilon)')
title('Relativ feil som funksjon av tidsteget')
legend('Euler','RK4')

saveTightFigure(fig,'feilTidssteg')

%Funnet at minste timestep = 10^(-11.5) = 3.1623*10^(-12)
