classdef IntCodeProcessor
properties
    input = [];
    output = [];
    memory = [];
    currentInstructionAddress = 1;
    haltCondition = 0;
end
methods

function [output,memory, haltCondition, currentInstructionAddress] = run(obj)
currentInstruction = 0;
outputCnt = 0;
inputCnt  = 0;
obj.output = [];
obj.haltCondition = 0;

while(1)
  [p3 p2 p1 currentInstruction] = obj.getInstruction(obj.memory(obj.currentInstructionAddress));
  if(currentInstruction == 1) % add
    obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) + ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 2) % multiply
    obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) * ...
    obj.getParameterModeOutput(p2,memory(currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 3) % load input
    inputCnt +=1;
    if(inputCnt > length(obj.input))
      obj.haltCondition = 3;
      break;
    end
    obj.memory(obj.memory(obj.currentInstructionAddress+1)+1) = obj.input(inputCnt);
    obj.currentInstructionAddress += 2;
  elseif(currentInstruction == 4) % load output
    outputCnt += 1;   
    obj.output(outputCnt) = obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1));
    obj.currentInstructionAddress += 2;
  elseif(currentInstruction == 5) % jump if true
    if(getParameterModeOutput(p1,memory(currentInstructionAddress+1)) != 0)
      obj.currentInstructionAddress = obj.getParameterModeOutput(p2,obj.memory(currentInstructionAddress+2)) +1;
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
    obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) < ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 8) % equals
    obj.memory(obj.memory(obj.currentInstructionAddress+3)+1) = ...
    obj.getParameterModeOutput(p1,obj.memory(obj.currentInstructionAddress+1)) == ...
    obj.getParameterModeOutput(p2,obj.memory(obj.currentInstructionAddress+2));
    obj.currentInstructionAddress += 4;
  elseif(currentInstruction == 99)
    obj.haltCondition = 1;
    break;
  end
  
  if(obj.currentInstructionAddress > length(obj.memory))
    display('ERR: out of memory!');
    obj.haltCondition = 2;
    break;
  end;
end
end

function [p3 p2 p1 instruction] = getInstruction(obj,inp)
  p3 = 0;%floor(inp/10000);
  p2 = floor((inp-10000*p3)/1000);
  p1 = floor((inp-1000*p2-10000*p3)/100);
  instruction = rem(inp,100);
end

function outp = getParameterModeOutput(obj,p,inp)
  if(p == 0)
    outp = obj.memory(inp+1);
  end
  if(p == 1)
    outp = inp;
  end
end

end
end