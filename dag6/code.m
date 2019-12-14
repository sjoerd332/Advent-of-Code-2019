close all, clear all;

f = fopen('orbits.txt');
orbits = textscan(f,'%s');

currentLine = orbits{1}(1);
planetList{1} = currentLine{1}(1:3);
planetList{2} = currentLine{1}(5:7);
planetListLenght = 2;
orbitingPlanetsList = [1 0];

for i  = 2:length(orbits{1})
  currentLine = orbits{1}(i);
   
  if(ismember(planetList,currentLine{1}(1:3)) == 3)
    idx = find(ismember(planetList,currentLine{1}(1:3)));
    orbitingPlanetsList(idx) = orbitingPlanetsList(idx) + 1;
  else
    planetListLenght +=1;
    planetList{planetListLenght} = currentLine{1}(1:3);
    orbitingPlanetsList(planetListLenght) = 1;
  end
  if(!(ismember(currentLine{1}(5:7), planetList)) ==3 )
    planetListLenght +=1;
    planetList{planetListLenght} = currentLine{1}(5:7);
    orbitingPlanetsList(planetListLenght) = 0;
  end
end

plot(orbitingPlanetsList)
sum(orbitingPlanetsList)