% Author: Balasubramanyam Evani
% DIP Course Manipal University Jaipur

%% Nearest Neighbour Interpolator, inputs - image_file, scale_factor array
function NNeighbour_interpolate(image, scale_factor)

img = imread(image);
rows = size(img,1);
cols = size(img,2);
disp(rows);
disp(cols);

rr = scale_factor(1)/rows;
cr = scale_factor(2)/cols;
R = ceil((1 : rows * rr) ./ rr);
C = ceil((1 : rows * cr) ./ cr);

if size(img,3) > 1
    
    temp = img(:,:,1);
    red = temp(R,:);
    red = red(:,C);
    
    temp = img(:,:,2);
    green = temp(R,:);
    green = green(:,C);
    
    temp = img(:,:,3);
    blue = temp(R,:);
    blue = blue(:,C);
    
    res = zeros([scale_factor(1) , scale_factor(2), 3]);
    
    res(:,:,1) = red;
    res(:,:,2) = green;
    res(:,:,3) = blue;
    
    res = uint8(res);
else
    res = img(R,:);
    res = res(:,C);
end

figure,subplot(121),imshow(img);title('BEFORE INTERPOLATION'); axis([0,512,0,512]);axis on;

subplot(122),imshow(res);title('AFTER INTERPOLATION');  axis([0,1024,0,1024]);axis on;   

end
%%