close all;
clear all;

f = fopen('orbits.txt');
lines = textscan(f,'%s');

for i = 1:length(lines{1})
  orbits(i,:) = lines{1}(i);
end

orbits = [orbits{:}];
numberOfLines = length(regexp(orbits,'\)'));
numberOfDirectOrbits = numberOfLines;

listFromPlanetCount = 0;
listFromPlanet = '';
listToPlanetCount = 0;
listToPlanet = '';

nextPlanetPosition = regexp(orbits,'COM\)');
toBeParsedPositions = [];
toBeParsedPositionsLevel = [];
currentLevel = 0;
planetToLevel = [];
endOfPlanetString = false;
%while(nextPlanetPosition > 0 || length(toBeParsedPositions) > 0)
while(1)
  currentPlanetPosition = regexp(orbits,[orbits(nextPlanetPosition:nextPlanetPosition+2),'\)']);
  if(length(currentPlanetPosition) == 0)
    endOfPlanetString = true;
  else % if planets following
    listFromPlanetCount = listFromPlanetCount + 1;
    listFromPlanet = [listFromPlanet; orbits(nextPlanetPosition:nextPlanetPosition+2)];
    planetFromLevel(listFromPlanetCount) = currentLevel;

    toBeParsedPositions = [toBeParsedPositions currentPlanetPosition];
    toBeParsedPositionsLevel = [toBeParsedPositionsLevel, currentLevel*ones(1,length(currentPlanetPosition))];
    %reset level
    
    % register to planets
    for i = 1:length(currentPlanetPosition)
      listToPlanetCount = listToPlanetCount + 1;
      listToPlanet = [listToPlanet; orbits(currentPlanetPosition(i)+4:currentPlanetPosition(i)+6)];
      planetToLevel = [planetToLevel currentLevel+1];
    end
  end
 
  if(endOfPlanetString == true)
    if(length(toBeParsedPositions) < 1)
      break;
    else
      nextPlanetPosition = toBeParsedPositions(1) + 4;
      currentLevel = toBeParsedPositionsLevel(1) + 1;
      toBeParsedPositions = toBeParsedPositions(2:end);
      toBeParsedPositionsLevel = toBeParsedPositionsLevel(2:end);
      endOfPlanetString = false;
    end
  else
    nextPlanetPosition = toBeParsedPositions(end) + 4;
    currentLevel = toBeParsedPositionsLevel(end) + 1;
    toBeParsedPositions = toBeParsedPositions(1:(end-1));
    toBeParsedPositionsLevel = toBeParsedPositionsLevel(1:(end-1));
  end
end

numberOfIndirectOrbits = sum(planetToLevel);

% find shortest path between YOU and SAN
for i = 1:size(listToPlanet,1)
  for j =1:size(listToPlanet,2)
    reorderedList((i-1)*3+j) = listToPlanet(i,j);
  end
end
san = (regexp(reorderedList, 'SAN')-1)/3
sanL = planetToLevel(san)
you = (regexp(reorderedList, 'YOU')-1)/3
youL = planetToLevel(you)
##stairs(planetToLevel)

% find relative position of san and you
youBase = [];
youLevel = 0;
sanBase = [];
sanLevel = 0;
rightPosition = regexp(orbits,'\)YOU')+1;

while(1)
  leftPosition = regexp(orbits,['\)',orbits(rightPosition:rightPosition+2)]);
  if(length(leftPosition) > 0)
    leftPosition = leftPosition - 3;
    youBase = [leftPosition,youBase];
    rightPosition = leftPosition;
    youLevel = youLevel +1;
  else
    break;
  end  
end
rightPosition = regexp(orbits,'\)SAN')+1;
while(1)
  leftPosition = regexp(orbits,['\)',orbits(rightPosition:rightPosition+2)]);
  if(length(leftPosition) > 0)
    leftPosition = leftPosition - 3;
    sanBase = [leftPosition,sanBase];
    rightPosition = leftPosition;
    sanLevel = sanLevel +1;
  else
    break;
  end  
end


youLevel
sanLevel

% find latest common planet

for i = 1:min(length(sanBase),length(youBase))
  if(sanBase(i) != youBase(i))
    latestCommon = i
    break;
  end
end
distance = (youLevel)-latestCommon + (sanLevel)-latestCommon

