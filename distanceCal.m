function dist= distanceCal(rows,columns,endX,endY)
for i=1:rows
for j=1:columns
    if(j==endX && i==endY)
        dist(i ,j)=1;
    elseif(j==columns || i==rows||i==1||j==1)
        dist(i ,j)=0;
    
    else
    dist(i ,j)= (1/sqrt(((endX-j)^2)+((endY-i)^2)));
    
end

end


end