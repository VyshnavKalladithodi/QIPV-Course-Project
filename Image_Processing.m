image = imread('Paper.jpg');
imtool(image);
%%
figure
imhist(image(:,:,1))
title('Histogram of the Red band')
%%
stretched_image = imadjust(image,stretchlim(image));
figure
imshow(stretched_image)
title('Image Composite after Contrast Stretch')

figure
imhist(stretched_image(:,:,1))
title('Histogram of the Red band after Contrast Stretch')
%%
decorrstretched_image = decorrstretch(image,'Tol',0.01);
figure
imshow(decorrstretched_image);
title('Image Composite after Decorrelation Stretch')
%%
Igray = rgb2gray(image);
imshow(image);
%%
Ithresh = imbinarize(image,0.725);
imshowpair(image,Ithresh,'montage');
%%
 rmat = image(:,:,1);
 gmat = image(:,:,2);
 bmat = image(:,:,3);
 
 figure;
 subplot(2,2,1),imshow(rmat);
 title('Red Plane');
 subplot(2,2,2),imshow(gmat);
 title('Green Plane'); 
 subplot(2,2,3),imshow(bmat);
 title('Red Plane');
 subplot(2,2,4),imshow(image);
 title('Original Image');
%%
 rmat = image(:,:,1);
 gmat = image(:,:,2);
 bmat = image(:,:,3);
 
 i1 = imbinarize(rmat,0.6);
 i2 = imbinarize(gmat,0.66);
 i3 = imbinarize(bmat,0.72);
 Isum = (i1&i2&i3);
 

 subplot(2,2,1),imshow(i1);
 title('Red Plane');
 subplot(2,2,2),imshow(i2);
 title('Green Plane'); 
 subplot(2,2,3),imshow(i3);
 title('Blue Plane');
 subplot(2,2,4),imshow(Isum);
 title('Sum of all planes');
 %%
 Icomp = imcomplement(Isum);
 Ifilled = imfill(Icomp,'holes');
 figure
 imshow(Ifilled);
 %%
 se = strel('disk',40);
 Iopenned = imopen(Ifilled,se);
 imshow(Iopenned);
 %%
 Iregion = regionprops(Ioppened,'centroid');
 [labeled,numObjects]=bwlabel(Iopenned,4);
 stats = regionprops(labeled,'Eccentricity','Area','BoundingBox');
 areas = [stats.Area];
 eccentricities = [stats.Eccentricity];
 %%
 idxOfSkittles = find(eccentricities);
 statsDefects = stats(idxOfSkittles);
 
 figure 
 imshow(image);
 hold on;
 for idx = 1 : length(idxOfSkittles)
     h = rectangle('Position',statsDefects(idx).BoundingBox);
     set(h,'EdgeColor',[1 0 0]);
     hold on;
 end

 