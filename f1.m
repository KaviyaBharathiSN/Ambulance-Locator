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
clusters = 20;
%-----Tk-he k-means clustering is repeated for num_replicates times for accurate results-------------%
num_replicates = 7;
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
[ clusterid,centroids,data,clusters ]=clustering( clusterid,centroids,data,clusters );
s=['y','m','c','r','g','b','w','k','y','m','c','r','g','b','w','k','y','m','c','r','g','b','w','k'];
for j=1:clusters
    for i=1:200
    if(data(i,4)==j)
        plot(data(i,1),data(i,2),strcat(s(j),'.'),'MarkerSize',12);
        hold on;
    end;
    end;
end;

for i=1:clusters
    plot(centroids(i,1),centroids(i,2),strcat(s(i),'*'),'MarkerSize',12);
    hold on;
end;
