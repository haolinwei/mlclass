% http://openclassroom.stanford.edu/MainFolder/DocumentPage.php?course=MachineLearning&doc=exercises/ex4/ex4.html
x = load('ex4x.dat')
y = load('ex4y.dat')

[m,n] = size(x)
n = n + 1

x = [ones(m,1), x]
% find returns the indices of the
% rows meeting the specified condition
pos = find(y == 1);
neg = find(y == 0);

% Assume the features are in the 2nd and 3rd
% columns of x
plot(x(pos, 2), x(pos,3), '+'); hold on
plot(x(neg, 2), x(neg, 3), 'o')
xlabel('\exam_0'); ylabel('\exam_1')

theta = zeros(n, 1)

%for iter = 1:5
  [jtheta, theta] = loop(theta, x, y)
%end
