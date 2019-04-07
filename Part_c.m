clear; clf;
load process.mat % load data to Matlab
process=Received_Data; % rename the data in process.mat that is called Received_Data
[N, M]=size(process); % N= number of samples per realization

% M = number of realizations
for m=1:M,
realization{m}=process(:,m); % Obtain each realization separately
end

Temporal_mean=mean(process); %Average Realizations
Temporal_mean= Temporal_mean'
Final_mean=mean(Temporal_mean)

plot(0:m-1, Temporal_mean);
title('Temporal Mean'); 
xlabel('Number of samples'); ylabel('Temporal Mean Values');
