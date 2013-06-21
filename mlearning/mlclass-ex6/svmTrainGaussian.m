function [model] = svmTrainGaussian(X, Y, C, sigma)
  gamma = 1/(2*sigma^2);
  opt = ['-q -s 0 -t 2 -c ',num2str(C),' -g ', num2str(gamma)];
  model = svmtrain(Y, X, opt);
end

