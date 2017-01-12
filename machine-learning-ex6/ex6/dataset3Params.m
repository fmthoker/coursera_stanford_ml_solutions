function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.

test_vals = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30;];
minimum = 0;
Cval = 0;
Sigma_val = 0;

for i =1:length(test_vals) 
for j =1:length(test_vals) 
C=test_vals(i);
sigma=test_vals(j);

model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
predictions = svmPredict(model, Xval);
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
pred_error = mean(double(predictions ~= yval));
if(j ==1 && i==1)
minimum = pred_error;
Cval  = C;
Sigma_val  = sigma;
elseif(pred_error<minimum)
minimum = pred_error;
Cval  = C;
Sigma_val  = sigma;
endif 


end
end
%

C= Cval;
sigma = Sigma_val;






% =========================================================================

end
