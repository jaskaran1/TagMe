%create output file for upload
function  output_2_file(validlabels)
fin=fopen('./TagMe!-TestData/Test/feature_vectors.txt');
fout=fopen('test_labels_output.txt','wt');
i=1;
while ~feof(fin)
currline=fgetl(fin);
C=regexp(currline,' ','split');
C=C(1);
C=char(C);
fprintf(fout,'%s %d\n',C,validlabels(i));
i=i+1;
end
fclose(fin);
fclose(fout);
end