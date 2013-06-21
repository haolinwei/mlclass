function [jtheta, theta] = loop(theta, x, y)

[m,n] = size(x)
g = inline('1.0 ./ (1.0 + exp(-z))');

jtheta = 0
grad = zeros(1, 3)
hessian = zeros(3, 3)

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

