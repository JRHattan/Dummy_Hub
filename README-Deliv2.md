# Classification Machine Learning Models for credit decisions



## Analysis Project
We decided to analyze loan data and build classification supervised machine learning models that predict good and bad loans with high accuracy.

We felt that working with loan data and credit decision predictions would not only be very interesting, as it is widely used across banks and other lending institutions, but also a very useful exercise to further develop coding and machine learning skills. 

We use a dataset of Lending Club loan data spanning over 10 years.  The dataset was downloaded from Kaggle, as Lending Club no longer makes its loan data available to the general public as they did until recently.  Our dataset contains over 2.2 million rows of data, representing loan recipients and 151 columns of data pertaining to the loans. 

### Questions we hope to answer through this project

* Can we build machine learning models that predict good and bad loans with high accuracy?
* Which factors (variables) contribute the most helpful information to the machine learning model?
* Which type of machine learning model is best suited for this task?
* Which optimization methods best help optimize the accuracy of machine learning models for this type of dataset?

## Presentation 
We created a presentation that outlines our project, the link to access the presentation in Google Slides is:
https://docs.google.com/presentation/d/1wl5fh1hy7INwmN3SFGhOb3SmR-6gdZKuIa7i79OaafM/edit?ts=5fe9341f#slide=id.gb622606d37_0_5

## Machine Learning Model

### Preliminary data preprocessing
We performed extensive preliminary data preprocessing to prepare our dataset to function properly in Machine Learning models, including:
* We filtered our dataset on “loan_status” column, dropping all categories except “Fully Paid” & “Charged Off” to create a “good loan vs. bad loan” column ( we exclude data pertaining to  loans that are in repayment to focus only on the loans where the outcome is known, either “Fully Paid” (good loans) or “Charged Off” (bad loans))
* We learned from our data exploration  that the loan dataset contained a large amount of missing values, so we dropped all columns that were missing over 100,000 values
* We used the “data dictionary” from Lending Club to learn about each column of data and used this resource and subject matter expertise to drop duplicate data columns, text and date data columns that are not usable in ML models, as well as data columns  that would not be known before a loan is approved and being serviced
* We dropped missing values or “na”s from dataset using Panda’s “dropna” method
* We transformed non-numeric categorical data to dummy variables with Panda’s “get_dummies” method


### Preliminary feature engineering and preliminary feature selection

To reduce the features to include in our ML models, we first eliminated the features with large amounts of missing data. Then we eliminated those with redundant or duplicate data, and further refined our dataset by removing features that do not provide data relevant to making predictions about credit risk.

 * We dropped features containing duplicate or redundant loan data in some form, as well as loan data set features that would be unknown at the time of a credit application.

    * The  features included our ML models are information coming from the loan application or a credit report pulled on the loan applicant when they applied for a loan 
    * The features contain data like a borrower’s Annual Income, Debt-to-Income Ratio, FICO score, outstanding credit limits and utilization amounts, delinquencies on other credit lines, bankruptcy history and public records about borrowers, among others.

### Determining training and testing datasets
We split our data into training and testing sets, using scikit-learn’s “train_test_split” method, and used the default split of 75% of data for model training and 25% of data for model testing.  



### Model choice
We ran several types of Machine Learning models on our preprocessed Lending Club dataset, including Logistic Regression and Balanced Random Forest Classifier models. We focus on these types of Supervised Machine Learning models because they are suited to make classification predictions, as well as their robustness and ability to handle large amounts of data. While Logistic Regression models tend to be easy to interpret, they tend to produce lower accuracy scores than other ML model types. Random Forest models tend to have higher accuracy and are also generally easier to interpret.

Logistic Regression Model:

![LogisticRegressionModel](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/LogisticRegressionModel.png)

Random Forest Classifier Model:

![BRFCModel_Accuracy_ClassifReport](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFCModel_Accuracy_ClassifReport.png)


## Database
 
We created a Database using Postgres and an AWS to store our raw Lending Club dataset and a cleaned version of the dataset. We use Spark to upload our raw loan dataset (in csv format) to the database named 'credit_decisions', and 
* We joined 2 tables using a SQL "full join"
![Join](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/Join.PNG)
* Our Machine Learning model connects to the Database using a  SQLAlchemy connection string
* We created an Entity Relationship Diagram (ERD) to map the data relationships in our datasets

![ERD](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/ERD_Join_Test.png)

## Dashboard
To help consumers of our analysis, we are using Tableau to create a visual and interactive dashboard. We will import the dataset from our SQL databse into Tableau. 

Description of the bluprint of interactive elements we plan to build into our Dashboard:

* A visualization where is has the total percent of loans selected at any given time
* A visualization that shows the average FICO score of the loans that are selected at any given time
* A pie chart of one of the ratios we are using
* A gauge chart of that is based on how risky the loan is
* A scatter chart of annual income and loan amount
* A bubble chart of tax liens and loan amount
* Line chart of months and amount of loans or number of good vs. bad loans

## GitHub
 Out Github repository contains  

* The code necessary to perform exploratory analysis on our raw dataset

![DataExploration_code](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/DataExploration_code.png)

✓ The Machine Learning code we created to make credit decisions and predict the classification of 'Fully Paid' (good) and 'Charged Off' (bad) loans  
![BRFC_model_deliv2](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFC_model_deliv2.png)
