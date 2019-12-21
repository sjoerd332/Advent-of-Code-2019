function [output,memory] = runIntCodeProcessor(memory,inputVar)
currentInstructionAddress = 1;
currentInstruction = 0;

output = [];
outputCnt = 0;
inputCnt  = 0;

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
    inputCnt +=1;
    memory(memory(currentInstructionAddress+1)+1) = inputVar(inputCnt);
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
output;
end

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