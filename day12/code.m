clc;
clear all;
close all;

% ex 1
%pos = [-1,0,2;...
%       2,-10,-7;...
%       4,-8,8;...
%       3,5,-1];
% ex2
%pos = [ x=-8, y=-10, z=0;
%        x=5, y=5, z=10;
%        x=2, y=-7, z=3;
%        x=9, y=-8, z=-3];
% input
pos = [ x=10, y=15, z=7;
        x=15, y=10, z=0;
        x=20, y=12, z=3;
        x=0, y=-3, z=13];
vel = zeros(size(pos));

initialPos = pos;
initialVel = vel;

simStepCounter =0;
planetCount = [1,2,3,4];
numberOfPlanets = 4;
while(simStepCounter < 1000)
    simStepCounter +=1;
    % calc vel
    for i = 1:numberOfPlanets
       for j = 1:3
           positive = sum(pos(planetCount~=i,j) > pos(i,j));
           equal    = sum(pos(planetCount~=i,j) == pos(i,j));
           negative = sum(pos(planetCount~=i,j) < pos(i,j));
           vel(i,j) += positive - negative;
       end
    end
    % calc pos
    pos +=vel;
    % calc energy
    Ekin = sum(abs(vel),2);
    Epot = sum(abs(pos),2);
end

ansPart1 = sum(Ekin .* Epot)

% calculate x y z period separately
for j = 1:3
    equalToInitialCond = false;
    simStepCounter = 0;
    pos = initialPos; % should not be needed, coordinates independent
    vel = initialVel;
while(equalToInitialCond == false)
    simStepCounter +=1;
    % calc vel
    for i = 1:numberOfPlanets
%       for j = 3
           positive = sum(pos(planetCount~=i,j) > pos(i,j));
           equal    = sum(pos(planetCount~=i,j) == pos(i,j));
           negative = sum(pos(planetCount~=i,j) < pos(i,j));
           vel(i,j) += positive - negative;
%       end
    end
    % calc pos
    pos +=vel;
    % calc energy
%    Ekin = sum(abs(vel),2);
%    Epot = sum(abs(pos),2);
    
    condPos = pos == initialPos;
    condVel = vel == initialVel;
    if(all(condPos(:)) && all(condVel(:)))
        equalToInitialCond = true;
    end
end
counts(j) = simStepCounter;
end

ansPart2 = lcm(lcm(counts(1),counts(2)),counts(3))