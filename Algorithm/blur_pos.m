function [Blur] = blur_pos(LEN,THETA)
    num_of_col = round(abs(cosd(THETA)*LEN));
    num_of_row = round(abs(sind(THETA)*LEN));
    if (mod(num_of_col,2) == 0)
        num_of_col = num_of_col + 1; %кол-во столбцов
    end

    if (mod(num_of_row,2) == 0)
        num_of_row = num_of_row + 1; %кол-во строк
    end

    Blur = zeros(num_of_row,num_of_col);
    if (THETA > 0)
        x0 = 1;
        y0 = num_of_col;
        x1 = num_of_row;
        y1 = 1;
    end

    if (THETA < 0)
        x0 = 1;
        y0 = 1;
        x1 = num_of_row;
        y1 = num_of_col;
    end

    dy = abs(y1 - y0);
    if (y0 < y1)
        sy = 1;
    else
        sy = -1;
    end

    dx = -abs(x1-x0);
    if (x0<x1)
        sx = 1;
    else
        sx = -1;
    end

    e = dx + dy;

    Blur(x0,y0) = 1;
    sum = 1;
    n = 1;


    while ((x0 <= x1) && (y0 >= y1))
        if (x0 == x1) && (y0 == y1)
            break
        end
        e2 = 2*e;
        if e2 >= dx
            if (y0 == y1)
                break
            end
            e = e + dx;
            y0 = y0 + sy;
        end
        if e2 <= dy
            if (x0 == x1)
                break
            end
            e = e + dy;
            x0 = x0 + sx;
        end

        Blur(x0,y0) = 1;
        sum = sum + 1;
    end



%     [xb,yb] = size(Blur);
%     for i = 1:xb
%         for j = 1:yb
%             if (Blur(i,j) == 1)
%                 Blur(i,j) = 1/sum;
%             end
%         end
%     end
end

