function phermones= afterReaching(phermones,ant,stepsCount,phermoneUpdate,startX,startY,evap)
           
%------Minimize steps in path by resolving long path-----------
   for k=1:stepsCount-1
       pathI=ant.path(k);
       pathIplus1=ant.path(k+1);
      [pathI,pathIplus1]= pathResolve(pathI,pathIplus1);
   ant.path(k)=pathI;
   ant.path(k+1)=pathIplus1;
   end
[ant,stepsCount]= reconstructPath(startX,startY,ant,stepsCount);
%-------------------------------------------------------------
%-----Remove loops in the coordinate sets by removing reoccurences-------
[ant,stepsCount]=loopRemove(ant,stepsCount);
%-----------------------------------------------------------------------
%--Update phermone by backtracking------------------
 for k=1:stepsCount
      phermones(ant.y(k),ant.x(k))= (0.6)*phermones(ant.y(k),ant.x(k))+phermoneUpdate/stepsCount;
%         plot( ant.x(k), ant.y(k),  'or','MarkerSize',5,'MarkerFaceColor','r')
%   pause(.01)
 end
%--------------------------------------------------

 
   

end