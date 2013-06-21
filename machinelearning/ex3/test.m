x=load('ex3x.dat')
y=load('ex3y.dat')

[m,n]=size(x)
x = [ones(m, 1), x]
n = n + 1

sigma = std(x)
mu = mean(x)

for i = 2:n
  x(:,i) = (x(:,i) - mu(i)) / sigma(i)
end
alphas = [0.01, 0.03, 0.1]
style = ['r', 'g', 'b', 'b--']

figure;
for i= 1:3
  [J, theta] = plottheta(x, y , alphas(i), 50)
  plot(0:49, J(1:50), style(i), 50)
  hold on
end

alpha = 0.1
[J, theta] = plottheta(x, y , alphas(i), 500)


x=load('ex3x.dat')
y=load('ex3y.dat')

[m,n]=size(x)
x = [ones(m, 1), x]

ntheta = inv(x'*x) * x' *y

px1 = [1, (1650 - mu(2))/sigma(2), (3 - mu(3))/sigma(3)]

px2 = [1, 1650, 3]

