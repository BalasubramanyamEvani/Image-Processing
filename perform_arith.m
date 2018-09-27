% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% Image Arithmetic, addition, subtraction

function [res] = perform_arith(image1, image2, reso, method)

im1 = imread(image1);
im2 = imread(image2);

i1 = imresize(im1,[reso reso],'bilinear');
i2 = imresize(im2,[reso reso],'bilinear');

d1 = size(i1,3);
d2 = size(i2,3);

i1 = double(i1);
i2 = double(i2);

if d1 ~= d2
    error('Dimenions of selected do not match, provide images of same dimensions');
end

if strcmp(method,'add') % addition
    res = i1 + i2;
    res(res > 255) = 255;
    res = cast(res,'uint8');
    
elseif strcmp(method,'sub1') %subtract from 1
    res = i1 - i2;
    res(res < 0) = 0;
    res = cast(res,'uint8');
    
elseif stcmp(method,'sub2') % subtract from 2
    res = i2 - i1;
    res(res < 0) = 0;
    res = cast(res,'uint8');
    
end

end


%%