
clear all; close all;
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN');
[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.50');
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.100');
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.200');
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.400');
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.800');
%[spmatrix, tokenlist, trainCategory] = readMatrix('MATRIX.TRAIN.1400');

trainMatrix = full(spmatrix);
numTrainDocs = size(trainMatrix, 1);
numTokens = size(trainMatrix, 2);

% trainMatrix is now a (numTrainDocs x numTokens) matrix.
% Each row represents a unique document (email).
% The j-th column of the row $i$ represents the number of times the j-th
% token appeared in email $i$.

% tokenlist is a long string containing the list of all tokens (words).
% These tokens are easily known by position in the file TOKENS_LIST

% trainCategory is a (1 x numTrainDocs) vector containing the true
% classifications for the documents just read in. The i-th entry gives the
% correct class for the i-th email (which corresponds to the i-th row in
% the document word matrix).

% Spam documents are indicated as class 1, and non-spam as class 0.
% Note that for the SVM, you would want to convert these to +1 and -1.


% YOUR CODE HERE
spam_indices = find(trainCategory == 1);
non_spam_indices = find(trainCategory == 0);

spamMatrix = sum(trainMatrix(spam_indices, :));
no_spamMatrix = sum(trainMatrix(non_spam_indices, :));

phi_1 = log((spamMatrix + 1.0) ./ (numTokens + sum(spamMatrix)));
phi_0 = log((no_spamMatrix + 1.0) ./ (numTokens + sum(no_spamMatrix)));

delta = phi_1 - phi_0;

sig_tokens = zeros(5,1);
for i = 1:5
  [m,n] = max(delta);
  sig_tokens(i) = n;
  delta(n) = -9999;
end


