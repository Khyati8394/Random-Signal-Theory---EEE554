clear; 
clf;
load process.mat % load data to Matlab
process=Received_Data; % rename the data in process.mat that is called Received_Data
[N, M]=size(process); % N= number of samples per realization

% M = number of realizations
for m=1:M
realization{m}=process(:,m); % Obtain each realization separately
end

for i=0:N-1
r1(i+1,1)=(1/(N-i))*sum(realization{m}(1:N-i).*realization{m}(1+i :N));
end

I=512;
N=1024; %set FFT size
L = N/I
r=r1;
Pav1=r1;
f=[0:N-1]'/N-0.5; 
for m=1:M
for i=0:I-1
value = r((i*L)+1:(i*L)+L);
Pav1=Pav1+(1/(I*L))*[abs(fftshift(fft(value,N))).^2];
end
end
length(Pav1)

subplot(211) 
plot(f,r1); title('Estimated PSD of X[n]');
xlabel('Number of samples'); ylabel('Estimated PSD');

subplot(212)
plot(f,Pav1); title('Averaged periodogram estimate of PSD');
xlabel('Number of samples'); ylabel('Averaged periodogram');