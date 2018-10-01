% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% function unsharp_filter takes in two inputs image and weight
% outputs gaussian blur, high frequenct components, enhanced image
% if weight field is specified it works as highboost fitler, if not then
% default value is taken as 1

function [low,high_mask,res] = unsharp_filter(image,weight)

if nargin < 2
    weight = 1;
end

im = imread(image);

if size(imread(image),3) > 1
    im = rgb2gray(im);
end

low = imgaussfilt(im,1);

high_mask = im - low;

res = im + weight * (high_mask);

end
%%