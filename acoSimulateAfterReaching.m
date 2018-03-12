function [antsReached, updatedPhermones,minSteps]=acoSimulateAfterReaching(phermones,distanceToGoal,startX,startY,endX,endY,phermoneUpdate,fuel,ants,beta,rows,columns)
ant=struct();
stepsCount=0;
minSteps=Inf;
constant=0.01;
initX=startX;
initY=startY;
antsReached=0;
maximum=0;
j=1;
 for i=1:ants
     maximum=randVal(1,8);
    while(j~=fuel) 
       
        if(j==1)
          
        ant.x(j)=initX;
        ant.y(j)=initY;
      
         
        if(ants==1)
             ant.x(j)=initX;
             ant.y(j)=initY;
        end
             
       end
        if(j~=1)
           previousPath= ant.path(j-1);
        else
            previousPath= 0;
        end
        
       
      [choice,maximum]=choosePath( phermones(ant.y(j)+1,ant.x(j)),phermones(ant.y(j)+1,ant.x(j)+1),phermones(ant.y(j),ant.x(j)+1),phermones(ant.y(j)-1,ant.x(j)+1),phermones(ant.y(j)-1,ant.x(j)),phermones(ant.y(j)-1,ant.x(j)-1),phermones(ant.y(j),ant.x(j)-1),phermones(ant.y(j)+1,ant.x(j)-1) ,ant.y(j),ant.x(j),distanceToGoal,previousPath,beta,maximum);
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
   
       initX= ant.x(j);
       initY= ant.y(j);
       
            stepsCount=stepsCount+1;
         if(ant.x(j)==endX && ant.y(j)==endY )
             antsReached=antsReached+1;
              
       phermones= afterReaching(phermones,ant,stepsCount,phermoneUpdate,startX,startY);
       break;
         end
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