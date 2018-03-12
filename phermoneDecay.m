function phermones=phermoneDecay(phermones,evaporationRate,rows,columns)
for i=2:rows-1
    for j=2:columns-1
        if(phermones(i,j)<1)
           phermones(i,j)=1; 
        elseif(phermones(i,j)>1)
            phermones(i,j)=phermones(i,j)*(evaporationRate-1);
            
    end
end
end