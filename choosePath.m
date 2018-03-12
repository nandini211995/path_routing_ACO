function [select,maximum]=choosePath(up,upRight,right,downRight,down,downLeft,left,upLeft,y1,x1,distance,previousPath,beta,maximum)
 stayCourse=6;
if(previousPath~=0)
   dontTake= mod(previousPath+4,8);

    if(dontTake==1)
   up=0.0001;
    elseif(dontTake==2)
    upRight=0.0001;
     elseif(dontTake==3)
    right=0.0001;
     elseif(dontTake==4)
    downRight=0.0001;
     elseif(dontTake==5)
    down=0.0001;
     elseif(dontTake==6)
    downLeft=0.0001;
     elseif(dontTake==7)
    left=0.0001;
     elseif(dontTake==8)
    upLeft=0.0001;
    end
end

if(up==Inf)
   select=1;
elseif(upRight==Inf)
    select=2;
elseif(right==Inf)
   select=3;
   elseif(downRight==Inf)
   select=4;
   elseif(down==Inf)
   select=5;
   elseif(downLeft==Inf)
   select=6;
   elseif(left==Inf)
   select=7;
   elseif(upLeft==Inf)
   select=8;

   

else





    up=up*(distance(y1+1,x1));
    upRight=upRight*(distance(y1+1,x1));
    right=right*(distance(y1,x1+1));
    downRight=downRight*(distance(y1-1,x1+1));
    down=down*(distance(y1-1,x1));
    downLeft=downLeft*(distance(y1-1,x1-1));
    left=left*(distance(y1,x1-1));
    upLeft=upLeft*(distance(y1+1,x1-1));
     X= [up,upRight,right,downRight,down,downLeft,left,upLeft];
    [val, maxProb]=max(X);

%      if(maximum==1)
%    up=up*stayCourse;
%     elseif(maximum==2)
%     upRight=upRight *stayCourse;
%      elseif(maximum==3)
%     right=right*stayCourse;
%      elseif(maximum==4)
%     downRight=downRight *stayCourse;
%      elseif(maximum==5)
%     down=down *stayCourse;
%      elseif(maximum==6)
%     downLeft=downLeft*stayCourse;
%      elseif(maximum==7)
%     left=left*stayCourse;
%      elseif(maximum==8)
%     upLeft=upLeft*stayCourse;
%      end
     
     

%      if(maxProb==1)
%    up=up*beta;
%     elseif(maxProb==2)
%     upRight=upRight *beta;
%      elseif(maxProb==3)
%     right=right*beta;
%      elseif(maxProb==4)
%     downRight=downRight *beta;
%      elseif(maxProb==5)
%     down=down *beta;
%      elseif(maxProb==6)
%     downLeft=downLeft*beta;
%      elseif(maxProb==7)
%     left=left*beta;
%      elseif(maxProb==8)
%     upLeft=upLeft*beta;
%      end
     
     
    
total=up+upRight+right+downRight+down+downLeft+left+upLeft;
    up=up/total;
    upRight=upRight/total;
    right=right/total;
    downRight=downRight/total;
    down=down/total;
    downLeft=downLeft/total;
    left=left/total;
    upLeft=upLeft/total;




 X= [up,upRight,right,downRight,down,downLeft,left,upLeft];



probs=cumsum(X);
x=rand;
if x>0 && x<probs(1)
  select=1;
elseif x>=probs(1) && x<probs(2)
  select=2;
elseif x>=probs(2) && x<probs(3)
  select=3;
  elseif x>=probs(3) && x<probs(4)
  select=4;
  elseif x>=probs(4) && x<probs(5)
  select=5;
  elseif x>=probs(5) && x<probs(6)
  select=6;
  elseif x>=probs(6) && x<probs(7)
  select=7;
  elseif x>=probs(7) && x<probs(8)
  select=8;
end
if(select~=maximum)
    maximum=select;
disp(probs);
disp(select);
end
end
end