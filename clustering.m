function [ clusterid,centroids,data,clusters ]=clustering( clusterid,centroids,data,clusters )
flag=1;
k=0;
while(flag<200)
flag=1;
k=k+1;
for i=1:200
    min=100000;
    for j=1:clusters
        dm=sqrt(((data(i,1)-centroids(j,1))*(data(i,1)-centroids(j,1)))+((data(i,2)-centroids(j,2))*(data(i,2)-centroids(j,2))));
       % d1=sqrt(((data(i,1)-centroids(j,2))*(data(i,1)-centroids(j,2)))+((data(i,2)-centroids(j,1))*(data(i,2)-centroids(j,1))));
        %if(d<d1)
         %   dm=d;
        %else
         %   dm=d1;
        %end;
        if(dm<min)
            min=dm;
            cid=j;
        end;
    end;
    if(cid~=data(i,4))
        data(i,4)=cid;
    else
        flag=flag+1;
    end;
end;
sum=zeros(clusters);
sum1=zeros(clusters);
n=zeros(clusters);
for j=1:clusters
    for i=1:200
    if(data(i,4)==j)
        sum(j)=sum(j)+data(i,1);
        sum1(j)=sum1(j)+data(i,2);
        n(j)=n(j)+1;
    end;
    end;
end;
for i=1:clusters
    centroids(i,1)=sum(i)/n(i);
    centroids(i,2)=sum1(i)/n(i);
end;
end;
end



