clc
clear all
close all

LEN = 20; THETA = -60;
if THETA >= 0
    PSF = blur_pos(LEN,THETA);
else
    PSF = blur_neg(LEN,THETA);
end

for fr = 0:100
    fr = num2str(fr);
    I = imread(strcat('D:\MATLAB projects\TraditionalAlgor-Research\Big_dataset\image\',fr,'.png'));
    J = imbilatfilt(I);
    T = thr(J);
    T = uint16(T);
    it = 7;
    L = deconvlucy(T, PSF, it);
    L = uint16(L);
    imwrite(L,strcat('D:\MATLAB projects\TraditionalAlgor-Research\Algorithms\Proposed_Algorithm\result\',fr,'.png'),'BitDepth',16);
end