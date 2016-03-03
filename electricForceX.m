function xForce = electricForceX(Vdc,Vac,omega,t,position,r0,q)
xForce = -(Vdc+Vac*cos(omega*t))*2*position/r0^2*q;
end