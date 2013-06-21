function [jtheta, theta] = loop(theta, x, y, lamda)

[m,n] = size(x)
g = inline('1.0 ./ (1.0 + exp(-z))');

jtheta = 0
grad = zeros(1, 3)
hessian = zeros(3, 3)

L = lamda.*eye(n); % the extra regularization terms
L(1) = 0;

%    % Calculate the hypothesis function
%    z = x * theta;
%    h = g(z);
%
%    grad = (1/m).*x' * (h-y);
%    H = (1/m).*x' * diag(h) * diag(1-h) * x;
%
%    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h));
%
%    theta = theta - H\grad;

for i = 1:m % all samples
  tempx= x(i, :)
  htheta = g(tempx * theta)

  grad = grad + (htheta - y(i)) * tempx
  hessian = hessian + (htheta * (1 - htheta) * tempx' * tempx)
  jtheta = jtheta - y(i) * log(htheta) - (1 - y(i)) * log(1 - htheta)
end
grad = grad / m
hessian = hessian / m
jtheta = jtheta / m

theta = theta - inv(hessian) * grad'

