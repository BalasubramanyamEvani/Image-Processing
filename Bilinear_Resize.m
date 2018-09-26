% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% Bilinear Interpolation - Takes Input image file and scale as an array eg. [2 3]. Outputs resized images
function [res] = Bilinear_Resize(image, scale)

image = imread(image);
[r,c ,d] = size(image);

zx = scale(1);
zy = scale(2);

new_rows = floor(zx * r);
new_cols = floor(zy * c);

res = zeros(new_rows, new_cols,d);

for id=1:d
    for i = 1 : new_rows
            x1 = double(floor(i/zx));
            x2 = double(ceil(i/zx));
            if x1 < 1
                x1 = 1;
            end
            if x2 > r - 1
                x2 = r - 1;
            end
            x = rem(i/zx,1);

            for j = 1 : new_cols
                y1 = double(floor(j/zy));
                y2 = double(ceil(j/zy));
                if y1 < 1
                    y1 = 1;
                end
                if y2 > c - 1
                    y2 = c - 1;
                end
                y = rem(j/zy,1);

                ind1 = image(x1,y1,id);
                ind2 = image(x2,y1,id);
                ind3 = image(x1,y2,id);
                ind4 = image(x2,y2,id);

                val = ind3*y*(1-x)+ind1*(1-y)*(1-x)+ind4*y*x+ind2*(1-y)*x;
                res(i,j,id) = val; 
            
            end
    end
end    

res = cast(res,'uint8');
imwrite(res,'res.png');

end
%%
