function [path,bk] = dealdata(start_path)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
start_path=table2array(start_path);
L=size(start_path);
L=L(2);
bk=start_path(:,1);
path=zeros(50,35);
for i=1:50
    for j=1:L-1
        path(i,j)=start_path(i,j+1);
    end
end

for i=1:50
    for j=1:L-2
        if j>bk(i)
            path(i,j)=start_path(i,j+2);
        end
    end
end

for i=1:50
    for j=1:35
        if isnan(path(i,j))
            path(i,j)=0;
        end
        if path(i,j)==0
            path(i,j)=0;
        end
    end
end
end

