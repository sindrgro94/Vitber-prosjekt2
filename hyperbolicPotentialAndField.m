function hyperbolicPotentialAndField
V_DC = 5; %5V
V_AC = 0; %0V
r0   = 3; %3mm
l = 0.5 %steglengde for meshgrid
[X,Y] = meshgrid(-2*r0:l:2*r0,-2*r0:l:2*r0); %%opprett meshgrip for surface plot
V = V_DC.*(X.^2-Y.^2)./((r0)^2);
figure(1);
h = surf(X,Y,V);
colorbar;