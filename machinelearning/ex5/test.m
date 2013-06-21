
clear all; close all;
x = load('ex5Linx.dat')
y = load('ex5Liny.dat')

[m,n] = size(x)
n = n + 1

% Assume the features are in the 2nd and 3rd
% columns of x
plot(x, y, 'ro')
xlabel('x'); ylabel('y')

x = [ones(m, 1), x, x.^2, x.^3, x.^4, x.^5];

plot_steps = 30
x_vals = linspace(-1, 1, plot_steps);
x_vals_t = x_vals'
x_val = [ones(plot_steps, 1), x_vals_t, x_vals_t.^2, x_vals_t.^3, x_vals_t.^4, x_vals_t.^5];

lamdas = [0 , 1 , 10]
styles = ['r-', 'g-', 'b-']

for i = 1 : 3
  lamda = lamdas(i)
  L = lamda.*eye(6); % the extra regularization terms
  L(1) = 0;

  theta = inv(x' * x + L) * x' * y
  %%% why theta = (x' * x + L)\x' * y ?????? TODO

  y_vals = x_val * theta

  hold on
  plot(x_vals, y_vals, styles(i), 'LineWidth', 2)
end
legend('training data', 'lamda=0', 'lamda=1', 'lamda=10')

