close all, clear all;

mass = load('input.txt')

function fuel = calcFuel(mass)
  fuel = floor(mass/3)-2;
end

ans1 = sum(calcFuel(mass))

for i = 1:length(mass)
  m = mass(i);
  %m = 1969;
  %m = 100756;
  tempFuel = calcFuel(m);
  moduleSum = tempFuel;
  while(calcFuel(tempFuel) > 0)
    tempFuel = calcFuel(tempFuel);
    moduleSum = moduleSum + tempFuel;
  end
  totalFuel(i) = moduleSum;
end

ans2 = sum(totalFuel)
