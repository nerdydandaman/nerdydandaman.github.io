function lwrResPth = lowerResPath()
% This function generates the paths for the crate and the box at 720p
% Daniel Olson
% Fall Research

% Define Constants
vxi=5;                                                                   % m/s
msCnvrt=.447;                                                            % mi/hr to m/s
pxCnvrt=18.92;                                                           % m/s to px/m
tFall=.414;                                                              % s
tau=66.667;                                                              % s
t=1;                                                                     % s
g=9.8;                                                                   % m/s^2
mu=0.6;                                                                  % unitless
Cx3ver0=(910-tau*vxi*msCnvrt*pxCnvrt*(1-exp(-tFall/tau)))*(2/3);         % px
Cx3verHlf=910-tau*vxi*msCnvrt*pxCnvrt*(1-exp(-tFall/tau));               % px
Cx3verOneHlf=round(Cx3verHlf);                                           % px
Cx3ver1=round(Cx3ver0);                                                  % px
Cx3=int2str(Cx3ver1);                                                    % px
% Define the string to be output and label it
while (vxi<41)
    % Use the actual function to avoid MATLAB error messages
    lwrResPth=vxi*t;
    
    % Calculate version 1 vxs and t
    vxsOld=vxi*exp(-.414/tau);
    tOld=msCnvrt*vxsOld/(mu*g);
    
    % Calculate x-direction velocity of box at the moment it hits the
    % ground.
    vxsOriginal=vxi*exp(-.414/tau);
    vxs=vxi*msCnvrt-vxi*msCnvrt*exp(-.414/tau);
    
    % Calculate the time it will take for the box to slow to a stop
    t=msCnvrt*vxsOriginal/(mu*g);
    
    % Calculate Lx2 for Version 1
    % Re-calculate vxs and t for this version
    Lx2ver0New=(67+pxCnvrt*(vxsOld*msCnvrt*tOld-0.5*mu*g*tOld^2))*(2/3); % px
    Lx2ver1New=round(Lx2ver0New);                                        % px
    Lx2New=int2str(Lx2ver1New);                                          % px
    
    % Calculate Lx2 for Version 2
    Lx2ver0=(Cx3verOneHlf+pxCnvrt*(vxs*t-0.5*mu*g*t^2))*(2/3);           % px
    Lx2ver1=round(Lx2ver0);                                              % px
    Lx2=int2str(Lx2ver1);                                                % px
    
    % Define the paths
    % Version 1 Path
    path1="offset-path: path('M0,433 L33,433 C33,433 35,430 45,460 L"+Lx2New+",460');";
    % Version 2 path
    path="offset-path: path('M640,433 L607,433 C607,433 605,430 "+Cx3+",460 L"+Lx2+",460 L0,460');";
    % Print the output
    fprintf("\n"+vxi)
    fprintf("\n crate path ver2")
    fprintf("\n"+path)
    fprintf("\n crate path original")
    fprintf("\n"+path1)
    
    % Increment the velocity
    vxi=vxi+1;
end

end