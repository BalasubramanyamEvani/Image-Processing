clc;

Noise = im2double(imread('lenna.png'));
kernel = 7;
padded = im2double(zeros(size(Noise) + 2*fix(kernel/2)));

for x = 1:size(Noise , 1)
    for y = 1:size(Noise , 2)
        padded(x + fix(kernel/2) , y + fix(kernel/2)) = Noise(x , y);
    end
end

denoised = im2double(zeros(size(Noise)));

option = input('---Select one of the following Options--- \n\n1->BubbleSort , 2-> Paper Bubble Sort(3x3 Window), 3-> Selection Sort , 4->Shell Sort_Pratt\n\n5->Insertion Sort 6->Shell Sort_Hibbard Sequence\n');

tic
for i = 1:size(Noise , 1)
    for j = 1:size(Noise , 2)
        window = zeros(kernel * kernel , 1);
        
        start = 1;
        
        for x = 1 : kernel
            for y = 1 : kernel
                window(start) = padded(i + x - 1 , j + y - 1);
                start = start + 1;
            end
        end
        if option == 1
            med = bubble_sort(window , 1);
        elseif option == 2
            med = bbs_paper(window);
        elseif option == 3
            med = selection_sort(window);
        elseif option == 4
            med = shellSort_pratt(window);
        elseif option == 5
            med = insertionSort(window);
        elseif option == 6
            med = shellSort_hibbard(window);
        end
        denoised(i , j) = med;
    end
end
elapsedTime = toc;
string  = sprintf('Elapsed Time is = %f s\n',elapsedTime);
disp(string);

original = im2double(imread('orig.png'));
original = rgb2gray(original);
[ssimval, ssimmap] = ssim(denoised,original);
ssimval = ssimval * 100;
str = sprintf('The SSIM value is %0.4f.\n',ssimval);
disp(str);

subplot(2 , 1 , 1) , imshow(Noise) , title('Original Image');
subplot(2 , 1 , 2) , imshow(denoised) , title('Median Filter Applied');