function plotPotentialAndField
V_DC = 5; %5V
V_AC = 0; %0V
r0   = 3; %3mm
A = 0.01; % vilkårlig amplitude for kvadrupolens potensialer.
x = linspace(-2*r0,2*r0,200); %%x-vektor for plot
y = x; %y-vektor for plot
[X,Y] = meshgrid(x,y); %%opprett meshgrip for surface plot
x_Charge = [-r0,0,0,r0]; %%posisjoner for ladningene
y_Charge = [0,r0,-r0,0]; %%....

%--------------------------------------------------------------------%

figure(1); %% konturplot for hyperbolsk potensial
V = V_DC.*(X.^2-Y.^2)./((r0)^2); %% f? verdier for V(x,y) hyperbolsk
contour(V,50); %%plot contour of V = V(x,y)
colorbar; %%vis colorbar (kanskje un?dvendig!)

%--------------------------------------------------------------------%

figure(2); %%feltlinjer for hyperbolsk elektrisk felt
hold on;
[E_x,E_y] = gradient(-V);
streamslice(X,Y,E_x,E_y,10);
plot([x_Charge(1),x_Charge(4)],[y_Charge(1),y_Charge(4)],'O','Color','k',...
    'MarkerSize',20); %% plotter ladningene langs x-aksen (som 'O')
plot([x_Charge(2),x_Charge(3)],[y_Charge(2),y_Charge(3)],'O','Color','k',...
    'MarkerSize',20); %% plotter ladningene langs y-aksen (som 'O')

%--------------------------------------------------------------------%

figure(3); %%konturplot for kvadrupolens potensial (V ~ln(r))
V1 = A*log(sqrt((X+r0).^2+(Y).^2));
V2 = -A*log(sqrt((X).^2+(Y-r0).^2));
V3 = A*log(sqrt((X-r0).^2+(Y).^2));
V4 = -A*log(sqrt((X).^2+(Y+r0).^2));
V_tot = V1+V2+V3+V4; %%bruker superposisjon av potensialet
[E_x_tot,E_y_tot] = gradient(-V_tot);
contour(V_tot,50);

%--------------------------------------------------------------------%

figure(4); %%feltlinjer for kvadrupolens elektriske felt (E ~1/r)
 streamslice(x,y,E_x_tot,E_y_tot,10);
 hold on;
plot([x_Charge(1),x_Charge(4)],[y_Charge(1),y_Charge(4)],'O','Color','k',...
    'MarkerSize',20); %%plotter ladningene langs x-aksen
plot([x_Charge(2),x_Charge(3)],[y_Charge(2),y_Charge(3)],'O','Color','k',...
    'MarkerSize',20); %%plotter ladningene langs y-asken

%--------------------------------------------------------------------%
end
