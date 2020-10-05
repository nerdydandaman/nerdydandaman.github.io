function cssPthCd=cssPathCode()
% Daniel Olson
% Summer Research
% This function will calculate the correct path for the box to follow for
% each velocity and convert that path's units from meters to pixels. It
% will then output the correct css code for that path that can be
% copy/pasted into the css style sheet.
% Define Constants
mass=20;         % mass kilograms (kg)
b=0.3;           % linear drag coefficient (kg/s)
tau=mass/b;      % convenient constant (s)
pxCnvrt=17.9;    % meter to pixel conversion factor (px/m)
vxi=5;           % initial velocity in the x-direction (m/s)
% t=1;             % initial time (s)
g=9.8;           % gravitational constant (m/s^2)
mu=.6;           % coefficient of friction (unitless)
% vxs=1;           % speed when hitting the ground (m/s)

% In order to define each part of the path I'll have to define variable
% covering the pixel locations for each step of the process. I'll use the
% SVG/css naming conventions followed by a number for path markers used
% multiple times. 
Mx1=0;                                           % px
My1=650;                                         % px
Lx1=50;                                          % px
Ly1=650;                                         % px
Cx1=50;                                          % px
Cy1=650;                                         % px
Cy2=645;                                         % px
Cx3ver0=50+tau*vxi*pxCnvrt*(1-exp(-.414/tau));   % px
Cx3=round(Cx3ver0);                              % px
Cx2ver0=Cx3-((Cx3-50)/2);                        % px
Cx2=round(Cx2ver0);                              % px
Cy3=690;                                         % px
Ly2=690;                                         % px

% In order to generate each path for the 35 different velocities, I'll use 
% a while loop to generate each path.
while (vxi<41)    
    % Calculate x-direction velocity of box at the moment it hits the
    % ground.
    vxs=vxi*exp(-.414/tau);
    
    % Calculate the time it will take for the box to slow to a stop
    t=vxs/(mu*g);
    
    % Defines Lx2 using the newly calculated velocity and time values
    Lx2=Cx3+vxs*t-(mu*g*t^2)/2; % px
    
    
    % Print code text and label/indicator
    fprintf('offset-path: path(M'+Mx1+','+My1+' L'+Lx1+','+Ly1+' C'+Cx1+','+Cy1+' '+Cx2+','+Cy2+' '+Cx3+','+Cy3+' L'+Lx2+','+Ly2+');')
    
    % Increment vxi 
    vxi=vxi+1;
    
    % Give Matlab the function name to resolve errors
    cssPathCode=vxi+1;
    
end

end