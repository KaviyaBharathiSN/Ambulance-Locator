%-----screen and memory worskspace is cleared---------%
%-----change directory to dataset directory-------%
cd('C:\Users\Kaviya\Desktop\dataset');
%-----Loading a dataset-------------%
ds = dataset('XLSFile','book.csv');
%-----sorting a dataset based on attribute latitude-------------%
dsAgeUp = sortrows(ds,'latitude');
%-----storing the sorted output-------------%
output=dsAgeUp(1:20000,{'latitude','longitude','Accident_Severity'});
%-----Conversion of a dataset into vector of double -------------%
ouput=double(output);
%-----creating a input array from the vectors-------------%
Accident=double(output(1:200,3));
latitude=ouput(1:200,1);
longitude=ouput(1:200,2);
input = [latitude longitude Accident];
%-----Based on the number of ambulance in district k is assigned-------------%
clusters = 10;
%-----The k-means clustering is repeated for num_replicates times for accurate results-------------%
num_replicates = 70;
%-----clustering using k-means using distance and sqEuclidean -------------%
[clusterid, centroids, sumd, pointdistance] = kmeans(input,...
    clusters,'Replicates',num_replicates,...
    'Distance','sqEuclidean');          
%-----membership has the id of cluster to which they belong-------------%
%-----ctrs is centroid of the cluster -------------%
%-----sumd is sum of points in that cluster -------------%
%-----pointd is indivual observation distance  to each distance-------------%
%-----ploting the clustered values-------------%
data=[input,clusterid];
flag=1;
k=0;
while(flag<200)
flag=1;
k=k+1;
for i=1:200
    min=100000;
    for j=1:10
        d=sqrt(((data(i,1)-centroids(j,1))*(data(i,1)-centroids(j,1)))+((data(i,2)-centroids(j,2))*(data(i,2)-centroids(j,2))));
        d1=sqrt(((data(i,1)-centroids(j,2))*(data(i,1)-centroids(j,2)))+((data(i,2)-centroids(j,1))*(data(i,2)-centroids(j,1))));
        if(d<d1)
            dm=d;
        else
            dm=d1;
        end;
        if(dm<min)
            min=dm;
            cid=j;
        end;
    end;
    if(cid~=data(i,3))
        data(i,3)=cid;
    else
        flag=flag+1;
    end;
end;
sum=[0;0;0;0;0;0;0;0;0;0];
sum1=[0;0;0;0;0;0;0;0;0;0];
n=[0;0;0;0;0;0;0;0;0;0];
for i=1:20000
    if(data(i,3)==1)
        sum(1)=sum(1)+data(i,1);
        sum1(1)=sum1(1)+data(i,2);
        n(1)=n(1)+1;
        %plot(data(i,1),data(i,2),'r.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==2)
        sum(2)=sum(2)+data(i,1);
        sum1(2)=sum1(2)+data(i,2);
        n(2)=n(2)+1;
        %plot(data(i,1),data(i,2),'b.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==3)
        sum(3)=sum(3)+data(i,1);
        sum1(3)=sum1(3)+data(i,2);
        n(3)=n(3)+1;
       % plot(data(i,1),data(i,2),'g.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==4)
        sum(4)=sum(4)+data(i,1);
        sum1(4)=sum1(4)+data(i,2);
        n(4)=n(4)+1;
        %plot(data(i,1),data(i,2),'k.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==5)
        sum(5)=sum(5)+data(i,1);
        sum1(5)=sum1(5)+data(i,2);
        n(5)=n(5)+1;
        %plot(data(i,1),data(i,2),'c.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==6)
        sum(6)=sum(6)+data(i,1);
        sum1(6)=sum1(6)+data(i,2);
        n(6)=n(6)+1;
        %plot(data(i,1),data(i,2),'b.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==7)
        sum(7)=sum(7)+data(i,1);
        sum1(7)=sum1(7)+data(i,2);
        n(7)=n(7)+1;
        %plot(data(i,1),data(i,2),'g.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==8)
        sum(8)=sum(8)+data(i,1);
        sum1(8)=sum1(8)+data(i,2);
        n(8)=n(8)+1;
        %plot(data(i,1),data(i,2),'k.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==9)
        sum(9)=sum(9)+data(i,1);
        sum1(9)=sum1(9)+data(i,2);
        n(9)=n(9)+1;
        %plot(data(i,1),data(i,2),'c.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==10)
        sum(10)=sum(10)+data(i,1);
        sum1(10)=sum1(10)+data(i,2);
        n(10)=n(10)+1;
        %plot(data(i,1),data(i,2),'c.','MarkerSize',12);
    end;
end;
for i=1:10
    centroids(i,1)=sum(i)/n(i);
    centroids(i,2)=sum1(i)/n(i);
end;
end;
for i=1:20000
    if(data(i,3)==1)
        plot(data(i,1),data(i,2),'r.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==2)       
        plot(data(i,1),data(i,2),'b.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==3)
        plot(data(i,1),data(i,2),'g.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==4)
        plot(data(i,1),data(i,2),'k.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==5)
        plot(data(i,1),data(i,2),'c.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==6)
        plot(data(i,1),data(i,2),'b.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==7)
        plot(data(i,1),data(i,2),'g.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==8)
        plot(data(i,1),data(i,2),'k.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==9)
        plot(data(i,1),data(i,2),'c.','MarkerSize',12);
        hold on;
    elseif(data(i,3)==10)
        plot(data(i,1),data(i,2),'c.','MarkerSize',12);
    end;
end;
plot(centroids(1,1),centroids(1,2),'r*','MarkerSize',12);
plot(centroids(2,1),centroids(2,2),'b*','MarkerSize',12);
plot(centroids(3,1),centroids(3,2),'g*','MarkerSize',12);
plot(centroids(4,1),centroids(4,2),'k*','MarkerSize',12);
plot(centroids(5,1),centroids(5,2),'c*','MarkerSize',12);
plot(centroids(6,1),centroids(6,2),'b*','MarkerSize',12);
plot(centroids(7,1),centroids(7,2),'g*','MarkerSize',12);
plot(centroids(8,1),centroids(8,2),'k*','MarkerSize',12);
plot(centroids(9,1),centroids(9,2),'c*','MarkerSize',12);
plot(centroids(10,1),centroids(10,2),'c*','MarkerSize',12);
% ten numbers given as input
