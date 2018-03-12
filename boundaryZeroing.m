function p=boundaryZeroing(phermones, rows,columns)
initialPhermone=0;
for i=1:rows
      phermones(i,1)=initialPhermone;
      phermones(i,columns)=initialPhermone;
end
for j=1:columns
      phermones(1,j)=initialPhermone;
      phermones(rows,j)=initialPhermone;
end
p=phermones;
end