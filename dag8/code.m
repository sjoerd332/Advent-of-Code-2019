clear all;
close all;

f = fopen('input.txt');
lines = textscan(f,'%s');

inp = char(lines);
for i = 1:length(inp)
  in(i) = str2num(inp(i));  
end

width = 25;
height = 6;
pixelsPerLayer = width * height;
amountOfLayers = length(in)/pixelsPerLayer;

minZeros = Inf;
for i = 1:amountOfLayers
   currZeros(i) = sum(in(((i-1)*pixelsPerLayer+1):(i * pixelsPerLayer)) == 0);
   if(currZeros(i) < minZeros)
    minZeros = currZeros(i);
    minZerosLayer = i;
   end
end
minZeros
minZerosLayer
ansPart1 = sum(in(((minZerosLayer-1)*pixelsPerLayer+1):(minZerosLayer * pixelsPerLayer)) == 1) * sum(in(((minZerosLayer-1)*pixelsPerLayer+1):(minZerosLayer * pixelsPerLayer)) == 2)

##plot(currZeros)

##count =0;
##for k = 1:height
##  for j = 1:width
##    count+=1;
##    x(count) = (k-1)*width+j;
##  end  
##end

for k = 1:height
  for j = 1:width
    idx = ((k-1)*width+j):pixelsPerLayer:length(in);
    firstZero = find(in(idx) == 0,1);
    firstOne  = find(in(idx) == 1,1);
    if(length(firstZero)<1), firstZero = Inf;end
    if(length(firstOne)<1), firstOne = Inf;end
    outputPicture(k,j) = in(idx(min(firstZero,firstOne)));
  end  
end

imshow(outputPicture);
##for i = 1:pixelsPerLayer
##  ansPart2(i) = num2str(outputPicture(i));
##end