function PlotHistogram(img, colour_space)
  % Split image into 3 channels
    A = img(:,:,1);
    B = img(:,:,2);
    C = img(:,:,3);

    %Get histValues for each channel
    [y_A, x] = imhist(A,256);
    [y_B, x] = imhist(B,256);
    [y_C, x] = imhist(C,256);
    
  % If RGB colour space specified
  if colour_space == 1 
    % Plot them together
    plot(x, y_A, 'Red'); hold on
    plot(x+256, y_B, 'Green');
    plot(x+512, y_C, 'Blue');
    title('RGB Histogram');
    % Each channel plot is shifted
    % for display purposes, so the
    % X-axis is inaccurate and
    % must be hidden 
    set(gca,'XLim',[0 768]);
    set(gca, 'XTickLabelMode', 'Manual');
    set(gca, 'XTick', []);
  elseif colour_space == 2
    plot(x, y_A); hold on
    plot(x+256, y_B);
    plot(x+512, y_C);
    title('HSV Histogram');
    set(gca,'XLim',[0 768]);
    set(gca, 'XTickLabelMode', 'Manual');
    set(gca, 'XTick', []);
  else 
    fprintf('Incorrect colour space.');
  end
end

