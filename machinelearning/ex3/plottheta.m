function [J, theta] = plottheta(x, y, alpha, iter)

% rows of X are training samples
% rows of Y are corresponding 0/1 values

% output ll: vector of log-likelihood values at each iteration
% ouptut theta: parameters

[m,n]=size(x)

theta = zeros(n, 1)
J = zeros(m, 1)


for num_iterations = 1:iter
      g = x * theta - y
      J(num_iterations) = 1 / (2 .* m) * (g' * g)       %% Calculate your cost function here %%
      theta = theta - alpha / m * x' * g                %% Result of gradient descent update %%
end


