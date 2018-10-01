% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% sobel takes in two parameters image file and flag, flag represents whether to apply gaussian blur or not, with
% a standard deviation of 1 creating a kernel of 5x5.
% res1 -> output using kernel_y (horizontal)
% res2 -> output using kernel_x (vertical)
% res3 -> output using magnitude of vertical and horizontal kernels

function [res1,res2,res3] = sobel(image,flag)

im = imread(image);
im = im2double(rgb2gray(im));

if flag == 1
    im = imgaussfilt(im,1);
end

kernel_y = [-1 -2 -1; 0 0 0;1 2 1];
kernel_x = [-1 0 1;-2 0 2;-1 0 1];
x = size(im,1);
y = size(im,2);

res1 = im;
res2 = im;
res3 = im;

for i = 2:x-1
    for j = 2:y-1
        sub = [im(i-1,j-1), im(i-1,j), im(i-1,j+1) ; ...
            im(i,j-1), im(i,j), im(i,j+1) ; im(i+1,j-1), im(i+1,j), im(i+1,j+1);];
        conv_1 = sum(sum(sub.*kernel_y));
        conv_2 = sum(sum(sub.*kernel_x));
        
        res1(i,j) = conv_1;
        res2(i,j) = conv_2;
        res3(i,j) = sqrt(conv_1^2 + conv_2^2);
        
    end
end

res1(res1 > 255) = 255;
res1(res1 < 0) = 0;

res2(res2 > 255) = 255;
res2(res2 < 0) = 0;

res3(res3 > 255) = 255;
res3(res3 < 0) = 0;

end
%%
