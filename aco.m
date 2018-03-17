clc;
clear;
close;
course=imread('office.png');%read course with obstacles
course=rgb2gray(course)/255;
rows=128;% set rows;
columns=rows;%set columns
grid on ;
beta=4;  %the heuristic data constant
ants=1000;% number of ants
evaporationRate=0.4;% the rate at which phermones evaporate
initialPhermone=0.1;% initial phermone to all 8 degrees of freedome

axis([1 rows 1 columns])
[startX ,startY]=ginput(1);% start location
startX=round(startX)+1;
startY=round(startY)+1;
plot(startX, startY, 'bo', 'LineWidth',4);
axis([1 rows 1 columns])
[endX ,endY]=ginput(1);% goal location
endX=round(endX)+1;
endY=round(endY)+1;
axis([1 rows 1 columns])
plot(endX, endY, 'ko', 'LineWidth',4);
axis([1 rows 1 columns])
hold on;

distanceToGoal=distanceCal(rows+2,columns+2,endX,endY);%distance to goal from each pixel
distanceToStart=distanceCal(rows+2,columns+2,startX,startY);%distance to start from each pixel
phermones=ones(rows+2,columns+2)*initialPhermone;% phermones initialization
phermones=boundaryZeroing(phermones,rows+2,columns+2);% boundary elements set to zero for out of bound scenarios
course=boundaryZeroing(course,rows+2,columns+2);%same for phermones
fuel= round(sqrt(rows*rows+columns*columns))*4;%it is the total distance ant can travel (diagonal of the map * constant)
phermoneUpdate=fuel/4;%phermone update in each iteration
stepsCount=0;
%-----------------initializing obstacles of maps------------------------
 for i=1:128
     for j=1:128
         if(course(i,j)==0)
     phermones(i,j)=course(i,j);
     distanceToGoal(i,j)=course(i,j);
     distanceToStart(i,j)=course(i,j);
         end
     end
 end
[antsReached,phermones,minSteps]= acoSimulate(phermones,distanceToGoal,distanceToStart,startX,startY,endX,endY,phermoneUpdate,fuel,ants,beta,rows+2,columns+2,evaporationRate);
plot(startX, startY, 'b*', 'LineWidth',4);
 surf(phermones);




