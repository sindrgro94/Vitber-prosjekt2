function hyperbolicPotentialAndField
V_DC = 5; %5V
V_AC = 0; %0V
r0   = 3; %3mm
<<<<<<< HEAD
l = 0.1; %steglengde for meshgrid
A = 0.01;
[X,Y] = meshgrid(-2*r0:l:2*r0,-2*r0:l:2*r0); %%opprett meshgrip for surface plot
V = V_DC.*(X.^2-Y.^2)./((r0)^2); %% få verdier for V(x,y)
figure(1); %% opprett figur
surf(X,Y,V); %%plot surface V = V(x,y)
colorbar; %%vis colorbar (kanskje unødvendig!)
=======
l = 0.5; %steglengde for meshgrid
[X,Y] = meshgrid(-2*r0:l:2*r0,-2*r0:l:2*r0); %%opprett meshgrip for surface plot
V = V_DC.*(X.^2-Y.^2)./((r0)^2); %% f? verdier for V(x,y)
figure(1); %% opprett figur
surf(X,Y,V); %%plot surface V = V(x,y)
colorbar; %%vis colorbar (kanskje un?dvendig!)
>>>>>>> origin/master

[E_x,E_y] = gradient(-V);
figure(2);
hold on;
streamslice(X,Y,E_x,E_y,'LineColor','k');
x_Charge = [-r0,0,0,r0];
y_Charge = [0,r0,-r0,0];
plot([x_Charge(1),x_Charge(4)],[y_Charge(1),y_Charge(4)],'O','Color','k',...
    'MarkerSize',20);
plot([x_Charge(2),x_Charge(3)],[y_Charge(2),y_Charge(3)],'O','Color','k',...
    'MarkerSize',20);

V1 = A*log(sqrt((X+r0).^2+(Y).^2));
V2 = -A*log(sqrt((X).^2+(Y-r0).^2));
V3 = A*log(sqrt((X-r0).^2+(Y).^2));
V4 = -A*log(sqrt((X).^2+(Y+r0).^2));

V_tot = V1+V2+V3+V4;
[E_x_tot,E_y_tot] = gradient(-V_tot);
figure(3);
contour(V_tot,30);

% figure(4);
% streamslice(X,Y,E_x_tot,E_y_tot);
