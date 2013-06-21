function [model] = svmTrain(X, Y, C, kernelFunction, ...
                            tol, max_passes)
%SVMTRAIN Trains an SVM classifier using a simplified version of the SMO
%algorithm.
%   [model] = SVMTRAIN(X, Y, C, kernelFunction, tol, max_passes) trains an
%   SVM classifier and returns trained model. X is the matrix of training
%   examples.  Each row is a training example, and the jth column holds the
%   jth feature.  Y is a column matrix containing 1 for positive examples
%   and 0 for negative examples.  C is the standard SVM regularization
%   parameter.  tol is a tolerance value used for determining equality of
%   floating point numbers. max_passes controls the number of iterations
%   over the dataset (without changes to alpha) before the algorithm quits.
%
% Note: This is a simplified version of the SMO algorithm for training
%       SVMs. In practice, if you want to train an SVM classifier, we
%       recommend using an optimized package such as:
%
%           LIBSVM   (http://www.csie.ntu.edu.tw/~cjlin/libsvm/)
%           SVMLight (http://svmlight.joachims.org/)
%
%

if ~exist('tol', 'var') || isempty(tol)
    tol = 1e-3;
end

if ~exist('max_passes', 'var') || isempty(max_passes)
    max_passes = 5;
end

if strcmp(func2str(kernelFunction), 'linearKernel')
  % Delegate training to libsvm
  model = svmtrain(Y, X, ['-s 0 -t 0 -c ', num2str(C)]);
%  model.w = model.SVs' * model.sv_coef;
%  model.b = -model.rho;
%  if (model.Label(1) == -1)
%        model.w = -w;
%        model.b = -b;
%  end
  return;
end
