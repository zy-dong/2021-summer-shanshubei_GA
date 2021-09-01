%%cross_speci.m
function [child1,child1_bk,child2,child2_bk] = cross_speci(parent1,parent2,parent1_bk,parent2_bk)%交换段长为6
load("matrix.mat");
L1=size(nonzeros(parent1));
L2=size(nonzeros(parent2));
length1= L1(1);
length2= L2(1);
length=min(length1,length2);
child1=parent1;
child2=parent2;

for i=1:length1-3
    if parent1(i)~=17 && parent1(i)~=16 && parent1(i)~=18
        if parent1(i+1)~=17 && parent1(i+1)~=16 && parent1(i+1)~=18
            if parent1(i+2)~=17 && parent1(i+2)~=16 && parent1(i+2)~=18
                if parent1(i+3)~=17 && parent1(i+3)~=16 && parent1(i+3)~=18
                    temp=i;%temp为交换段的起点
                    child1(i)=parent1(i);
                    child1(i+1)=parent1(i+1);
                    child1(i+2)=parent1(i+2);
                    child1(i+3)=parent1(i+3);
                    break
                end
            end
        end
    end
end
m=[];%m用于存储在另一个父亲中的在子代中还未出现的节点
for i=1:length2
        if parent2(i)~=child1(temp) && parent2(i)~=child1(temp+1) && parent2(i)~=child1(temp+2) && parent2(i)~= child1(temp+3)
            m=[m,parent2(i)];
        end
end
L=size(m);
L=L(2);
for i=1:L
    if i<temp
        child1(i)=m(i);
    end
    if i>=temp
        child1(i+4)=m(i);
    end
end
            

for i=1:length2-3
    if parent2(i)~=17 && parent2(i)~=16 && parent2(i)~=18
        if parent2(i+1)~=17 && parent2(i+1)~=16 && parent2(i)~=18
            if parent2(i+2)~=17 && parent2(i+2)~=16 && parent2(i)~=18
                if parent2(i+3)~=17 && parent2(i+3)~=16 && parent2(i)~=18
                    temp=i;%temp为交换段的起点
                    child2(i)=parent2(i);
                    child2(i+1)=parent2(i+1);
                    child2(i+2)=parent2(i+2);
                    child2(i+3)=parent2(i+3);
                    break
                end
            end
        end
    end
end
m=[];%m用于存储在另一个父亲中的在子代中还未出现的节点
for i=1:length1
        if parent1(i)~=child2(temp) && parent1(i)~=child2(temp+1) && parent1(i)~=child2(temp+2) && parent1(i)~= child2(temp+3)
            m=[m,parent1(i)];
        end
end
L=size(m);
L=L(2);
for i=1:L
    if i<temp
        child2(i)=m(i);
    end
    if i>=temp
        child2(i+4)=m(i);
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


