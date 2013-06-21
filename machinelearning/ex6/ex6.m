clear all; close all;

numTrainDocs = 700;
numTokens = 2500;
M = dlmread('train-features.txt', ' ');
spmatrix = sparse(M(:,1), M(:,2), M(:,3), numTrainDocs, numTokens);
train_matrix = full(spmatrix);
train_labels = dlmread('train-labels.txt');

spam_indices = find(train_labels == 1);
nonspam_indices = find(train_labels == 0);

prob_spam = length(spam_indices) / numTrainDocs;

email_lengths = sum(train_matrix, 2);

spam_wc = sum(email_lengths(spam_indices));
nonspam_wc = sum(email_lengths(nonspam_indices));

prob_tokens_spam = (sum(train_matrix(spam_indices, :)) + 1) ./ (spam_wc + numTokens);

prob_tokens_nonspam = (sum(train_matrix(nonspam_indices, :)) + 1)./ (nonspam_wc + numTokens);
