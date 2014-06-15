%[train_hist,valid_hist]=setup_input_images();
[X,Y]=setup_input();%labels for the training set
[labels]=svmclassification(X,Y);
output_2_file(labels);