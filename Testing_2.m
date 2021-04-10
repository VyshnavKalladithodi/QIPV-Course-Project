
image = imread('mask7.jpg');

stretched_image = imadjust(image,[0.3 0.7],[]);

hist_image = histeq(stretched_image);

g_image = rgb2gray(hist_image);

bin_image = imbinarize(g_image);

neg_image = imcomplement(bin_image);

bw_image = bwareaopen(neg_image,10000);

fill_image = imfill(bw_image,'holes');

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
