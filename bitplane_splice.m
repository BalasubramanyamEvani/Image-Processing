% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% Bit Place Splicing, function takes image matrix and displays 8 bit planes along with origianl image
function [res] = bitplane_splice(image)

[r,c,dim] = size(image);
if dim > 1
    image = rgb2gray(image);
end
res = zeros(r,c,8);

for i=1:8
    for j=1:r
        for k=1:c
            res(j,k,i) = bitget(image(j,k),i);
        end
    end
end

figure;
imshow(image);title('Original Image');

figure;
for i=1:8
    subplot(3,3,i),imshow(res(:,:,i));
end

reconstructed = zeros(r,c);

for i=1:8
    reconstructed = reconstructed + res(:,:,i) .* 2 ^ (i-1);
end

figure;
imshow(uint8(reconstructed));

end