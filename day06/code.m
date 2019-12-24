close all, clear all;

f = fopen('orbits.txt');
lines = textscan(f,'%s');

for i = 1:length(lines{1})
  orbits(i,:) = lines{1}(i);
end

orbits = [orbits{:}];
lines = length(regexp(orbits,'\)'));

centerPlanetArrayPosition = regexp(orbits,'COM\)');
planetMap(1).referencePosition = centerPlanetArrayPosition;
planetMap(1).depth = 0;
planetMap(1).orbits = 1;

numberOfParsedOrbits = 1;

function [planetMapOut, numberOfParsedOrbits] = iterate(planetMapIn, numberOfParsedOrbits, orbits, referencePlanetDepth)
  newPlanetName = orbits(planetMapIn(numberOfParsedOrbits).referencePosition + (3:6));
  OrbitsAroundPlanetArrayPosition = regexp(orbits,[newPlanetName,'\)']);
  numberOfOrbitsAroundPlanet = length(OrbitsAroundPlanetArrayPosition);
  numberOfParsedOrbits = numberOfParsedOrbits + 1;
  planetMapOut = planetMapIn;
  planetMapOut(numberOfParsedOrbits).referencePosition = ;
  planetMapOut(numberOfParsedOrbits).depth = referencePlanetDepth + 1;
end

%planetMap: name + orbit diepte
while(numberOfParsedOrbits <= lines)
  
end


