close all, clear all;
clc;

proc = IntCodeProcessor;
mem = [3,8,1005,8,324,1106,0,11,0,0,0,104,1,104,0,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,0,10,4,10,1001,8,0,29,3,8,1002,8,-1,10,101,1,10,10,4,10,108,0,8,10,4,10,101,0,8,50,1,1106,9,10,1,102,15,10,2,1003,3,10,1,3,19,10,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,1001,8,0,89,1,1105,9,10,2,1103,1,10,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,1,10,4,10,1001,8,0,119,1006,0,26,1,109,7,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,1,8,10,4,10,1002,8,1,147,1006,0,75,1,1005,17,10,3,8,102,-1,8,10,101,1,10,10,4,10,108,0,8,10,4,10,102,1,8,176,3,8,102,-1,8,10,1001,10,1,10,4,10,1008,8,1,10,4,10,102,1,8,199,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,102,1,8,220,2,103,10,10,1,1,0,10,1,102,17,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,101,0,8,254,2,1001,10,10,1006,0,12,1,3,6,10,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,102,1,8,288,2,1106,9,10,2,1009,6,10,2,1101,18,10,2,103,8,10,101,1,9,9,1007,9,1045,10,1005,10,15,99,109,646,104,0,104,1,21101,838211318676,0,1,21102,341,1,0,1106,0,445,21101,0,838211051932,1,21101,0,352,0,1106,0,445,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21101,0,21704576195,1,21101,0,399,0,1106,0,445,21101,0,179356830951,1,21101,410,0,0,1105,1,445,3,10,104,0,104,0,3,10,104,0,104,0,21102,837897052948,1,1,21102,1,433,0,1106,0,445,21102,709052085092,1,1,21102,1,444,0,1105,1,445,99,109,2,21201,-1,0,1,21101,0,40,2,21102,476,1,3,21102,466,1,0,1105,1,509,109,-2,2105,1,0,0,1,0,0,1,109,2,3,10,204,-1,1001,471,472,487,4,0,1001,471,1,471,108,4,471,10,1006,10,503,1102,1,0,471,109,-2,2106,0,0,0,109,4,2102,1,-1,508,1207,-3,0,10,1006,10,526,21101,0,0,-3,21201,-3,0,1,21201,-2,0,2,21101,0,1,3,21101,545,0,0,1105,1,550,109,-4,2105,1,0,109,5,1207,-3,1,10,1006,10,573,2207,-4,-2,10,1006,10,573,21201,-4,0,-4,1105,1,641,22102,1,-4,1,21201,-3,-1,2,21202,-2,2,3,21101,592,0,0,1105,1,550,21201,1,0,-4,21102,1,1,-1,2207,-4,-2,10,1006,10,611,21101,0,0,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,633,21202,-1,1,1,21101,633,0,0,106,0,508,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2105,1,0];
mem = [mem, zeros(1,1150-length(mem))];
proc.memory = mem;

% x,y,color
currentStep = 0;
% part 1 input
%locationMap = [0,0,0]; % x,y, color
%currentStatus = [0,0,1,0]; % x,y,orientation,color (0 right,1 up,2 left,3 down)
% part 2 input
locationMap = [0,0,1]; % x,y, color
currentStatus = [0,0,1,1]; % x,y,orientation,color (0 right,1 up,2 left,3 down)
idx = 1;
while(proc.haltCondition != 1)
    currentStep +=1
    locationLog(currentStep,:) = currentStatus(1:2);
    % run robot
    proc.input = currentStatus(4);
    proc = proc.run();
    if(proc.haltCondition != 3)
        display(['let op, halt condition:', num2str(proc.haltCondition)]);
    end
    output = proc.output;
    col = output(1);
    dir = output(2);
    % update 
    % color current position, always a known position
    locationMap(idx,3) = col;
    
    % current position status update
    if(dir == 0)
        switch currentStatus(3)
        case 0
            currentStatus(3) = 1;
            currentStatus(2) += 1;
        case 1
            currentStatus(3) = 2;    
            currentStatus(1) -= 1;
        case 2
            currentStatus(3) = 3;
            currentStatus(2) -= 1;
        case 3
            currentStatus(3) = 0;
            currentStatus(1) += 1;
        end
    else
        switch currentStatus(3)
        case 0
            currentStatus(3) = 3;
            currentStatus(2) -= 1;
        case 1
            currentStatus(3) = 0;    
            currentStatus(1) += 1;
        case 2
            currentStatus(3) = 1;
            currentStatus(2) += 1;
        case 3
            currentStatus(3) = 2;
            currentStatus(1) -= 1;
        end
    end
    
    %check new position
    idx = 0;
    for i = 1:size(locationMap,1)
       if((locationMap(i,1) == currentStatus(1)) && (locationMap(i,2) == currentStatus(2)))
        idx = i;
       end
    end
    
    % new position
    if(idx < 1)
       locationMap = [locationMap; currentStatus(1:2),0];
       currentStatus(4) = 0;
       idx = size(locationMap,1);
    else % known location
       currentStatus(4) = locationMap(idx,3);
    end

end

scatter(locationMap(:,1),locationMap(:,2),'+')

%x = [];
%for i = 1:length(locationMap)
%    for j = 1:length(locationMap)
%        if(locationMap(i,1) == locationMap(j,1) && locationMap(i,2) == locationMap(j,2))
%            x = [x; locationMap(i,1:2)];
%        end
%    end
%    i
%end
ansPart1 = length(locationMap);

im = zeros(50,50);
for i = 1:length(locationMap)
    im(locationMap(i,1)+1,locationMap(i,2)+10) = locationMap(i,3);
end
imshow(im);