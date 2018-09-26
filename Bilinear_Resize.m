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
            x1 = cast(floor(i/zx),'uint32');
            x2 = cast(ceil(i/zx),'uint32');
            if x1 < 1
                x1 = 1;
            end
            if x2 > r - 1
                x2 = r - 1;
            end
            x = rem(i/zx,1);

            for j = 1 : new_cols
                y1 = cast(floor(j/zy),'uint32');
                y2 = cast(ceil(j/zy),'uint32');
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

                tr = (ind3*y)+(ind1*(1-y));
                br = (ind4*y)+(ind2*(1-y));
                res(i,j,id) = (br*x)+(tr*(1-x));
            
            end
    end
end    

res = cast(res,'uint8');
imwrite(res,'res.png');

end
%%