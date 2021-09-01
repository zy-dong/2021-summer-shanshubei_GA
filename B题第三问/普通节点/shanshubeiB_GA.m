%%shanshubei.m
%%遗传算法主程序,(除去2，5，16，17，18外的16个点)
clear
clc
load("matrix.mat");%导入邻接矩阵

episode=3500;  %迭代轮数
n=50         ;  %种群规模
m=5           ; %每轮复制数量
start_seq=[1,3,4,6,7,8,9,10,11,12,13,14,15,19,20,21];%起始点序列
load("chushihua.mat");%导入初始种群
%%临时变量




for z=1:16 %16个点
    e_best=zeros(1,episode); %每轮的最短最长路径
    path=zeros(n,35); %路径种群
    bk=zeros(n,1);%中断点种群
    grades=zeros(n,1);%储存适应度函数得到的分数（最长路径长度）
    m=5; %复制个数
    path=sumstart(:,(z-1)*35+1:z*35);
    bk=sumbk(:,z);
    temp_path=path;
    temp_bk=bk;
    temp_path1=zeros(n,35);
    temp_bk1=zeros(n,1);
    temp_grades=zeros(n,1);
    %%每轮进化
    for i=1:episode
        path=temp_path;
        bk=temp_bk;
        %%评估
        for t=1:n
            grades(t,1)=assess(start_seq(z),path(t,:),bk(t));%评估种群内的个体
        end
        e_best(i)=min(grades);
        temp_grades=grades;
        
        %%繁殖（交叉）产生n-m个
        for t=1:n%%排序，排序后的染色体存放在temp_path1,temp_bk1,评价由高到低（grades由低到高）
            c=find(temp_grades==min(temp_grades));
            c=c(1);
            temp_path1(t,:)=temp_path(c,:);
            temp_bk1(t)=temp_bk(c);
            temp_grades(c)=inf;
        end
        
        for t=1:n-m-1
            [temp_path(m+t,:),temp_bk(m+t),temp_path(m+t+1,:),temp_bk(m+t+1)] = ...
                cross(temp_path1(t,:),temp_path1(t+1,:),temp_bk1(t),temp_bk1(t+1));
        end
        
        %%复制最好的m个
        for t=1:m
            temp_path(t,:)=temp_path1(t,:);
            temp_bk(t)=temp_bk1(t);
        end
        
        
        %%变异，随机选一个染色体，随机两个节点交换位置
        va=ceil(rand(1)*n);
        v1=ceil(rand(1)*25);
        v2=ceil(rand(1)*25);
        %disp([v1,v2,va]);
        an=temp_path(va,v1)==0 || temp_path(va,v1)==16 || temp_path(va,v1)==17 || temp_path(va,v1)==18 || temp_path(va,v1)==2 || temp_path(va,v2)==0 || temp_path(va,v2)==16 || temp_path(va,v2)==17 || temp_path(va,v2)==18 || temp_path(va,v2)==2;
        while an
            va=ceil(rand(1)*n);
            v1=ceil(rand(1)*25);
            v2=ceil(rand(1)*25);
            an=temp_path(va,v1)==0 || temp_path(va,v1)==16;
            an=an || temp_path(va,v1)==17 || temp_path(va,v1)==18;
            an=an || temp_path(va,v1)==2 || temp_path(va,v2)==0 ;
            an=an || temp_path(va,v2)==16 || temp_path(va,v2)==17 ;
            an=an || temp_path(va,v2)==18 || temp_path(va,v2)==2;
        end
        temp=temp_path(va,v1);
        temp_path(va,v1)=temp_path(va,v2);
        temp_path(va,v2)=temp;
    end
    
    %%绘图
    x=1:episode;
    plot(x,e_best);
    saveas(gcf,num2str(start_seq(z)),'png');
    c=find(temp_grades==min(temp_grades));
    c=c(1);%找到最优方案的索引
    length=size(nonzeros(path(c,:)));
    length=length(1);
    disp(["最终结果(起始节点为",start_seq(z),")"]);
    disp([start_seq(z),path(c,1:bk(c)),start_seq(z)]);
    disp([start_seq(z),path(c,bk(c)+1:length),start_seq(z)]);
    disp(["时间：",(assess(start_seq(z),path(c,:),bk(c)))/1.5]);
end