clc
clear all
close all

%example 1
##filename = 'ex1.txt';
##filename = 'ex2.txt';
##filename = 'ex3.txt';
##filename =  'ex4.txt';
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
for i = 1:astroids
    for j = 1:astroids
        if(i != j)
            ang(i,j) = atan2((astroid(j,2)-astroid(i,2)),(astroid(j,1)-astroid(i,1)));
        else
            ang(i,j) = Inf;
        end 
    end
    uniques{i} = unique(ang(i,:));
    if(length(uniques{i}) > max1)
        max1 = length(uniques{i})-1; % compensate for self length
        coordinate1 = astroid(i,1)-1; % compensate 1-based grid
        coordinate2 = astroid(i,2)-1;
    end
end

max1
coordinate1
coordinate2