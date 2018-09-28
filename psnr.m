function val = psnr(im1,im2)

if size(im1,1) ~= size(im2,1) || size(im1,2) ~= size(im2,2)
    error('input images not of same dimensions');
end

val = 10*log10(255*255)/mse(im1,im2);

end