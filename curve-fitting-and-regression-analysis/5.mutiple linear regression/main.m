%��Ԫ���Իع飬��Ԫ�������
%����ĳЩ������ȡֵʼ�ղ���ʱ����ϵ��һ��Ϊ0(���Ƶ�)
clear,clc
close all
data = xlsread('data.xlsx');
x1 = data(:,1);   %�Ա���1����������
x2 = data(:,2);   %�Ա���2����������
Y = data(:,3);    %���������������
X = [x1,x2,ones(size(Y))];               %�����Ա�����ones��Ӧ������
[b,~,R] = regress(Y,X);
%%
figure('name','�в�ͼ')
stem(R,'k');
title('���ͼ')
%%
fitY = X*b;
figure('name','�ع�ͼ')
plot3(x1,x2,Y,'r*')
hold on
plot3(x1,x2,fitY,'b-','linewidth',2)
hold off