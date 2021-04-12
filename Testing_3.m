
image = imread('plastic10.jpg');
%imhist(image);
% figure
% imshow(image)
% title('Original Image');

stretched_image = imadjust(image,stretchlim(image,[0.3 0.95]),[]);
figure
imshow(stretched_image)
title('Contrast Stretch');

hist_image = histeq(stretched_image);
figure
imshow(hist_image)
title('Histogram Equalised');

g_image = im2gray(hist_image);
figure
imshow(g_image)
title('Grayscale');

bin_image = g_image < 215;
figure
imshow(bin_image)
title('Binary');

neg_image = imcomplement(bin_image);
figure
imshow(neg_image)
title('Complementary');


bw_image = bwareaopen(neg_image,3000);
figure
imshow(bw_image)
title('Small object Removed');


fill_image = imfill(bw_image,'holes');
figure
imshow(fill_image)
title('Fill Image');

[bwLabel,num] = bwlabel(fill_image,8);


props = regionprops(fill_image,'Eccentricity','Area','BoundingBox');
areas = [props.Area];
eccentricities = [props.Eccentricity];
idxOfSkittles = find(eccentricities);
statsDefects = props(idxOfSkittles);
 
 figure 
 imshow(image);
 hold on;
 for idx = 1 : length(idxOfSkittles)
     h = rectangle('Position',statsDefects(idx).BoundingBox);
     set(h,'EdgeColor',[1 0 0]);
     hold on;
 end
 
