clear; clf;
load process.mat % load data to Matlab
process=Received_Data; % rename the data in process.mat that is called Received_Data
[N, M]=size(process); % N= number of samples per realization
% M = number of realizations
for m=1:M,
realization{m}=process(:,m); % Obtain each realization separately
end
 
reduced_samples=randperm(1024,10); % 10 samples to be selected from total 1024 samples.
 
for i=1:10
new_mean(i)=mean(process(reduced_samples (i),: )); %Average Realizations
end
new_mean=new_mean'
finmean=mean(new_mean) %Mean of all ergodic mean
 
plot(1:10, new_mean);
title('Vector of Ergodic Means'); 
xlabel('Number of samples'); ylabel('Ergodic Mean Values');
