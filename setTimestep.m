%bestemme nummerisk feil
function [tidsstegRK4,tidsstegEuler]=setTimestep()

count = 1;
for i = 7:0.5:11
    tic
    timestep = 10^(-i);
    %finner nummerisk feil for alle posisjoner 
[feil_RK4,feil_Euler,xAnalytic] = nummeriskFeil(timestep);
    %Finner største relativ feil for RK4
[absErrorRK4,position] = max(feil_RK4);
relErrorRK4(count) = absErrorRK4/abs(xAnalytic(position));
    %finner største relativ feil for Euler
[absErrorEuler,position] = max(feil_Euler);
relErrorEuler(count) = absErrorEuler/abs(xAnalytic(position));

if relErrorRK4(count)<10^-4
    tidsstegRK4(count) = i;
end

if relErrorEuler(count)<10^-4
    tidsstegEuler(count) = i;
end


count = count+1;
toc
end


t = 7:0.5:11;
% relErrorEuler = relErrorEuler;
% relErrorRK4 = relErrorRK4;
hold on
plot(t,relErrorEuler)
plot(t,relErrorRK4,'r')
