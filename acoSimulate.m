function [antsReached, updatedPhermones,minSteps]=acoSimulate(phermones,distanceToGoal,distanceToStart,startX,startY,endX,endY,phermoneUpdate,fuel,ants,beta,rows,columns,evaporationRate)
ant=struct();
stepsCount=0;
minSteps=Inf;
constant=0.01;
initX=startX;
initY=startY;
antsReached=0;

stayCourseDistance=6;
j=1;
 for i=1:ants
     randomWalkDirection=randVal(1,8);
    while(j~=fuel)
       
        if(j==1)
            while(1)
%         ant.x(j)=randVal(2,128);
%         ant.y(j)=randVal(2,128);
    ant.x(j)=initX;
             ant.y(j)=initY;
        if(distanceToGoal(ant.y(j),ant.x(j))~=0)
            break;
        end
            end
%         if(i==ants/2)
%              ant.x(j)=initX;
%              ant.y(j)=initY;
%         end
             
       end
        if(j~=1)
           previousPath= ant.path(j-1);
        else
            previousPath= 0;
        end
        
        if(mod(j,stayCourseDistance)==0 || validMove(randomWalkDirection,ant,phermones,j)==0 )
       [choice,randomWalkDirection]=choosePath( phermones(ant.y(j)+1,ant.x(j)),phermones(ant.y(j)+1,ant.x(j)+1),phermones(ant.y(j),ant.x(j)+1),phermones(ant.y(j)-1,ant.x(j)+1),phermones(ant.y(j)-1,ant.x(j)),phermones(ant.y(j)-1,ant.x(j)-1),phermones(ant.y(j),ant.x(j)-1),phermones(ant.y(j)+1,ant.x(j)-1) ,ant.y(j),ant.x(j),distanceToGoal,previousPath,beta,randomWalkDirection);
        else
            choice=randomWalkDirection;
        end
       if(choice==1)
                 ant.path(j)=1;
         ant.x(j+1)=ant.x(j);
         ant.y(j+1)=ant.y(j)+1;
        elseif(choice==2)
             ant.path(j)=2;
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j)+1;
  
            elseif(choice==3)
                 ant.path(j)=3;
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j);   
           elseif(choice==4)
                 ant.path(j)=4;
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j)-1;
              elseif(choice==5)
                 ant.path(j)=5;
         ant.x(j+1)=ant.x(j);
         ant.y(j+1)=ant.y(j)-1;
              elseif(choice==6)
                 ant.path(j)=6;
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j)-1;
              elseif(choice==7)
                 ant.path(j)=7;
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j);
              elseif(choice==8)
                 ant.path(j)=8;
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j)+1;
            
            end
   
 
       
    stepsCount=stepsCount+1;
   % phermones(ant.y(j+1),ant.x(j+1))= (1-evaporationRate)*phermones(ant.y(j+1),ant.x(j+1))+0.1;
    
         if(ant.x(j)==endX && ant.y(j)==endY )
            antsReached=antsReached+1; 
              
       phermones= afterReaching(phermones,ant,stepsCount,phermoneUpdate,startX,startY,evaporationRate);
%          [reached,phermones,minSteps]=acoSimulateAfterReaching(phermones,distanceToStart,endX,endY,startX,startY,phermoneUpdate,fuel,1,beta*2,rows,columns); 
%     if(reached==1)
%           antsReached=antsReached+1;
        break;
         end
%          if(i==1)
%         plot( ant.x(j),  ant.y(j), 'go', 'LineWidth',4);
%          end
          

%             plot( ant.x(j),  ant.y(j), 'or','MarkerSize',5,'MarkerFaceColor','g')
%      
%             pause(.01)
            j=j+1;
    end
         j=1;
        if(minSteps>stepsCount)
            minSteps=stepsCount;
        end
        initX=startX;
        initY=startY;
    stepsCount=0;
end


updatedPhermones=phermones;
disp(antsReached);
disp(minSteps);
end