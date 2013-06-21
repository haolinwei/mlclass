x = load('ex2x.dat');
y = load('ex2y.dat');

figure % open a new figure window
plot(x, y, 'o');
ylabel('Height in meters')
xlabel('Age in years')

[m,n]=size(x)
n=n+1
x=[ones(m,1), x]

alpha = 0.07
theta = zeros(n,1)

MAX_ITR = 1500

for num_iterations = 1:MAX_ITR
  theta = theta - alpha * 1/m .* x' * (x*theta -y)
end

hold on
plot(x(:,2), x*theta, '-')
legend('Training data', 'Linear regression')

J_vals = zeros(100, 100);   % initialize Jvals to 100x100 matrix of 0's
theta0_vals = linspace(-3, 3, 100);
theta1_vals = linspace(-1, 1, 100);
for i = 1:length(theta0_vals)
      for j = 1:length(theta1_vals)
            t = [theta0_vals(i); theta1_vals(j)];
            g = x * t - y
            J_vals(i,j) = 1 / (2 .* m) .*(g' * g)
      end
end

% Plot the surface plot
% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
J_vals = J_vals'
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1')

figure;
% Plot the cost function with 15 contours spaced logarithmically
% between 0.01 and 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 2, 15))
xlabel('\theta_0'); ylabel('\theta_1')

