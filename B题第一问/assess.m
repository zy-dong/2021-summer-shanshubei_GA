%%适应度函数，计算出两个巡检员较长的路径长度
function [length] = assess(onepath,b)%path为路径，b为中断点
load("matrix");
agent1=NB_Matrix(5,onepath(1));
agent2=NB_Matrix(5,onepath(b+1));
length=size(nonzeros(onepath));
length=length(1);
x=2;
while x<=b
    agent1=agent1+NB_Matrix(onepath(x-1),onepath(x));
    x=x+1;
end
agent1=agent1+NB_Matrix(onepath(b),5);

while x+1<=length %onepath(x+1)~=0
    agent2=agent2+NB_Matrix(onepath(x),onepath(x+1));
    x=x+1;
end
agent2=agent2+NB_Matrix(onepath(x),5);

length=max(agent1,agent2);
end

