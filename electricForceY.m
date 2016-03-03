function yForce = electricForceY(Vdc,Vac,omega,t,position,r0,q)
yForce = (Vdc+Vac*cos(omega*t))*2*position/r0^2*q;
end