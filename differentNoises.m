function [a , error, condNum, rankA, x_lsqr, xtilde] = 
(confNumber)
if confNumber ==1
    for i=4:1:8
    [a, error(i,:), condNum(i), rankA, x_lsqr, xtilde(i,:)] =
    myFunction(64, 1.5:1.5:96, 64, 0 ,power(10,-i));
    end
elseif confNumber ==2
    for i=4:8
    [a, error(i,:), condNum(i), rankA, x_lsqr, xtilde(i,:)] = 
    myFunction(64, 2.5:2.5:160, 64, 0, power(10,-i));
    end
elseif confNumber ==3
    for i=4:8
    [a, error(i,:), condNum(i), rankA, x_lsqr, xtilde(i,:)] = 
    myFunction(64,  0.75:0.75:96, 32, 0, power(10,-i));
    end
elseif confNumber ==4
    for i=4:8
    [a, error(i,:), condNum(i), rankA, x_lsqr, xtilde(i,:)] = 
    myFunction(64, 1.25:1.25:160, 32, 0, power(10,-i));
    end
    
end