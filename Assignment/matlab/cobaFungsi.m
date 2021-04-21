clc;clear;close all;
for i=1:9
    tetangga(i)=2*i-1;   
end
for ii=1:9
data=xlsread('Data.xlsx','Gab');                    %data mula mula
[num,txt,raw]=xlsread('Data.xlsx','Gab');
X=data(1:82,:);                                     %data training
% redX=tsne(X,'Algorithm','exact','Distance','cosine');
Y=data(84:111,:);                                   %data testing
% redY=tsne(Y,'Algorithm','exact','Distance','cosine');
hasil=txt(85:112,19);                               %data jawaban
[m1,n1]=size(X);[m2,n2]=size(Y);
n=tetangga(ii);                                               %jumlah tetangga
Mdl = createns(X,'Distance','euclidean');           %jenis pendekatan KNN
keluar = knnsearch(Mdl,Y,'K',n);                    %KNN
%%%%%%%%%
xx=[];
for i=1:28
    for j=1:n
        if (keluar(i,j)>=1)&&(keluar(i,j)<=42)      %indeks data PE
            xx(i,j)=1;                              %PE=1
        else 
            xx(i,j)=0;                              %normal=0
        end
    end
end
%%%%%%%
banding = int16(n/2);                               %jumlah setengah lebih tetangga
for i=1:28      
  if (sum(xx(i,:))>=banding)                        %klasifikasi
      definisi(i)="preeklamsia";
  else
      definisi(i)="normal";
  end
end
definisi=definisi';
for i=1:28                          
    if (definisi(i)==hasil(i))                      %pencocokan data hasil
        jawab(i)=1;
    else
        jawab(i)=0;
    end
end
jawab=jawab';

akurasi(ii)=(sum(jawab)/28)*100;                         %penghitungan akurasi
end
plot(tetangga, akurasi,'-*','MarkerIndices',1:length(akurasi))
title("Grafik akurasi terhadap nilai K")
xlabel('Nilai K');ylabel("akurasi");
a = akurasi'; b = num2str(a); c = cellstr(b);
dx = 0.1; dy = 0.1; % displacement so the text does not overlay the data points
text(tetangga+dx, akurasi+dy, c);

