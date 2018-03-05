
%% 1. configuration
[a, error1, condNum, rankA, x_lsqr, xtilde] = myFunction(64, 1.5:1.5:96, 
64, 0 ,1e-6);




%% 2. configuration 
[a, error2, condNum, rankA, x_lsqr, xtilde] = myFunction(64, 2.5:2.5:160,
64, 0 );

%% 3. configuration 
[a, error3, condNum, rankA, x_lsqr, xtilde] = myFunction(64,  0.75:0.75:96,
32, 0 );

figure()
imagesc(reshape(x_lsqr, 64, 64))
colorbar
title("Least square solution of conf-3")
hold on;

%% 4.configuration
[a, error4, condNum, rankA, x_lsqr, xtilde] = myFunction(64, 1.25:1.25:160,
32,  0 );

%% Pictures etc.

[a1, error1, condNum1, rankA1, x_lsqr1, xtilde1] = 
myFunction(64, 1.5:1.5:96, 64, 0 );
[a2, error2, condNum2, rankA2, x_lsqr2, xtilde2] =
myFunction(64, 2.5:2.5:160, 64, 0 );
[a3, error3, condNum3, rankA3, x_lsqr3, xtilde3] = 
myFunction(64,  0.75:0.75:96, 32, 0 );
[a4, error4, condNum4, rankA4, x_lsqr4, xtilde4] = 
myFunction(64, 1.25:1.25:160, 32,  0 );

figure()
subplot(2,2,1)
imagesc(reshape(xtilde1, 64, 64))
colorbar
title("1st noisy data")
hold on;

subplot(2,2,2)
imagesc(reshape(xtilde2, 64, 64))
colorbar
title("2nd noisy data")
hold on;

subplot(2,2,3)
imagesc(reshape(xtilde3, 64, 64))
colorbar
title("3rd noisy data")
hold on;

subplot(2,2,4)
imagesc(reshape(xtilde4, 64, 64))
colorbar
title("4th noisy data")
hold on;
%% PICTURES 2


[a , error1, condNum1, rankA, x_lsqr, xtilde1]= differentNoises(1)
[a , error2, condNum2, rankA, x_lsqr2, xtilde2]= differentNoises(2)
[a , error3, condNum3, rankA, x_lsqr3, xtilde3]= differentNoises(3)
[a , error4, condNum4, rankA, x_lsqr4, xtilde4]= differentNoises(4)
error1 = error1(4:8,:);
error1 = mean(error1,2);

error2 = error2(4:8,:);
error2 = mean(error2,2);

error3 = error3(4:8,:);
error3 = mean(error3,2)

error4 = error4(4:8,:);
error4 = mean(error4,2)
%% RADON TRANSFER-1


[R, xp] = radon(phantom(64), 1.5:1.5:96);

imagesc(R);

imagesc(iradon(R, 1.5:1.5:96));

%% RADON-2
[R, xp] = radon(phantom(64), 2.5:2.5:160);

imagesc(R);

imagesc(iradon(R, 2.5:2.5:160));
%% 4x5 pictures
figure()
subplot(4,5,1)


for i=1:5
    subplot(4,5,i)
    imagesc(reshape(xtilde1(i+3,:), 64, 64))
    title(strcat("1e-" ,int2str(i+3)))%concatanate
    set(gca,'xtick',[])%remove the axis nuöbers
    set(gca,'ytick',[])
    if mod(i ,5 )==1
        ylabel(strcat("conf-" ,int2str(mod(i ,5 ))));
    end
    hold on;

end


for i=1:5
    subplot(4,5,i+5)
    imagesc(reshape(xtilde2(i+3,:), 64, 64))
    title(strcat("1e-" ,int2str(i+3)))%concatanate
    set(gca,'xtick',[])%remove the axis nuöbers
    set(gca,'ytick',[])
    if mod(i ,5 )==1
        ylabel(strcat("conf-" ,int2str(mod(i ,5 )+1)));
    end
    hold on;

end

for i=1:5
    subplot(4,5,i+10)
    imagesc(reshape(xtilde3(i+3,:), 64, 64))
    title(strcat("1e-" ,int2str(i+3)))%concatanate
    set(gca,'xtick',[])%remove the axis nuöbers
    set(gca,'ytick',[])
    if mod(i ,5 )==1
        ylabel(strcat("conf-" ,int2str(mod(i ,5 )+2)));
    end
    hold on;

end


for i=1:5
    subplot(4,5,i+15)
    imagesc(reshape(xtilde4(i+3,:), 64, 64))
    title(strcat("1e-" ,int2str(i+3)))%concatanate
    set(gca,'xtick',[])%remove the axis nuöbers
    set(gca,'ytick',[])
    if mod(i ,5 )==1
        ylabel(strcat("conf-" ,int2str(mod(i ,5 )+3)));
    end
    hold on;

end


