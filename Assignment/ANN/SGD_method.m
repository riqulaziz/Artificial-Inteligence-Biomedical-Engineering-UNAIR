function Weight =SGD_method(Weight, input, correct_Output)
alpha=0.8;

N=4;
for k=1:N
    transposedInput = input(k,:)';
d=correct_Output(k);
weightedSum=Weight*transposedInput;
output= sigmoid(weightedSum);

error= d-output;
delta = output*(1-output)*error;
dWeight = alpha*delta*transposedInput;

Weight(1) = Weight(1) + dWeight(1);
Weight(2) = Weight(2) + dWeight(2);
Weight(3) = Weight(3) + dWeight(3);
end
end
    