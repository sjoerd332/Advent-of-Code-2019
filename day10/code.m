clc
clear all
close all

%example 1
##filename = 'ex1.txt';
##filename = 'ex2.txt';
##filename = 'ex3.txt';
%filename =  'ex4.txt';
filename = 'input.txt';

input = textread(filename,'%s');
xLength = length(input(1){:});
yLength = length(input);
astroids = 0;
for y = 1:yLength
    for x = 1:xLength
        if(input(y){1}(x) == '#')
            astroids +=1;
            astroid(astroids,1) = x;
            astroid(astroids,2) = y;
        end
    end
end
max1 = 0;
for i = 1:astroids % 206% speedup part 2
    for j = 1:astroids
        if(i != j)
            ang(i,j) = atan2((astroid(j,2)-astroid(i,2)),(astroid(j,1)-astroid(i,1)));
            rad(i,j) = sqrt((astroid(j,2)-astroid(i,2))^2 + (astroid(j,1)-astroid(i,1))^2 );
        else
            ang(i,j) = Inf;
            rad(i,j) = 0;
        end 
    end
    uniques{i} = unique(ang(i,:));
    if(length(uniques{i}) > max1)
        max1 = length(uniques{i})-1; % compensate for self length
        coordinate1 = astroid(i,1)-1; % compensate 1-based grid
        coordinate2 = astroid(i,2)-1;
        astroidNr = i;
    end
end

max1
coordinate1
coordinate2

% part 2
% remove current astroid from list
ang = ang(astroidNr,([1:astroidNr-1,astroidNr+1:end]));
rad = rad(astroidNr,([1:astroidNr-1,astroidNr+1:end]));
astroid = astroid([1:astroidNr-1,astroidNr+1:end],:);
%map all angles between pi/2 and pi/2 + 2 pi
ang = ang ;%+ pi * 1.5;
%start angle
angle = -pi/2;
unVaporizedAstroids = astroid;
vaporizedAstroids = [];
skipEqualAngles = false;
zapCount = 0;
zapAngle = [];
while(length(unVaporizedAstroids) > 0)
    if(skipEqualAngles)
        differenceAngle = ang + (ang<=angle)*2*pi - angle;
    else
        differenceAngle = ang + (ang<angle)*2*pi - angle;
    end

    maxDifferenceAngle = min(differenceAngle);
    sameAngles = find(differenceAngle == maxDifferenceAngle);
    if(length(sameAngles) > 1)
        skipEqualAngles = true;
    else
        skipEqualAngles = false;
    end
    [minRad,zapIdx] = min(rad(sameAngles));
    vaporizedAstroids = [vaporizedAstroids;unVaporizedAstroids(sameAngles(zapIdx),:)];
    zapCount += 1;
    zapAngle(zapCount) = angle;
    angle = ang(sameAngles(zapIdx));
    unVaporizedAstroids(sameAngles(zapIdx),:) = [];
    ang(sameAngles(zapIdx)) = [];
    rad(sameAngles(zapIdx)) = [];
    differenceAngle = [];
end

ansPart2 = (vaporizedAstroids(200,1)-1)*100+(vaporizedAstroids(200,2)-1)
