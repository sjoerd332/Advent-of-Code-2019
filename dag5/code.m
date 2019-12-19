close all, clear all;

% test input part 1
%memory = [2,5,6,7,99,5,5,0];
% part 1
%input = 1;
memory = [3,225,1,225,6,6,1100,1,238,225,104,0,1102,83,20,225,1102,55,83,224,1001,224,-4565,224,4,224,102,8,223,223,101,5,224,224,1,223,224,223,1101,52,15,225,1102,42,92,225,1101,24,65,225,101,33,44,224,101,-125,224,224,4,224,102,8,223,223,1001,224,7,224,1,223,224,223,1001,39,75,224,101,-127,224,224,4,224,1002,223,8,223,1001,224,3,224,1,223,224,223,2,14,48,224,101,-1300,224,224,4,224,1002,223,8,223,1001,224,2,224,1,223,224,223,1002,139,79,224,101,-1896,224,224,4,224,102,8,223,223,1001,224,2,224,1,223,224,223,1102,24,92,225,1101,20,53,224,101,-73,224,224,4,224,102,8,223,223,101,5,224,224,1,223,224,223,1101,70,33,225,1101,56,33,225,1,196,170,224,1001,224,-38,224,4,224,102,8,223,223,101,4,224,224,1,224,223,223,1101,50,5,225,102,91,166,224,1001,224,-3003,224,4,224,102,8,223,223,101,2,224,224,1,224,223,223,4,223,99,0,0,0,677,0,0,0,0,0,0,0,0,0,0,0,1105,0,99999,1105,227,247,1105,1,99999,1005,227,99999,1005,0,256,1105,1,99999,1106,227,99999,1106,0,265,1105,1,99999,1006,0,99999,1006,227,274,1105,1,99999,1105,1,280,1105,1,99999,1,225,225,225,1101,294,0,0,105,1,0,1105,1,99999,1106,0,300,1105,1,99999,1,225,225,225,1101,314,0,0,106,0,0,1105,1,99999,1107,677,677,224,1002,223,2,223,1006,224,329,1001,223,1,223,1107,226,677,224,102,2,223,223,1005,224,344,101,1,223,223,108,677,677,224,1002,223,2,223,1006,224,359,101,1,223,223,107,677,677,224,1002,223,2,223,1006,224,374,1001,223,1,223,1007,677,677,224,102,2,223,223,1006,224,389,101,1,223,223,108,677,226,224,102,2,223,223,1006,224,404,101,1,223,223,1108,226,677,224,102,2,223,223,1005,224,419,1001,223,1,223,7,677,226,224,102,2,223,223,1005,224,434,101,1,223,223,1008,677,677,224,102,2,223,223,1006,224,449,1001,223,1,223,1007,677,226,224,1002,223,2,223,1006,224,464,101,1,223,223,1108,677,677,224,1002,223,2,223,1005,224,479,1001,223,1,223,107,226,226,224,1002,223,2,223,1005,224,494,101,1,223,223,8,226,677,224,102,2,223,223,1006,224,509,101,1,223,223,8,677,677,224,102,2,223,223,1006,224,524,101,1,223,223,1007,226,226,224,1002,223,2,223,1006,224,539,1001,223,1,223,107,677,226,224,102,2,223,223,1006,224,554,101,1,223,223,1107,677,226,224,1002,223,2,223,1006,224,569,1001,223,1,223,1008,226,677,224,102,2,223,223,1006,224,584,1001,223,1,223,1008,226,226,224,1002,223,2,223,1005,224,599,1001,223,1,223,7,677,677,224,1002,223,2,223,1005,224,614,1001,223,1,223,1108,677,226,224,1002,223,2,223,1005,224,629,101,1,223,223,7,226,677,224,1002,223,2,223,1005,224,644,1001,223,1,223,8,677,226,224,102,2,223,223,1005,224,659,101,1,223,223,108,226,226,224,102,2,223,223,1005,224,674,101,1,223,223,4,223,99,226];

% test input part 2
%memory = [3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,...
%1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,...
%999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99];
%input = 9;
% part 2 
input = 5;

currentInstructionAddress = 1;
currentInstruction = 0;

output = [];
outputCnt = 0;

function [p3 p2 p1 currentInstruction] = getInstruction(input)
  p3 = 0;%floor(input/10000);
  p2 = floor((input-10000*p3)/1000);
  p1 = floor((input-1000*p2-10000*p3)/100);
  currentInstruction = rem(input,100);
end

function output = getParameterModeOutput(p,input,memory)
  if(p == 0)
    output = memory(input+1);
  end
  if(p == 1)
    output = input;
  end
end

%while(currentInstruction != 99)
while(1)
  [p3 p2 p1 currentInstruction] = getInstruction(memory(currentInstructionAddress));
  if(currentInstruction == 1) % add
    memory(memory(currentInstructionAddress+3)+1) = getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) + getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory);
    currentInstructionAddress += 4;
  elseif(currentInstruction == 2) % multiply
    memory(memory(currentInstructionAddress+3)+1) = getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) * getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory);
    currentInstructionAddress += 4;
  elseif(currentInstruction == 3) % load input
    memory(memory(currentInstructionAddress+1)+1) = input;
    currentInstructionAddress += 2;
  elseif(currentInstruction == 4) % load output
    outputCnt += 1;   
    output(outputCnt) = getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory);
    currentInstructionAddress += 2;
  elseif(currentInstruction == 5) % jump if true
    if(getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) != 0)
      currentInstructionAddress = getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory) +1;
    else
      currentInstructionAddress += 3;
    end
  elseif(currentInstruction == 6) % jump if false
    if(getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) == 0)
      currentInstructionAddress = getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory) +1;
    else
      currentInstructionAddress += 3;
    end
  elseif(currentInstruction == 7) % less than
    memory(memory(currentInstructionAddress+3)+1) = getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) < getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory);
    currentInstructionAddress += 4;
  elseif(currentInstruction == 8) % equals
    memory(memory(currentInstructionAddress+3)+1) = getParameterModeOutput(p1,memory(currentInstructionAddress+1),memory) == getParameterModeOutput(p2,memory(currentInstructionAddress+2),memory);
    currentInstructionAddress += 4;
  elseif(currentInstruction == 99)
    break;
  end
  
  if(currentInstructionAddress > length(memory))
    display('ERR: out of memory!');
    break;
  end;
end

memory;
output