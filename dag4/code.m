close all, clear all;

digits = zeros(1,6);
count = 0;
for i = 382345:843167
  digits(1) = rem(i,10);
  digits(2) = rem(floor(i/10),10);
  digits(3) = rem(floor(i/100),10);
  digits(4) = rem(floor(i/1000),10);
  digits(5) = rem(floor(i/10000),10);
  digits(6) = rem(floor(i/100000),10);
  
  if(digits(1) >= digits(2) && digits(2) >= digits(3) && digits(3) >= digits(4) && digits(4) >= digits(5) && digits(5) >= digits(6) )
    if( (digits(1) == digits(2) && digits(2) != digits(3))...
      ||(digits(2) == digits(3) && digits(2) != digits(1) && digits(3) != digits(4))...
      ||(digits(3) == digits(4) && digits(3) != digits(2) && digits(4) != digits(5))...
      ||(digits(4) == digits(5) && digits(4) != digits(3) && digits(5) != digits(6))...
      ||(digits(5) == digits(6) && digits(5) != digits(4)))
      count +=1;
      number(count) = i;
    end
  end
endfor

count