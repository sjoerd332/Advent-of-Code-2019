close all, clear all;

possibleValues = [0, 3:99];
for i = possibleValues
  for j = possibleValues
%noun = 12;
%verb = 2;
noun = i;
verb = j;
%memory = [1,9,10,3,2,3,11,0,99,30,40,50];
%memory = [1,1,1,4,99,5,6,0,99];
memory = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,19,10,23,2,10,23,27,1,27,6,31,1,13,31,35,1,13,35,39,1,39,10,43,2,43,13,47,1,47,9,51,2,51,13,55,1,5,55,59,2,59,9,63,1,13,63,67,2,13,67,71,1,71,5,75,2,75,13,79,1,79,6,83,1,83,5,87,2,87,6,91,1,5,91,95,1,95,13,99,2,99,6,103,1,5,103,107,1,107,9,111,2,6,111,115,1,5,115,119,1,119,2,123,1,6,123,0,99,2,14,0,0];
memory(1+1) = noun;
memory(2+1) = verb;

currentInstructionAddress = 1;
currentInstruction = 0;

while(currentInstruction != 99)
  currentInstruction = memory(currentInstructionAddress);
  if(currentInstruction == 1)
    memory(memory(currentInstructionAddress+3)+1) = memory(memory(currentInstructionAddress+1)+1) + memory(memory(currentInstructionAddress+2)+1);
  elseif(currentInstruction == 2)
    memory(memory(currentInstructionAddress+3)+1) = memory(memory(currentInstructionAddress+1)+1) * memory(memory(currentInstructionAddress+2)+1);
  #else
   # break;
  end
  currentInstructionAddress +=4;
  if(currentInstructionAddress > length(memory))
    break;
  end;
end

memory;
ans1 = memory(1);
if(ans1 == 19690720)
  ans2(i,j) = ans1;
  nounOut(i,j) = noun;
  verbOut(i,j) = verb;
end
end
end

ans2(find(ans2));
nounOut(find(nounOut));
verbOut(find(verbOut));

100*nounOut(find(nounOut))+verbOut(find(verbOut))