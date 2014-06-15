[train_hist,valid_hist]=setup_input_images();
Y=gettrainlabels();
[labels]=svmclassificationwithsift(train_hist,valid_hist,Y);
output_2_file_sift(labels);