# target to make the file report
all: 05_final_report.html 

labeled_data.p: 
	sh 01_get_original_data.sh

05_final_report.html: labeled_data.p
	jupyter nbconvert --to pdf 05_final_report.ipynb

	jupyter nbconvert --to pdf extension/Extension_with_Twitter_Data.ipynb
	
	jupyter nbconvert --to pdf extension/Exploratory_data_analysis.ipynb
	
	jupyter nbconvert --to pdf extension/Binary_class_Exploratory_data_analysis.ipynb
	
	jupyter nbconvert --to pdf extension/Binary_class_replication.ipynb
	
	jupyter nbconvert --to pdf extension/single_class_Base_paper_replication.ipynb
	
	jupyter nbconvert --to pdf extension/Transfer_Learning_binary_classification.ipynb
	
	jupyter nbconvert --to pdf extension/Transfer_Learning_multiclass.ipynb