function [testlabels]=svmclassification(X,Y)%add Z when using SIFT
addpath('C:\Program Files\MATLAB\libsvm-3.17\windows');%adding libsvm
u=mean(X);
sigma=std(X);
m=size(X,1);
X=(X-repmat(u,m,1))./repmat(sigma,m,1);
%Parameter tuninig for rbf kernel
%  bestcv = 0;
%  for log2c = 1:5,
%    for log2g = -5:1,
%     cmd = ['-v 5 -c ', num2str(2^log2c), ' -g ', num2str(2^log2g),' -q'];
%     cv = svmtrain(double(Y),double(X),cmd);
%     if (cv >= bestcv),
%       bestcv = cv; bestc = 2^log2c; bestg = 2^log2g;
%     end
%     fprintf('%g %g %g (best c=%g, g=%g, rate=%g)\n', log2c, log2g, cv, bestc, bestg, bestcv);
%   end
% end
%Training model
% opts=['-c ',num2str(bestc),'-g ',num2str(bestg),' -q'];
model=svmtrain(double(Y),double(X),'-c 32 -g 0.00390625');
%69.4 on c=32 g=.00390625 rbf kernel
disp('Training set accuracy');
svmpredict(double(Y),double(X),model);
%get validation features
% fin=fopen('validation_feature_vectors.txt');
% validfeatures=[];
% while ~feof(fin)
%     currline=fgetl(fin);
%     C=regexp(currline,' ','split');
%     C=C(2:end-1);
%     C=cellfun(@str2num,C);
%     validfeatures=[validfeatures;C];
% end
% fclose(fin);
% m=size(validfeatures,1);
% %validation feature standardization
% validfeatures=(validfeatures-repmat(u,m,1))./repmat(sigma,m,1);
% %svm prediction
% validlabels=svmpredict(double(zeros(m,1)),double(validfeatures),model);

%Get Test features
fin=fopen('TagMe!-TestData\Test\feature_vectors.txt');
testfeatures=[];
while ~feof(fin)
    currline=fgetl(fin);
    C=regexp(currline,' ','split');
    C=C(2:end-1);
    C=cellfun(@str2num,C);
    testfeatures=[testfeatures;C];
end
fclose(fin);
m=size(testfeatures,1);
testfeatures=(testfeatures-repmat(u,m,1))./repmat(sigma,m,1);
testlabels=svmpredict(double(zeros(m,1)),double(testfeatures),model);
end