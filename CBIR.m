% Initial housekeeping function calls
clear variables;
close all;
clc;
% Set image directory
directory = 'images/*.jpg';
% Set query image
query = '99.jpg';
q_file = strcat('images/',query);
q = imread(q_file);
q_RGB = HistConcat(q,1,150);
q_HSV = HistConcat(q,2,150);
% Retrieve index of RGB and 
% HSV histograms
[RGB_h, HSV_h, images] = IndexImages(directory, query);

% Perform difference measures
[MD1, ED1, HI1] = Differences(RGB_h, q_RGB); 
% Repeat for HSV histograms
[MD2, ED2, HI2] = Differences(HSV_h, q_HSV);

[m,n] = size(MD1);
for i = 1:m
  % Add indices for tracking
  % after sorting
  MD1(i,2) = i;
  ED1(i,2) = i;
  HI1(i,2) = i;
  MD2(i,2) = i;
  ED2(i,2) = i;
  HI2(i,2) = i;
end

% Sort difference measures
MD1 = sortrows(MD1,1);
ED1 = sortrows(ED1,1);
HI1 = sortrows(HI1,1);
MD2 = sortrows(MD2,1);
ED2 = sortrows(ED2,1);
HI2 = sortrows(HI2,1);

% Display images by similarity
% based on above measures 
if strcmp(query,'99.jpg') == 0
  subplot(5,4,1);
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{MD1(i,2)});
  end
  figure;
  subplot(5,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{ED1(i,2)});
  end
  figure;
  subplot(5,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{HI1(i,2)});
  end
  figure;
  subplot(5,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{MD2(i,2)});
  end
  figure;
  subplot(5,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{ED2(i,2)});
  end
  figure;
  subplot(5,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m-1
    subplot(5,4,i+1);
    imshow(images{HI2(i,2)});
  end
else
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{MD1(i,2)});
  end
  figure;
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{ED1(i,2)});
  end
  figure;
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{HI1(i,2)});
  end
  figure;
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{MD2(i,2)});
  end
  figure;
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{ED2(i,2)});
  end
  figure;
  subplot(6,4,1); 
  imshow(q); title('Query Image');
  for i = 1:m
    subplot(6,4,i+1);
    imshow(images{HI2(i,2)});
  end
end


