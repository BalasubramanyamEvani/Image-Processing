% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur 19-9-2018

%% Function Quantizer takes two inputs - image_file and new_bit level
function Quantizer(image , newbit)
img = imread(image);
if size(img,3) > 1
    img = rgb2gray(imread(image));
end
I = double(img) / 255;
level = 2^newbit - 1;
res = uint8(I * level);
res = double(res) / level;

subplot(2 , 1 , 1) , imshow(I) , title('Original Image');
subplot(2 , 1 , 2) , imshow(res) , title('Quantized');

end
%%