%% Lunar trajectory design
%
%
%
% Gravitational parameters
g = 9.807 ; 
muE = 398600 ;
muM = 4902.8 ;

% Circular insertion orbit
R = 500 + 6378 ;
v = sqrt(muE/R) ;

% Elliptical Earth-Moon trnasfer orbit
rp = R ;
ra = 384400 ;

a = 0.5 * (ra + rp) ;
E = - muE / (2 * a) ;

vp = sqrt (2 * (E + muE / rp)) ;
va = sqrt (2 * (E + muE / ra)) ;

Deltavp = abs(vp - v) 

sqrt (2 * (E + muE / ra));

% Use linked patch method on the moon
vm = 1.02 ;
v_inf = vm - va ;

E_hyp = v_inf^2 / 2 ;

% We put the s/c at 90% of SOI to do the manouvre spending the least amount
% of fuel possible
r_SOI = 0.9 * 0.0661e6 ;
v_SOI = sqrt (muM / r_SOI) ;

Deltav_SOI = abs(v_SOI - v_inf) % to go from hyperbola to circular orbit 

Deltav_i = 2 * v_SOI * sin (pi/4) % to change inclination from 0° to 90°

% Now we go from r_SOI to 100km (we put this constrain, it can be changed)
rp = 100 + 3472/2 ;
ra = r_SOI ;

vc = sqrt(muM/rp);  % On circular orbit with 100km altitude

a = (rp + ra)/2 ;
E = - muM/(2*a) ;

va = sqrt (2 * (E + muM / ra)) ;                                   
vp = sqrt (2 * (E + muM / rp))                                 

DeltavaM = abs(va - v_SOI)
DeltavpM = abs(vc - vp)

% Total cost of the mission (impulse and total mass of propellant)
Deltav_tot = Deltavp + Deltav_SOI + Deltav_i + DeltavaM + DeltavpM 
Deltam_tot = m01 * (1 - exp(- Deltav_tot/c1))                      

% With these parameters the velocity on the 100km altitude orbit is still
% too high for using surface recognition systems. One solution could be
% using SRP combined with an attitude control in order to break little by
% little the spacecraft, also using retro-thrusters that will reduce the
% time required for the spacecraft to reach a sufficiently low velocity.

