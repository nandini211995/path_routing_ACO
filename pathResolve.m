function [pathI, pathIplus1] = pathResolve(pathI,pathIplus1)
  if(pathI==1 && pathIplus1==7 || pathI==7 && pathIplus1==1 )
       pathIplus1=8;
       pathI=0;
      elseif(pathI==3 && pathIplus1==5 || pathI==5 && pathIplus1==3 )
       pathIplus1=4;
       pathI=0;
            elseif(pathI==7 && pathIplus1==5 || pathI==5 && pathIplus1==7 )
       pathIplus1=6;
       pathI=0;
            elseif(pathI==7 && pathIplus1==1 || pathI==1 && pathIplus1==7 )
       pathIplus1=8;
       pathI=0;
            elseif(pathI==1 && pathIplus1==4 || pathI==4 && pathIplus1==1 )
       pathIplus1=3;
       pathI=0;
            elseif(pathI==1 && pathIplus1==6 || pathI==6 && pathIplus1==1 )
       pathIplus1=7;
       pathI=0;
            elseif(pathI==3 && pathIplus1==6 || pathI==6 && pathIplus1==3 )
       pathIplus1=5;
       pathI=0;
            elseif(pathI==3 && pathIplus1==8 || pathI==8 && pathIplus1==3 )
       pathIplus1=1;
       pathI=0;
            elseif(pathI==5 && pathIplus1==2 || pathI==2 && pathIplus1==5 )
       pathIplus1=3;
       pathI=0;
            elseif(pathI==5 && pathIplus1==8 || pathI==8 && pathIplus1==5 )
       pathIplus1=7;
       pathI=0;
            elseif(pathI==7 && pathIplus1==2 || pathI==2 && pathIplus1==7 )
       pathIplus1=1;
       pathI=0;
            elseif(pathI==7 && pathIplus1==4 || pathI==4 && pathIplus1==7 )
       pathIplus1=5;
       pathI=0;   
  end
  
end