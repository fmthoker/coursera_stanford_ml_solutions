function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
temp = (X*theta) - y;
J = (temp'*temp);
reg_par = theta(2:end)'*theta(2:end);
reg_par = (lambda /(2*m))*reg_par;
J = J/(2*m) + reg_par;

% Gradient



% multply the result of X*theta with transpose of X such that each for each theta(j) the corresponding (input elenemt(X(:j) is multiplied as given in the formula
grad =  (X' * ((X*theta) - y))/m;
temp = grad(2:end,:) + (lambda/m)*theta(2:end,:);
grad(2:end,:) = temp;












% =========================================================================

grad = grad(:);

end
