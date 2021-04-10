% Read the image
RGB = imread('plastic3.jpg');
subplot(2,3,1)
imshow(RGB)

%Thresholding
I = rgb2gray(RGB);
bw = imbinarize(I);
subplot(2,3,2)
imshow(bw)

%Noise Removel
bw = bwareaopen(bw,30);
subplot(2,3,3)
imshow(bw)

se = strel('disk',2);
bw = imclose(bw,se);
subplot(2,3,4)
imshow(bw)

bw = imfill(bw,'holes');
subplot(2,3,5)
imshow(bw)

%Finding Boundaries
[B,L] = bwboundaries(bw,'noholes');
subplot(2,3,6)
imshow(label2rgb(L,@jet,[.5 .5 .5]))
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2),boundary(:,1),'w','LineWidth',1)
end

%Determining round objects
stats = regionprops(L,'Area','Centroid');

threshold = 0.94;

% loop over the boundaries
for k = 1:length(B)

  % obtain (X,Y) boundary coordinates corresponding to label 'k'
  boundary = B{k};

  % compute a simple estimate of the object's perimeter
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  
  % obtain the area calculation corresponding to label 'k'
  area = stats(k).Area;
  
  % compute the roundness metric
  metric = 4*pi*area/perimeter^2;
  
  % display the results
  metric_string = sprintf('%2.2f',metric);

  % mark objects above the threshold with a black circle
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');
  end
  
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',7,'FontWeight','bold')
  
end

title(['Metrics closer to 1 indicate that ',...
       'the object is approximately round'])
