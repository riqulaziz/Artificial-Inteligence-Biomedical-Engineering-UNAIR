clc;clear;close all;
data=xlsread('Data.xlsx','Gab');                    %data mula mula
[num,txt,raw]=xlsread('Data.xlsx','Gab');
X=data(1:82,:);                                     %data training
redX=tsne(X,'Algorithm','barneshut','NumPCAComponents',18,'Perplexity',18);
Y=data(84:111,:);                                   %data testing
[redY,loss]=tsne(Y,'Algorithm','exact','NumDimensions',3);
hasilX=txt(2:83,19);
hasilY=txt(85:112,19);                               %data jawaban

gscatter(redX(:,1),redX(:,2),hasilX)
% v = double(categorical(hasilY));
% c = full(sparse(1:numel(v),v,ones(size(v)),numel(v),3));
% scatter3(redY(:,1),redY(:,2),redY(:,3),15,c,'filled')