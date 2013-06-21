clear all; close all;

load('q2x.dat');
load('q2y.dat');
x=q2x
y=q2y

plot(x, y, 'o')
xlabel('x'); ylabel('y')
%legend('y=1', 'y=0')
hold on

[m, n] = size(x)
x = [ones(m,1) x]

theta = inv(x' * x) * x' * y

plot_step_size = 100
plot_x = linspace(-5, 12, plot_step_size)';
plot_x_t = [ones(plot_step_size, 1) plot_x]

plot_y = plot_x_t * theta
plot(plot_x, plot_y, 'g-')
hold on

taus = [.1 .3 .8 2 10];
colors = ['r' 'g' 'm' 'y' 'k'];

for taus_index = 1:5
  w = zeros(m,m)
  for x_index = 1:plot_step_size
    for i = 1:m
      w(i,i) = exp(-(plot_x(x_index) - q2x(i))^2 ./ (2*taus(taus_index)^2))
  end
  theta = inv(x'*w*x)*x'*w*y;
  plot_y(x_index) = plot_x_t(x_index,:) * theta
end
plot(plot_x, plot_y, colors(taus_index))
hold on
end

legend('trainingdata','linear','tau=.1','tau=.3', 'tau=.8','tau=2','tau=10')
