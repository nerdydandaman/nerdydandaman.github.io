function cssPthCd = cssPathCode()
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
pxCnvrt=18.92;   % meter to pixel conversion factor (px/m)
vxi=5;           % initial velocity in the x-direction (m/s)
t=1;             % initial time (s)
g=9.8;           % gravitational constant (m/s^2)
mu=.6;           % coefficient of friction (unitless)
msCnvrt=.447;    % miles per hour to meters per second conversion
% Time it takes for the box to fall through the air and hit the ground
tFall=.414;      % (s)

% In order to define each part of the path I'll have to define variable
% covering the pixel locations for each step of the process. I'll use the
% SVG/css naming conventions followed by a number for path markers used
% multiple times. 
Cx3ver0=50+tau*vxi*msCnvrt*pxCnvrt*(1-exp(-.414/tau));       % px
Cx3ver1=round(Cx3ver0);                                      % px
Cx3=int2str(Cx3ver1);                                        % px
Cx2ver0=Cx3-((Cx3-50)/2);                                    % px
Cx2ver0(1)=4;                                                % px
Cx2ver0=Cx2ver0(Cx2ver0~=4);                                 % px
Cx2ver1=round(Cx2ver0);                                      % px
Cx2=int2str(Cx2ver1);                                        % px

% In order to generate each path for the 35 different velocities, I'll use 
% a while loop to generate each path.
while (vxi<41)   
    % Give Matlab the function name to resolve errors
    cssPthCd=vxi*t;
    
    % Calculate x-direction velocity of box at the moment it hits the
    % ground.
    vxs=vxi*exp(-.414/tau);
    
    % Calculate the time it will take for the box to slide off the truck
    tSlide=50/(vxi*msCnvrt*pxCnvrt);                      % (s)
    
    % Calculate the time it will take for the box to slow to a stop
    t=msCnvrt*vxs/(mu*g);
    
    % Calculate the total time for box
    % tTotal=t+tFall+tSlide;                            % (s)
    
    % Calculate the total time for the truck
    tTruckTotal=2030/(vxi*msCnvrt*pxCnvrt);
    
    % Calculate the percentage of total time it takes to slide off
    prcntSlide=(tSlide/tTruckTotal)*100;
    
    % Calculate the percentage of total time it takes to fall
    prcntFall=(tFall/tTruckTotal)*100;
    
    % Percentage of time it takes to fall and slide off summed
    prcntSlideFall=prcntFall+prcntSlide;
    
    % Calculate the percentage of total time it takes to slow to a stop
    prcntStop=(t/tTruckTotal)*100;
    
    % Percentage of time it takes to fall, slide off, and stop summed
    prcntFinal=prcntSlideFall+prcntStop;
    
    % Defines Lx2 using the newly calculated velocity and time values
    Lx2ver0=Cx3ver1+pxCnvrt*(vxs*msCnvrt*t-0.5*mu*g*t^2);         % px
    Lx2ver1=round(Lx2ver0);                                       % px
    Lx2=int2str(Lx2ver1);                                         % px
    
    % Percentage of distance traveled at the point it hits the ground
    prcntGround=(67/Lx2ver1)*100;
    
    % Check if prcntFinal is greater than 100% or not, and set to 100 if so
    if prcntFinal>100 
        prcntFinal=100;
    else
    end
       
    % Define the string to be output and label it
    path="offset-path: path('M0,650 L50,650 C50,650 "+Cx2+",645 "+Cx3+",690 L"+Lx2+",690');";
    
    % In-between the second and third major timestamps defined below, I'll
    % need to write new ones that take the difference between the two
    % timestamps for each velocity, add it to the second percentage, and
    % cause less progress to be made for the later new timestamps to give
    % the effect of slowing down, which will also allow for the truck to
    % speed ahead of the box, as would be proper.
    
    % Calculating the difference
    evenChunks=prcntStop/10;
    chunk1=prcntSlideFall+evenChunks;
    chunk1Hlf=prcntSlideFall+1.5*evenChunks;
    chunk2=prcntSlideFall+2*evenChunks;
    chunk2Hlf=prcntSlideFall+2.5*evenChunks;
    chunk3=prcntSlideFall+3*evenChunks;
    chunk3Hlf=prcntSlideFall+3.5*evenChunks;
    chunk4=prcntSlideFall+4*evenChunks;
    chunk4Hlf=prcntSlideFall+4.5*evenChunks;
    chunk5=prcntSlideFall+5*evenChunks;
    chunk5Hlf=prcntSlideFall+5.5*evenChunks;
    chunk6=prcntSlideFall+6*evenChunks;
    chunk6Hlf=prcntSlideFall+6.5*evenChunks;
    chunk7=prcntSlideFall+7*evenChunks;
    chunk7Hlf=prcntSlideFall+7.5*evenChunks;
    chunk8=prcntSlideFall+8*evenChunks;
    chunk8Hlf=prcntSlideFall+8.5*evenChunks;
    chunk9=prcntSlideFall+9*evenChunks;
    chunk9Hlf=prcntSlideFall+9.5*evenChunks;
    
    % Take the difference between Lx2 and Cx3, split it up into chunks
    % corresponding to the correct location for each time chunk, and
    % convert those to percentages
    %time0Hlf=0.5*t/10;
    time1=t/10;
    time1Hlf=1.5*t/10;
    time2=2*t/10;
    time2Hlf=2.5*t/10;
    time3=3*t/10;
    time3Hlf=3.5*t/10;
    time4=4*t/10;
    time4Hlf=4.5*t/10;
    time5=5*t/10;
    time5Hlf=5.5*t/10;
    time6=6*t/10;
    time6Hlf=6.5*t/10;
    time7=7*t/10;
    time7Hlf=7.5*t/10;
    time8=8*t/10;
    time8Hlf=8.5*t/10;
    time9=9*t/10;
    time9Hlf=9.5*t/10;
    
    % Calculating the position at any one time, convert to percentages
    %xChunk0Hlf=100*(67+pxCnvrt*(vxs*time1-0.5*mu*g*time0Hlf^2))/Lx2ver1;
    xChunk1=100*(67+pxCnvrt*(vxs*msCnvrt*time1-0.5*mu*g*time1^2))/Lx2ver1;
    xChunk1Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time1Hlf-0.5*mu*g*time1Hlf^2))/Lx2ver1;
    xChunk2=100*(67+pxCnvrt*(vxs*msCnvrt*time2-0.5*mu*g*time2^2))/Lx2ver1;
    xChunk2Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time2Hlf-0.5*mu*g*time2Hlf^2))/Lx2ver1;
    xChunk3=100*(67+pxCnvrt*(vxs*msCnvrt*time3-0.5*mu*g*time3^2))/Lx2ver1;
    xChunk3Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time3Hlf-0.5*mu*g*time3Hlf^2))/Lx2ver1;
    xChunk4=100*(67+pxCnvrt*(vxs*msCnvrt*time4-0.5*mu*g*time4^2))/Lx2ver1;
    xChunk4Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time4Hlf-0.5*mu*g*time4Hlf^2))/Lx2ver1;
    xChunk5=100*(67+pxCnvrt*(vxs*msCnvrt*time5-0.5*mu*g*time5^2))/Lx2ver1;
    xChunk5Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time5Hlf-0.5*mu*g*time5Hlf^2))/Lx2ver1;
    xChunk6=100*(67+pxCnvrt*(vxs*msCnvrt*time6-0.5*mu*g*time6^2))/Lx2ver1;
    xChunk6Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time6Hlf-0.5*mu*g*time6Hlf^2))/Lx2ver1;
    xChunk7=100*(67+pxCnvrt*(vxs*msCnvrt*time7-0.5*mu*g*time7^2))/Lx2ver1;
    xChunk7Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time7Hlf-0.5*mu*g*time7Hlf^2))/Lx2ver1;
    xChunk8=100*(67+pxCnvrt*(vxs*msCnvrt*time8-0.5*mu*g*time8^2))/Lx2ver1;
    xChunk8Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time8Hlf-0.5*mu*g*time8Hlf^2))/Lx2ver1;
    xChunk9=100*(67+pxCnvrt*(vxs*msCnvrt*time9-0.5*mu*g*time9^2))/Lx2ver1;
    xChunk9Hlf=100*(67+pxCnvrt*(vxs*msCnvrt*time9Hlf-0.5*mu*g*time9Hlf^2))/Lx2ver1;
    
    % Set distances to 100% if they exceed the value
    if xChunk1Hlf>100
        xChunk1Hlf=100;
    else
    end
    if xChunk2>100
        xChunk2=100;
    else
    end
    if xChunk2Hlf>100
        xChunk2Hlf=100;
    else
    end
    if xChunk3>100
        xChunk3=100;
    else
    end
    if xChunk3Hlf>100
        xChunk3Hlf=100;
    else
    end
    if xChunk4>100
        xChunk4=100;
    else
    end
    if xChunk4Hlf>100
        xChunk4Hlf=100;
    else
    end
    if xChunk5>100
        xChunk5=100;
    else
    end
    if xChunk5Hlf>100
        xChunk5Hlf=100;
    else
    end
    if xChunk6>100
        xChunk6=100;
    else
    end
    if xChunk6Hlf>100
        xChunk6Hlf=100;
    else
    end
    if xChunk7>100
        xChunk7=100;
    else
    end
    if xChunk7Hlf>100
        xChunk7Hlf=100;
    else
    end
    if xChunk8>100
        xChunk8=100;
    else
    end
    if xChunk8Hlf>100
        xChunk8Hlf=100;
    else
    end
    if xChunk9>100
        xChunk9=100;
    else
    end
    if xChunk9Hlf>100
        xChunk9Hlf=100;
    else
    end
    
    % Print code text and label/indicator
    % Path code 
    fprintf("\n"+vxi)
    fprintf("\n"+path)
    % Timestamp code
    fprintf("\n"+"@keyframes movecrate"+vxi+" {")
    fprintf("\n"+"    0%% {")
    fprintf("\n"+"        offset-distance: 0%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+prcntSlide+"%% {")
    fprintf("\n"+"        offset-distance: 50px;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+prcntSlideFall+"%% {")
    fprintf("\n"+"        offset-distance: "+prcntGround+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk1+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk1+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk1Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk1Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk2+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk2+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk2Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk2Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk3+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk3+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk3Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk3Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk4+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk4+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk4Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk4Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk5+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk5+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk5Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk5Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk6+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk6+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk6Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk6Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk7+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk7+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk7Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk7Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk8+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk8+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk8Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk8Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk9+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk9+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+chunk9Hlf+"%% {")
    fprintf("\n"+"        offset-distance: "+xChunk9Hlf+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+prcntFinal+"%% {")
    fprintf("\n"+"        offset-distance: 100%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    100%% {")
    fprintf("\n"+"        offset-distance: 100%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"}")
    fprintf("\n")
    
    % Increment vxi 
    vxi=vxi+1;
end

end