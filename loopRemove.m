function [ant,length]=loopRemove(ant,length)
newAnt=struct();
[startIndex,endIndex,maxDifference]=hashTables(ant,length);
if(maxDifference>0)
    i=1;
    count=1;
while(i<=length)
if(i==startIndex)
    i=endIndex;
end
newAnt.x(count)=ant.x(i);
newAnt.y(count)=ant.y(i);
i=i+1;
count=count+1;
end
newLength=length-maxDifference;
[ant,length]=loopRemove(newAnt,newLength);
end


end