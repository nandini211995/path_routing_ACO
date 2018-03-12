function valid=validMove(direction,ant,phermones,j)

  if(direction==1)
         ant.x(j+1)=ant.x(j);
         ant.y(j+1)=ant.y(j)+1;
        elseif(direction==2)
          
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j)+1;
  
            elseif(direction==3)
            
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j);   
           elseif(direction==4)
            
         ant.x(j+1)=ant.x(j)+1;
         ant.y(j+1)=ant.y(j)-1;
              elseif(direction==5)
         
         ant.x(j+1)=ant.x(j);
         ant.y(j+1)=ant.y(j)-1;
              elseif(direction==6)
                
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j)-1;
              elseif(direction==7)
                
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j);
              elseif(direction==8)
                 
         ant.x(j+1)=ant.x(j)-1;
         ant.y(j+1)=ant.y(j)+1;
  end
            if(phermones(ant.y(j+1),ant.x(j+1))~=0)
                valid=1;
            else
                valid=0;
            end

end