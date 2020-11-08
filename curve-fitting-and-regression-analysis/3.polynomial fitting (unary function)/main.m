%����ʽ��ϣ�һԪ��
clc
clear
close all
data=xlsread('data.xlsx','A2:B24');
x = data(:,1);                          %�Ա�������������
y = data(:,2);                          %���������������

n = length(y);
step = 1997:2022;                           %Ԥ���X��

[p,S] = polyfit(x,y,2);
%[y, delta] = polyconf(p,step,S,0.05);      %Ĭ��0.05 
[yfit, delta] = polyval(p,step,S);         %�������delta��ҪS
%yfit = polyval(p,step);
plot(data(:,1),data(:,2),'r*',step,yfit,'--b')
title('ɢ��ͼ���ع�����');

MEAN=mean(y);
S = sum((y-MEAN).^2);
A = sum((yfit(1:n)'-y).^2);
R = 1-A/S;    %RΪ��϶�
fprintf('��϶�R����%f\n',R);

zhiXinQuJian = zeros(length(yfit),2);
zhiXinQuJian(:,1) = yfit-delta;
zhiXinQuJian(:,2) = yfit+delta;
%% ������
res = y-yfit(1:n)';        