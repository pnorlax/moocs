function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% you should not regularize the parameter theta(1), which is theta0

% define h first
h = sigmoid(X*theta);

% define cost function J for regularized logistic regression
J = (-1/m * sum((y.*log(h)) + (1-y).*log(1-h))) + (lambda/(2*m))*sum(theta(2:end).^2);

% define gradient
for i = 1:size(theta, 1)
	if i == 1
		grad(i) = 1/m * sum((h-y) .* X(:,i));
	else
		grad(i) = 1/m * sum((h-y) .* X(:,i)) + (lambda/m)*theta(i);
	end
end

% =============================================================

end
