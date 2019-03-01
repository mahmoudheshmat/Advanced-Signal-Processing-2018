clear all
close all
clc

load Part2_5.mat
h_data(:,1) = RRI_trial3;
h_data_norm = zscore(h_data(:,1));

p=10; % Order 

parc_len = 10;
parc = zeros(parc_len,1);
parc_norm = zeros(parc_len,1);

for i = 1:parc_len
    coefs = aryule(h_data, i);
    parc(i) = -coefs(i+1);
end

for i = 1:parc_len
    coefs_norm = aryule(h_data_norm, i);
    parc_norm(i) = -coefs_norm(i+1);
end

% generate x axis
x = linspace(1, parc_len, parc_len);
stem(x,parc,'DisplayName','Empirical PCF');
hold on;
stem(x,parc_norm,'DisplayName','Zero Mean PCF');
grid on;
grid minor;
xlabel('Tau');
ylabel('PCF');
title('Partial Correlation of RRI Trial 3');
legend('show');
