function [startIndex,endIndex,maxDifference]= hashTables(ant,length)
reverse=length;
mapStartIndices=containers.Map('KeyType','int32','ValueType','int32');
mapEndIndices=containers.Map('KeyType','int32','ValueType','int32');
mapLoopRange=containers.Map('KeyType','int32','ValueType','int32');
for i=1:length
mapEndIndices(ant.x(i)*1000+ant.y(i))=i;
mapStartIndices(ant.x(reverse)*1000+ant.y(reverse))=reverse;
reverse=reverse-1;
end
maxKey=0;
maxDifference=0;
for i=1:length
 difference=mapEndIndices(ant.x(i)*1000+ant.y(i))-mapStartIndices(ant.x(i)*1000+ant.y(i));
  mapLoopRange((ant.x(i)*1000+ant.y(i)))=difference;
  if(difference>maxDifference)
  maxKey=ant.x(i)*1000+ant.y(i);
  maxDifference=difference;
  end
end
if(maxDifference>0)
endIndex=mapEndIndices(maxKey);
startIndex=mapStartIndices(maxKey);
else
    endIndex=0;
startIndex=0;
end
end