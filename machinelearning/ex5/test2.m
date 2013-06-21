
clear all; close all;
x = load('ex5Logx.dat');
y = load('ex5Logy.dat');

% Find the indices for the 2 classes
pos = find(y); neg = find(y == 0);

plot(x(pos, 1), x(pos, 2), 'r+')
hold on
plot(x(neg, 1), x(neg, 2), 'bo')
legend('y=1', 'y=0')

x = map_feature(x(:,1), x(:,2))
[m,n] = size(x)
g = inline('1.0 ./ (1.0 + exp(-z))');

lamdas = [0 1 10]

iter = 15
theta = zeros(n, 1)

lamda = lamdas(3) % the only param

L = (lamda/m) .* eye(n)  % the extra regularization terms
L(1) = 0;
J = zeros(iter, 1)

for i = 1:iter
    % Calculate the hypothesis function
    z = x * theta;
    h = g(z);

    grad = (1/m).*x' * (h-y) + L * theta;
    H = (1/m).*x' * diag(h) * diag(1-h) * x + L;

    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h));

    theta = theta - H\grad;
end

% Define the ranges of the grid
u = linspace(-1, 1.5, 200);
v = linspace(-1, 1.5, 200);

% Initialize space for the values to be plotted
z = zeros(length(u), length(v));

% Evaluate z = theta*x over the grid
for i = 1:length(u)
      for j = 1:length(v)
                % Notice the order of j, i here!
                z(j,i) = map_feature(u(i), v(j))*theta;
      end
end

% Because of the way that contour plotting works
% in Matlab, we need to transpose z, or
% else the axis orientation will be flipped!
%z = z'
% Plot z = 0 by specifying the range [0, 0]
contour(u,v,z, [0, 0], 'LineWidth', 2)
