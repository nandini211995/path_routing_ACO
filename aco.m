clc;
clear;
close;
course=imread('office.png');
course=rgb2gray(course)/255;
rows=128;
maximum=0;
columns=rows;
grid on ;
totObs=0;
beta=4;  %the heuristic data constant
ants=100;% number of ants
evaporationRate=0.4;
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

distanceToGoal=distanceCal(rows+2,columns+2,endX,endY);
distanceToStart=distanceCal(rows+2,columns+2,startX,startY);
phermones=ones(rows+2,columns+2)*initialPhermone;
phermones=boundaryZeroing(phermones,rows+2,columns+2);
course=boundaryZeroing(course,rows+2,columns+2);
fuel= round(sqrt(rows*rows+columns*columns))*4;
phermoneUpdate=fuel/4;%phermone update in each iteration
stepsCount=0;
 
%  phermones(endY,endX)=15;
%  ant(1).x(1)=ones(fuel);
%  ant(1).y(1)=ones(fuel);

 for i=1:128
     for j=1:128
         if(course(i,j)==0)
     phermones(i,j)=course(i,j);
     distanceToGoal(i,j)=course(i,j);
     distanceToStart(i,j)=course(i,j);
         end
     end
 end
%  for i=70:80
%      for j=70:80
%      phermones(i,j)=0;
%      distanceToGoal(i,j)=0;
%       distanceToStart(i,j)=0;
%      end
%  end
[antsReached,phermones,minSteps]= acoSimulate(phermones,distanceToGoal,distanceToStart,startX,startY,endX,endY,phermoneUpdate,fuel,ants,beta,rows+2,columns+2,evaporationRate);

plot(startX, startY, 'b*', 'LineWidth',4);
 surf(phermones);




