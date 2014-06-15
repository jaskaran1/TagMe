function [X,Y]=setup_input()%returns labels of the training set
fin=fopen('train_feature_vectors.txt');
X=[];
while ~feof(fin)
currline=fgetl(fin);
C=regexp(currline,' ','split');
C=C(2:end-1);
C=cellfun(@str2num,C);
X=[X;C];
end
fclose(fin);
Y=[];
fin=fopen('train_labels.txt');
while ~feof(fin)
currline=fgetl(fin);
C=regexp(currline,' ','split');
C=C(2);
C=str2num(char(C));
Y=[Y;C];
end
fclose(fin);
end