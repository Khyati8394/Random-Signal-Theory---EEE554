clear; clf;
load process.mat % load data to Matlab
process=Received_Data; % rename the data in process.mat that is called Received_Data
[N, M]=size(process); % N= number of samples per realization

% M = number of realizations
for m=1:M,
    realization{m}=process(:,m); % Obtain each realization separately
end

y(1)=0;
 
for i=1:M
    for k=0:N-1
        y(i,k+1) = (1/(N-k))* sum(process(1:N-k,i).*process(k+1:N,i)); %%%%
    end
end

subplot(211);
plot(0:N-1,y(2,1:N)) 
title('The temporal mean estimate of the ACS (Continuous)'); 
xlabel('Number of samples'); ylabel('Estimated ACS');

subplot(212); 
stem(0:N-1,y(2,1:N)) %%%
title('The temporal mean estimate of the ACS (Discrete)'); 
xlabel('Number of samples'); ylabel('Estimated ACS');
