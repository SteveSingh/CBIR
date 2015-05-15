function [MD,ED,HI] = Differences(hist,q_hist)
  MD = []; ED = []; HI = [];
  [m,n] = size(hist);
  Q = repmat(q_hist,m,1);
  % Load matrix of histograms
  for i = 1:m
    X(i,:) = hist(i,:);
  end
  % Calculate Manhattan distance
    MD = sum(abs(Q - X),2); 
  % Calculate Euclidean distance
    ED = sqrt(sum((Q - X).^2,2)); 
  % Calculate Hist. intersection
    HI = sum(min(Q,X)/min(abs(Q),abs(X)),2);
end

