clear; clf;
load process.mat       % load data to Matlab
process=Received_Data; % rename the data in process.mat that is called Received_Data
[N, M]=size(process);  % N= number of samples per realization

% M = number of realizations
for m=1:M,
realization{m}=process(:,m); % Obtain each realization separately
end

% Note: at the end of the "for loop", realization{:} creates a cell of dimension 1xM
% Here, we have considered r5=realization{5}; hence r5 is an Nx1 vector of the 5th realization

n=0:N-1;
x=mean(process,2); % Average realizations
figure(1);
subplot(211); plot(n, realization{5}); % Plot fifth realization
title('Fifth realization'); xlabel('Number of samples'); ylabel('Fifth realization values');
subplot(212); plot(n, x); % Plot the average of realizations
title('The average of realizations'); xlabel('Number of samples'); ylabel('Mean of realizations');

