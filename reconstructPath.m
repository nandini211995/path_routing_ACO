function [ant,count]=reconstructPath(startX,startY,newAnt,length)
count=1;
ant.x(1)=startX;
ant.y(1)=startY;
for j=1:length
    choice=newAnt.path(j);
    if(choice==0);
        continue;
    else
%        plot( ant.x(count), ant.y(count),  'or','MarkerSize',5,'MarkerFaceColor','r')
%        pause(.01)
 if(choice==1)
                ant.path(count)=1;
        ant.x(count+1)=ant.x(count);
        ant.y(count+1)=ant.y(count)+1;
        elseif(choice==2)
            ant.path(count)=2;
        ant.x(count+1)=ant.x(count)+1;
        ant.y(count+1)=ant.y(count)+1;
  
            elseif(choice==3)
                ant.path(count)=3;
        ant.x(count+1)=ant.x(count)+1;
        ant.y(count+1)=ant.y(count);   
           elseif(choice==4)
                ant.path(count)=4;
        ant.x(count+1)=ant.x(count)+1;
        ant.y(count+1)=ant.y(count)-1;
              elseif(choice==5)
                ant.path(count)=5;
        ant.x(count+1)=ant.x(count);
        ant.y(count+1)=ant.y(count)-1;
              elseif(choice==6)
                ant.path(count)=6;
        ant.x(count+1)=ant.x(count)-1;
        ant.y(count+1)=ant.y(count)-1;
              elseif(choice==7)
                ant.path(count)=7;
        ant.x(count+1)=ant.x(count)-1;
        ant.y(count+1)=ant.y(count);
              elseif(choice==8)
                ant.path(count)=8;
        ant.x(count+1)=ant.x(count)-1;
        ant.y(count+1)=ant.y(count)+1;
 end  
          count=count+1;
 end
end

end