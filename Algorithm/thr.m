function [T] = thr(J)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    sum_pix = 0;
    [x,y]=size(J);    
    n = x*y;
    

    for i = 1:x
        for j = 1:y
            sum_pix = sum_pix + double(J(i,j));
        end
    end

    mean = sum_pix / n;

    sd_sum = 0;
    for i = 1:x
        for j = 1:y
            c = (double(J(i,j)) - mean)^2;
            sd_sum = sd_sum + c;
        end
    end
    sig = sqrt(sd_sum / n);
    Thr = mean + 3*sig;

    T = zeros(size(x,y));
    for i = 1:x
        for j = 1:y
            T(i,j) = J(i,j)-Thr;
        end 
    end
end

