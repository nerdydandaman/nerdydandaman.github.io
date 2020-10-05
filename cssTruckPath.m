function cssTrkPth = cssTruckPath()
% Daniel Olson
% Summer Research
% This function will output css code for the path and timing of the motion
% of a box falling off a truck in the truck's reference frame. 
% Define Constants
% mass=20;        % kg
% b=0.3;          % kg/s
tau=66.667;       % s
pxCnvrt=18.92;    % m/s to px/m
vxi=5;            % m/s
g=9.8;            % m/s^2
mu=0.6;           % unitless
t=1;              % s
msCnvrt=.447;     % mi/hr to m/s
tFall=.414;       % s

% Define the path constants
% Mx1=960;                                                 % px
% my1=650;                                                 % px
Lx1=910;                                                   % px
% Ly1=650;                                                 % px
% Cx1=910;                                                 % px
% Cy1=650;                                                 % px
% Cx2=907;                                                 % px
% Cy2=655;                                                 % px
Cx3ver0=Lx1-tau*vxi*msCnvrt*pxCnvrt*(1-exp(-tFall/tau));   % px
Cx3ver1=round(Cx3ver0);                                    % px
Cx3=int2str(Cx3ver1);                                      % px
% Cy3=690;                                                 % px
% Ly2=990;                                                 % px

% Phases of the boxe's movement: Slide 50 px to the left, fall down and to
% the left using a linear drag model for the x-motion and a basic kinematic
% equation for the y-motion, a linear friction  model to the left once it
% has hit the road, slowing down until it "stops," at which point it slides
% to the left at the velocity of the truck.


% Define a loop to write the css code for each velocity
while(vxi<41)
    % Use the actual function to avoid MATLAB error messages
    cssTrkPth=vxi*t;
    
    % Calculate x-direction velocity of box at the moment it hits the
    % ground.
    vxsOriginal=vxi*exp(-.414/tau);
    vxs=vxi*msCnvrt-vxi*msCnvrt*exp(-.414/tau);
    
    % Calculate the time it will take for the box to slide off the truck
    tSlide=50/(vxi*msCnvrt*pxCnvrt);                      % (s)
    
    % Calculate the time it will take for the box to slow to a stop
    t=msCnvrt*vxsOriginal/(mu*g);
    
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
    
    % Calculate the Lx2 path point, which is not the point where it stops,
    % but rather where it starts to translate at the trucks velocity to the
    % left. 
    Lx2ver0=Cx3ver1+pxCnvrt*(vxs*t-0.5*mu*g*t^2);    % px
    Lx2ver1=round(Lx2ver0);                          % px
    Lx2=int2str(Lx2ver1);                            % px
    
    % Percentage of distance traveled at the point it hits the ground
    prcntGround=(67/960)*100;
    
    % Check if prcntFinal is greater than 100% or not, and set to 100 if so
    if prcntFinal>100 
        prcntFinal=100;
    else
    end
       
    % Define the string to be output and label it
    path="offset-path: path('M960,650 L910,650 C910,650 907,645 "+Cx3+",690 L"+Lx2+",690 L0,690');";
    
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
    % corresponding to the correct location for each time chunk.
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
    xChunk1=100*(960-(893+pxCnvrt*(vxs*time1-0.5*mu*g*time1^2)))/(960);
    xChunk1Hlf=100*(960-(893+pxCnvrt*(vxs*time1Hlf-0.5*mu*g*time1Hlf^2)))/(960);
    xChunk2=100*(960-(893+pxCnvrt*(vxs*time2-0.5*mu*g*time2^2)))/(960);
    xChunk2Hlf=100*(960-(893+pxCnvrt*(vxs*time2Hlf-0.5*mu*g*time2Hlf^2)))/(960);
    xChunk3=100*(960-(893+pxCnvrt*(vxs*time3-0.5*mu*g*time3^2)))/(960);
    xChunk3Hlf=100*(960-(893+pxCnvrt*(vxs*time3Hlf-0.5*mu*g*time3Hlf^2)))/(960);
    xChunk4=100*(960-(893+pxCnvrt*(vxs*time4-0.5*mu*g*time4^2)))/(960);
    xChunk4Hlf=100*(960-(893+pxCnvrt*(vxs*time4Hlf-0.5*mu*g*time4Hlf^2)))/(960);
    xChunk5=100*(960-(893+pxCnvrt*(vxs*time5-0.5*mu*g*time5^2)))/(960);
    xChunk5Hlf=100*(960-(893+pxCnvrt*(vxs*time5Hlf-0.5*mu*g*time5Hlf^2)))/(960);
    xChunk6=100*(960-(893+pxCnvrt*(vxs*time6-0.5*mu*g*time6^2)))/(960);
    xChunk6Hlf=100*(960-(893+pxCnvrt*(vxs*time6Hlf-0.5*mu*g*time6Hlf^2)))/(960);
    xChunk7=100*(960-(893+pxCnvrt*(vxs*time7-0.5*mu*g*time7^2)))/(960);
    xChunk7Hlf=100*(960-(893+pxCnvrt*(vxs*time7Hlf-0.5*mu*g*time7Hlf^2)))/(960);
    xChunk8=100*(960-(893+pxCnvrt*(vxs*time8-0.5*mu*g*time8^2)))/(960);
    xChunk8Hlf=100*(960-(893+pxCnvrt*(vxs*time8Hlf-0.5*mu*g*time8Hlf^2)))/(960);
    xChunk9=100*(960-(893+pxCnvrt*(vxs*time9-0.5*mu*g*time9^2)))/(960);
    xChunk9Hlf=100*(960-(893+pxCnvrt*(vxs*time9Hlf-0.5*mu*g*time9Hlf^2)))/(960);
    xChunk10=100*(960-Lx2ver1)/960;
    % 960-Lx2ver1
    
    % Set distances to 100% if they exceed the value
    if prcntGround>100
        prcntGround=100;
    else
    end
    if xChunk1>100
        xChunk1=100;
    else
    end
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
    fprintf("\n"+"@keyframes movecrate"+vxi+"Ver2 {")
    fprintf("\n"+"    0%% {")
    fprintf("\n"+"        offset-distance: 0%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    "+prcntSlide+"%% {")
    fprintf("\n"+"        offset-distance: 5.208%%;")
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
    fprintf("\n"+"        offset-distance: "+xChunk10+"%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"    100%% {")
    fprintf("\n"+"        offset-distance: 100%%;")
    fprintf("\n"+"    }")
    fprintf("\n"+"}")
    % fprintf("\n")
    
    
    % Increment the velocity
    vxi=vxi+1;
    
    % Final Plan: Scrap the idea of calculating where the box actually is
    % so that it can translate at the correct speed once its "reached full
    % speed", as it will do that anyway once you tell it to move linearly,
    % close off the path so that it ends with Lx2,Ly2, then force it to
    % translate to the 0px marker for each case linearly in the remaining
    % time, which should cause it to animate correctly
    % Final Backup Plan: calculate percentages dividing by the full 960 px,
    % then have it translate linearly from there. More thought needed. 
    
    % So here's what's going on: at each of the correctly
    
end
end