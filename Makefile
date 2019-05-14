# target to make the file report
all: 05_final_report.html 

labeled_data.p: 
	

05_final_report.html: labeled_data.p
	jupyter nbconvert --to pdf 05_final_report.ipynb

