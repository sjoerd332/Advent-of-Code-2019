classdef IntCodeProcessor
properties
    input = [];
    output = [];
    memory = [];
    currentInstructionAddress = 1;
    haltCondition = 0;
    relativeBase = 0;
end
methods

function obj = run(obj)
currentInstruction = 0;
outputCnt = 0;
inputCnt  = 0;
obj.output = [];
obj.haltCondition = 0;

while(1)
  [p3 p2 p1 currentInstruction] = obj.getInstruction(obj.memory(obj.currentInstructionAddress));
  if(obj.currentInstructionAddress > length(obj.memory))
    display('ERR: out of memory!');
    obj.haltCondition = 2;
    break;
  end;
  if(obj.relativeBase > length(obj.memory) || obj.relativeBase < 1)
    display('ERR: relative base out of bounds!');
    obj.haltCondition = 6;
    break;
  end;
  if(currentInstruction == 1) % add
    %obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.memory(obj.writeToMemory(p3,3)) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) + ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 2) % multiply
    %obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.memory(obj.writeToMemory(p3,3)) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) * ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 3) % load input
    inputCnt +=1;
    if(inputCnt > length(obj.input))
      obj.haltCondition = 3;
      break;
    end
    %obj.memory(obj.memory(obj.currentInstructionAddress+1)+1) = obj.input(inputCnt);
    obj.memory(obj.writeToMemory(p1,1)) = obj.input(inputCnt);
    obj.currentInstructionAddress += 2;
  elseif(currentInstruction == 4) % load output
    outputCnt += 1;   
    obj.output(outputCnt) = obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1));
    obj.currentInstructionAddress += 2;
  elseif(currentInstruction == 5) % jump if true
    if(obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) != 0)
      obj.currentInstructionAddress = obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2)) +1;
    else
      obj.currentInstructionAddress += 3;
    end
  elseif(currentInstruction == 6) % jump if false
    if(obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) == 0)
      obj.currentInstructionAddress = obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2)) +1;
    else
      obj.currentInstructionAddress += 3;
    end
  elseif(currentInstruction == 7) % less than
    %obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.memory(obj.writeToMemory(p3,1)) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) < ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 8) % equals
    %obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.memory(obj.writeToMemory(p3,1)) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) == ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 9)
    obj.relativeBase = obj.relativeBase + obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1));
    obj.currentInstructionAddress +=2;
  elseif(currentInstruction == 99)
    obj.haltCondition = 1;
    break;
  else
    display('ERR: instruction not implemented!');
    obj.haltCondition = 4;
    break;
  end
end
end

function [p3 p2 p1 instruction] = getInstruction(obj,inp)
  p3 = 0;%floor(inp/10000);
  p2 = floor((inp-10000*p3)/1000);
  p1 = floor((inp-1000*p2-10000*p3)/100);
  instruction = rem(inp,100);
end

function outp = getParameterModeOutput(obj,p,inp)
  if(p == 0) # value at address, position mode
    outp = obj.memory(inp+1);
  end
  if(p == 1) # input value, immediate mode
    outp = inp;
  end
  if(p == 2) # value at relative address, relative mode
    outp = obj.memory(obj.relativeBase +1 + inp);
  end
end

function outp = writeToMemory(obj,p,inp)
  if(p == 0)
    outp = obj.memory(obj.currentInstructionAddress + inp) +1;
  end
  if(p == 1)
    obj.haltCondition = 5;
    display('ERR: not implemented!');
  end
  if(p == 2)
    outp = obj.relativeBase + inp;
  end
end  

end
end