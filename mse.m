function val = mse(im1 , im2)

if size(im1,1) ~= size(im2,1) || size(im1,2) ~= size(im2,2)
    error('input images not of same dimensions');
end
m = size(im1,1);
n = size(im1,2);

val = sum(sum((im1 - im2).^2))/(m*n);

end