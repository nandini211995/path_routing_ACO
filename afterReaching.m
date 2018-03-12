function phermones= afterReaching(phermones,ant,stepsCount,phermoneUpdate,startX,startY,evap)
           
   for k=1:stepsCount-1
       pathI=ant.path(k);
       pathIplus1=ant.path(k+1);
      [pathI,pathIplus1]= pathResolve(pathI,pathIplus1);
   ant.path(k)=pathI;
   ant.path(k+1)=pathIplus1;
   end
[ant,length]= reconstructPath(startX,startY,ant,stepsCount);
 for k=1:length
      phermones(ant.y(k),ant.x(k))= (1-evap)*phermones(ant.y(k),ant.x(k))+phermoneUpdate/stepsCount;
 end
%   plot( ant.x(k), ant.y(k),  'or','MarkerSize',5,'MarkerFaceColor','r')
%   pause(.01)
%  
   

end