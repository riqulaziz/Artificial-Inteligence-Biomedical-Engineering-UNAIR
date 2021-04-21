input = [0 0 1;
        0 1 1;
        1 0 1;
        1 1 0;
        ];
 correct_Output =[ 0 0 1 1];
 Weight= 2*randn(1,3)- 1;
 for epoch = 1:10000
     Weight =SGD_method(Weight,input,correct_Output);
 end
 
 save("trainedNetwork")