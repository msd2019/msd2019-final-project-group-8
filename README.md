# Final Project for Modeling Social Data, 2019

Ketakee Nimavat (kkn2112), Chandana priya (cg3111), Ankit Peshin (ap3772)

This repository has code to attempt to replicate and extend the results in Automated Hate Speech Detection and the Problem of Offensive Language by Thomas Davidson, Dana Warmsley, Michael Macy, Ingmar Weber4 Published in ICWSM 2017.

You can find the Shiny app here :  https://ankitpeshin.shinyapps.io/Twitter-wordvec/

A complete report of our results is in `05_final_report.pdf`, which can be generated by cloning this repository and running `make` to execute the commands in the `Makefile` file. All data are in `data/` and any original source code provided by the authors is in `authors_original_code/`.

The repository is structured as follows:

1. `01_get_original_data.sh` gets the original data used by the authors and places a copy in `data/`

2. `05_final_report.ipynb` contains the replication results of the original paper, and produces the final report `05_final_report.pdf`

3. `extension/` folder contains all our code files that were used to implement and extend the author's work. The app.R and twitter_vector.Rmd are the files for our app and will allow you to replicate the app.  

4. `extension/Exploratory_data_analysis ` - Contains code for multiclass data analysis on author's data

5. `extension/Extension_with_Twitter_Data ` - contains replication of author's approach on twitter data

Datasets:
We use the following datasets in our codes:
1. Original author's data: https://github.com/t-davidson/hate-speech-and-offensive-language/tree/master/data
2. Hate Speech Data from a white supremacist forum: https://github.com/aitor-garcia-p/hate-speech-dataset

Colab notebook links:


multiclass base paper replication: https://colab.research.google.com/drive/1LNLkaRnlGfxSEIFpITW1tksxwC3SXAoX#scrollTo=f1EMZjSyZZ1k	

Binary class base paper extension: https://colab.research.google.com/drive/1EjDzQ2JWiRdNDzZV-EB7c3QIxV-kY4xm#scrollTo=LkO291wljIJv	

Transfer_learning_binary class: https://colab.research.google.com/drive/1kjCE2owX_s6yCK7pp7SkBY5ytKXfHs-n#scrollTo=f1EMZjSyZZ1k	

Transfer Learning multiclass: https://colab.research.google.com/drive/1LNLkaRnlGfxSEIFpITW1tksxwC3SXAoX#scrollTo=f1EMZjSyZZ1k	

Train test_both_data: https://colab.research.google.com/drive/1Jl_IAWQr5LQDJeHY9oBRV6a-7OM2Dt8i	

Exploratory Data Analysis on Binary Class Data: https://colab.research.google.com/drive/1ZipL4JyimrM8lVV4_nAo2iXJiHr_FXoo	

Exploratory data analysis on multiclass data: https://colab.research.google.com/drive/1hfhtsm5NZeEYeRTI-B0dLqYUPjmAHdXM	

----

Notes:

The exact structure of the repository may vary from group to group. For instance, you might have a different number of files, some might be `.R` scripts instead of `.sh` scripts, etc., but follow the basic template and edit this README accordingly so that others can run your code and reproduce _your_ results with one command that executes your entire analysis from start to a finished report. You don't necessarily have to use make for your "run all" command, but it can be quite helpful, especially if the process of getting or cleaning the data takes much longer than running the final analysis and generating the report. Whatever the "run all" command is, it should be clearly noted so that others know what it is and how to execute it. If the data files you are using are small enough, add a copy directly to your repository. If a file is too large to add to the repository, include a URL that points to a copy of the data so that others can access it. 

(Delete these notes in your copy of the repository.)
