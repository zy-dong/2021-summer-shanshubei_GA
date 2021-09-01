%%交叉
function [child1,child1_bk,child2,child2_bk] = cross(parent1,parent2,parent1_bk,parent2_bk)
load("matrix.mat");
L1=size(nonzeros(parent1));
L2=size(nonzeros(parent2));
length1= L1(1);
length2= L2(1);
length=min(length1,length2);
child1=parent1;
child2=parent2;
for i=2:length1
    if parent1(i)==16
        for j=-1:5
            child1(i+j)=parent1(i+j);
        end
        temp=i;%temp为子代中16第一次出现的位置
        break
    end
end
m=[];%m用于存储在另一个父亲中的在子代中还未出现的节点
for i=1:length2
    if i==1
        if parent2(i)~=16
            m=[m,parent2(i)];
        end
    end
    if i>=2
        if parent2(i)~=16 && parent2(i)~=17 && parent2(i)~=18 && parent2(i)~=child1(temp-1) && parent2(i)~= child1(temp+5)
            m=[m,parent2(i)];
        end
    end
end
L=size(m);
L=L(2);
for i=1:L
    if i<temp-1
        child1(i)=m(i);
    end
    if i>=temp-1
        child1(i+7)=m(i);
    end
end
            
for i=2:length2
    if parent2(i)==16
        for j=-1:5
            child2(i+j)=parent2(i+j);
        end
        temp=i;%temp为子代中16第一次出现的位置
        break
    end
end
m=[];%m用于存储在另一个父亲中的在子代中还未出现的节点
for i=1:length1
    if i==1
        if parent1(i)~=16
            m=[m,parent1(i)];
        end
    end
    if i>=2
        if parent1(i)~=16 && parent1(i)~=17 && parent1(i)~=18 && parent1(i)~= child2(temp-1) && parent1(i)~= child2(temp+5)
            m=[m,parent1(i)];
        end
    end
end
L=size(m);
L=L(2);
for i=1:L
    if i<temp-1
        child2(i)=m(i);
    end
    if i>=temp-1
        child2(i+7)=m(i);
    end
end        
     c1=zeros(1,35);
     c1=zeros(1,35);
     for i=1:35
         c1(i)=child1(i);
         c2(i)=child2(i);
     end
     child1=c1;
     child2=c2;
     child1_bk=parent1_bk;
     child2_bk=parent2_bk;
     
    
end

