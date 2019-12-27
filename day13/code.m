close all, clear all;
clc;

proc = IntCodeProcessor;
mem = [1,380,379,385,1008,2823,432584,381,1005,381,12,99,109,2824,1101,0,0,383,1101,0,0,382,20102,1,382,1,20102,1,383,2,21102,1,37,0,1105,1,578,4,382,4,383,204,1,1001,382,1,382,1007,382,42,381,1005,381,22,1001,383,1,383,1007,383,26,381,1005,381,18,1006,385,69,99,104,-1,104,0,4,386,3,384,1007,384,0,381,1005,381,94,107,0,384,381,1005,381,108,1105,1,161,107,1,392,381,1006,381,161,1101,-1,0,384,1105,1,119,1007,392,40,381,1006,381,161,1101,0,1,384,21002,392,1,1,21102,24,1,2,21102,0,1,3,21102,138,1,0,1105,1,549,1,392,384,392,20102,1,392,1,21101,0,24,2,21101,0,3,3,21101,161,0,0,1105,1,549,1101,0,0,384,20001,388,390,1,20101,0,389,2,21101,0,180,0,1106,0,578,1206,1,213,1208,1,2,381,1006,381,205,20001,388,390,1,21002,389,1,2,21101,0,205,0,1106,0,393,1002,390,-1,390,1101,1,0,384,20102,1,388,1,20001,389,391,2,21102,1,228,0,1105,1,578,1206,1,261,1208,1,2,381,1006,381,253,21001,388,0,1,20001,389,391,2,21101,253,0,0,1106,0,393,1002,391,-1,391,1102,1,1,384,1005,384,161,20001,388,390,1,20001,389,391,2,21102,1,279,0,1105,1,578,1206,1,316,1208,1,2,381,1006,381,304,20001,388,390,1,20001,389,391,2,21102,1,304,0,1106,0,393,1002,390,-1,390,1002,391,-1,391,1102,1,1,384,1005,384,161,21001,388,0,1,21002,389,1,2,21101,0,0,3,21101,0,338,0,1106,0,549,1,388,390,388,1,389,391,389,21002,388,1,1,20102,1,389,2,21101,4,0,3,21102,1,365,0,1106,0,549,1007,389,25,381,1005,381,75,104,-1,104,0,104,0,99,0,1,0,0,0,0,0,0,380,19,21,1,1,21,109,3,22102,1,-2,1,21201,-1,0,2,21102,1,0,3,21101,0,414,0,1105,1,549,21201,-2,0,1,21202,-1,1,2,21102,1,429,0,1105,1,601,1202,1,1,435,1,386,0,386,104,-1,104,0,4,386,1001,387,-1,387,1005,387,451,99,109,-3,2105,1,0,109,8,22202,-7,-6,-3,22201,-3,-5,-3,21202,-4,64,-2,2207,-3,-2,381,1005,381,492,21202,-2,-1,-1,22201,-3,-1,-3,2207,-3,-2,381,1006,381,481,21202,-4,8,-2,2207,-3,-2,381,1005,381,518,21202,-2,-1,-1,22201,-3,-1,-3,2207,-3,-2,381,1006,381,507,2207,-3,-4,381,1005,381,540,21202,-4,-1,-1,22201,-3,-1,-3,2207,-3,-4,381,1006,381,529,22102,1,-3,-7,109,-8,2105,1,0,109,4,1202,-2,42,566,201,-3,566,566,101,639,566,566,2102,1,-1,0,204,-3,204,-2,204,-1,109,-4,2105,1,0,109,3,1202,-1,42,594,201,-2,594,594,101,639,594,594,20102,1,0,-2,109,-3,2105,1,0,109,3,22102,26,-2,1,22201,1,-1,1,21101,557,0,2,21102,671,1,3,21101,0,1092,4,21101,630,0,0,1105,1,456,21201,1,1731,-2,109,-3,2106,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,2,2,0,0,2,0,0,0,0,0,2,2,2,0,2,2,2,0,0,2,0,0,0,0,0,2,0,2,0,0,2,2,0,2,2,2,0,0,1,1,0,0,2,2,2,0,0,2,0,2,2,2,2,0,0,2,2,0,2,2,2,2,0,0,0,0,2,0,2,0,2,2,2,2,0,2,0,0,0,0,1,1,0,0,2,2,2,2,0,2,0,2,2,2,0,2,0,0,0,2,0,0,2,2,2,2,2,0,2,0,0,0,2,2,0,0,2,2,2,2,2,0,1,1,0,0,2,2,0,0,0,2,0,2,2,2,2,0,0,0,2,0,0,2,2,2,0,0,2,0,0,0,2,2,2,0,2,0,0,0,2,0,2,0,1,1,0,2,0,0,2,2,2,0,2,2,0,2,0,2,0,0,2,0,0,2,0,0,0,0,0,0,0,2,2,0,2,2,0,0,2,2,2,2,2,0,1,1,0,2,0,2,2,2,2,0,2,0,2,0,2,2,0,2,0,2,0,2,2,2,2,0,0,0,2,2,2,2,2,0,0,2,0,0,0,2,0,0,1,1,0,2,0,2,2,2,2,0,2,2,0,2,2,2,2,2,0,2,2,2,2,0,2,2,0,2,0,2,2,2,0,2,2,2,0,2,0,0,0,0,1,1,0,2,0,2,2,2,2,2,2,2,2,0,0,2,0,0,2,2,2,2,2,0,0,0,2,0,2,0,2,2,0,2,2,0,0,0,2,2,2,0,1,1,0,2,0,0,0,0,2,0,0,2,0,2,0,2,0,0,2,2,2,2,2,0,2,0,0,2,0,2,0,2,2,0,0,2,2,0,0,2,0,0,1,1,0,0,2,0,0,0,2,2,0,0,0,0,2,2,0,0,0,2,2,0,2,0,0,2,2,0,2,2,0,0,2,0,2,2,2,0,0,2,2,0,1,1,0,2,2,2,0,0,2,0,2,2,0,0,2,2,2,2,2,0,2,2,0,2,2,2,2,2,0,2,0,0,2,0,2,0,2,0,2,2,2,0,1,1,0,0,2,0,2,0,0,0,0,2,2,2,2,0,0,0,0,0,2,2,0,2,2,0,2,0,2,2,2,2,0,0,0,0,2,2,0,2,2,0,1,1,0,0,0,2,0,2,2,2,2,2,2,0,2,2,0,0,0,2,0,2,2,0,2,2,2,2,0,2,0,2,0,0,2,0,0,2,2,2,2,0,1,1,0,0,0,2,2,0,2,2,0,2,2,0,0,2,0,2,0,0,2,0,2,0,0,2,0,0,2,0,2,2,2,0,2,2,2,2,0,0,2,0,1,1,0,0,0,2,2,0,2,2,2,0,2,2,0,0,2,0,0,2,2,2,0,0,0,2,0,0,2,0,2,0,0,2,0,2,2,2,0,0,0,0,1,1,0,0,2,0,2,0,2,0,0,2,2,2,0,2,2,2,2,0,2,2,0,2,2,0,0,0,0,2,0,0,2,2,2,0,0,0,2,2,2,0,1,1,0,2,2,0,2,2,0,0,0,0,0,2,2,2,0,2,2,2,0,2,2,0,0,2,2,0,2,0,2,0,2,0,2,0,0,0,2,2,2,0,1,1,0,2,2,0,2,2,2,2,0,2,2,2,2,2,2,2,2,2,2,0,2,0,2,2,0,0,2,2,0,2,0,2,2,2,2,0,0,2,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,26,39,93,24,77,14,80,83,52,91,93,34,84,34,71,69,88,90,9,41,47,38,55,55,97,48,94,51,98,36,7,89,44,29,22,82,9,40,55,30,48,6,30,71,85,16,56,22,20,34,83,79,18,54,97,37,1,18,41,60,62,10,90,5,66,35,59,62,46,39,95,95,75,30,47,81,92,86,41,23,4,60,17,68,1,38,93,38,63,57,19,91,76,36,17,39,33,15,10,38,55,89,90,80,33,41,68,68,88,42,31,24,50,74,41,58,69,57,13,97,83,92,25,23,27,13,50,92,41,82,23,31,11,53,10,10,49,53,50,73,58,12,84,58,10,95,1,28,76,2,53,86,66,98,20,88,30,39,21,47,31,30,78,28,74,63,90,91,88,78,10,64,52,91,18,65,20,16,90,76,2,22,18,43,90,5,59,62,60,71,41,66,64,39,32,90,10,61,52,71,46,61,18,53,82,80,53,39,70,71,81,48,17,26,14,19,69,16,68,39,39,86,31,34,4,11,81,32,55,54,12,93,34,49,50,2,64,61,44,89,13,45,64,45,87,92,16,81,83,18,4,96,43,88,74,27,16,78,10,12,31,38,28,84,50,28,75,74,39,42,43,41,16,5,76,95,88,49,22,43,13,95,66,68,32,79,66,26,82,43,25,79,10,2,77,22,19,81,4,92,42,54,67,62,18,9,69,69,24,69,87,6,53,56,22,20,98,85,3,79,35,4,32,96,25,69,59,23,14,92,19,34,73,42,44,45,7,85,8,31,55,68,84,59,4,18,65,19,61,37,72,29,46,67,64,40,46,82,8,50,57,8,59,83,47,22,16,1,58,41,93,56,60,17,95,24,63,48,47,89,23,12,37,82,19,9,74,30,15,65,1,86,88,93,75,73,11,80,88,36,49,62,57,59,75,43,91,47,93,98,65,30,90,50,93,81,58,43,84,58,24,33,17,83,48,45,91,60,40,87,75,94,26,95,81,93,62,68,73,71,77,56,89,49,26,56,26,4,26,63,16,64,77,33,16,93,21,68,63,55,15,65,23,14,45,35,22,3,78,50,83,45,96,69,79,7,20,6,75,64,8,7,71,85,16,68,27,50,88,31,34,50,32,83,48,1,35,50,90,10,59,19,80,61,83,34,59,25,7,41,48,56,10,64,23,14,85,70,77,73,91,17,36,60,2,1,77,89,39,84,89,76,55,77,51,24,43,2,31,50,46,50,62,22,48,86,38,19,13,2,96,80,74,82,54,84,49,7,4,1,86,33,50,7,37,51,4,54,37,91,11,12,29,77,78,55,98,15,34,82,7,28,41,16,42,73,44,62,70,61,20,76,24,95,78,40,44,24,25,29,85,83,39,48,5,64,43,81,12,8,84,37,47,80,62,53,32,29,87,7,8,41,1,72,9,38,58,64,31,6,23,15,31,3,53,56,34,35,30,57,75,13,56,36,7,87,88,22,91,60,64,10,45,91,43,83,50,23,79,87,4,80,51,11,3,60,56,86,19,83,76,75,43,44,35,75,25,97,40,20,11,51,31,1,23,89,35,41,68,33,93,9,74,80,81,58,13,13,22,80,54,21,93,19,40,25,46,85,75,62,15,54,90,12,10,31,49,89,51,13,57,92,3,17,28,84,36,90,21,12,86,44,87,66,58,24,83,55,13,91,21,70,91,50,94,77,90,35,6,72,79,95,20,2,45,50,77,15,3,97,73,94,54,12,64,30,9,26,45,84,34,95,57,15,88,33,47,62,69,62,89,29,60,34,47,13,86,66,86,75,5,29,50,19,65,70,81,51,62,43,21,61,87,39,19,49,48,7,23,62,52,2,17,31,54,97,98,83,76,98,4,30,31,56,11,89,7,75,46,13,62,32,70,83,29,23,53,40,90,28,45,64,9,35,52,39,77,71,24,40,69,66,59,98,53,15,57,83,50,65,75,26,1,83,17,73,75,34,72,11,66,18,50,77,8,26,80,61,33,84,12,52,13,7,30,26,61,23,10,88,3,80,80,49,29,40,90,65,25,89,55,42,13,98,23,3,19,46,5,94,5,19,72,63,2,20,36,26,20,4,51,77,93,2,25,86,12,7,56,12,61,85,53,12,15,10,13,13,50,73,34,86,59,94,40,36,9,95,74,55,13,19,71,60,63,74,26,24,10,5,21,86,93,62,62,34,47,85,26,94,60,25,9,93,57,57,97,80,6,80,48,22,11,77,50,9,20,23,21,15,33,49,8,76,94,2,61,88,10,24,56,47,43,48,39,12,52,66,19,68,35,26,46,93,27,51,72,98,58,1,24,5,5,9,51,61,3,42,76,98,83,90,49,94,74,79,73,4,46,55,62,16,19,35,51,19,39,64,87,2,95,65,66,26,81,67,35,54,51,70,10,63,76,51,82,67,48,78,15,19,27,37,24,63,97,55,97,7,49,72,7,76,25,82,84,56,94,47,48,44,91,10,432584];
%mem = [mem, zeros(1,1150-length(mem))];
%mem(1) = 2;
proc.memory = mem;

proc.input = [];
proc = proc.run();
output = proc.output;

colors = [0,0,0; % empty - black
          0.6,0.6,0.6; % wall  - grey
          1,0,0; % block - red
          0,1,0; % horizontal paddle - green
          0,0,1]; % ball - blue
for i = 1:length(output)/3
    im(output((i-1)*3+2)+1,output((i-1)*3+1)+1,:) = colors(output(i*3)+1,:);
end

imshow(im)

ansPart1 = sum(im(:) == 2)
