clc
load("trainedNetwork.mat")
input = [0 1 1;
        0 1 1;
        1 0 1;
        1 0 0;
        ];
correct_Output =[ 0 0 1 1];
hasil=zeros(N,2);
N=4;
for k=1:N
    transposedInput = input(k,:)';
    weightedSum=Weight*transposedInput;
    d=correct_Output(k);
output= sigmoid(weightedSum);
hasil(k,1)=d;
hasil(k,2)=output;
end
disp("   Jawaban   Hasil Pecobaan")
disp(hasil)
