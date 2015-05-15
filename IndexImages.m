function [ RGB_h, HSV_h, images ] = IndexImages(directory, query)
  % Create cell array to store RGB histograms
  RGB_h = [];
  % Create cell array to store HSV histograms
  HSV_h = [];
  % Collect all images in image folder
  % and store inside an array
  images = {};
  
  % Load image directory
  d = dir(directory);
  
  % Delete directory entry containing
  % the query image to avoid compari-
  % sons with itself
  for i=1:length(d)
    if strcmp(d(i).name,query) == 1
      d(i) = []; break;
    end
  end
  
  for i = 1:length(d)
    % Ignore query image
    images{i} = imread(strcat('images/',d(i).name));
  end
  
  for i = 1:length(images)
      % Combine into RGB histogram
      RGB_h(i,:) = HistConcat(images{i},1,150);
      % Combine into HSV histogram
      HSV_h(i,:) = HistConcat(images{i},2,150);
  end
end

