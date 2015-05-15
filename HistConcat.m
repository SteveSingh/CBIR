function [ hist ] = HistConcat(img, colour_space, bins)
  % Convert image to HSV
  % if specified
  if colour_space == 2
    img = rgb2hsv(img);
  end
  % Create 3 histograms by
  % using each channel 
  A = imhist(img(:,:,1),bins);
  B = imhist(img(:,:,2),bins);
  C = imhist(img(:,:,3),bins);
  
  hist = [A' B' C'];
end

