# Classification Machine Learning Models for credit decisions



## Analysis Project
We decided to analyze loan data to build classification supervised machine learning models that predict good and bad loans with high accuracy.

We felt that working with loan data and credit decision predictions would not only be very interesting, as it is widely used across lending institutions, but also a very useful exercise. 

We use a dataset of Lending Club loan data spanning over 10 years.  The dataset was downloaded from Kaggle, as Lending Club no longer makes its loan data available to the general public as they did until recently.  Our dataset contains over 2.2 million rows of data, representing loan recipients and 151 columns of data pertaining to the loans. 

### Questions we hope to answer through this project

* Can we build machine learning models that predict good and bad loans with high accuracy?
* Which factors (variables) contribute the most helpful information to the machine learning model?
* Which type of machine learning model is best suited for this task?
* Which optimization methods best help optimize the accuracy of machine learning models for this type of dataset?

## Presentation 

Content 
The presentation outlines the project, including the following: 
✓ Selected topic 
✓ Reason why they selected their topic 
✓ Description of their source of data 
✓ Questions they hope to answer with the data 
✓ Description of the data exploration phase of the project 
✓ Description of the analysis phase of the project 

Slides Presentations are drafted in Google Slides
https://docs.google.com/presentation/d/1wl5fh1hy7INwmN3SFGhOb3SmR-6gdZKuIa7i79OaafM/edit?ts=5fe9341f#slide=id.gb622606d37_0_5

## GitHub
Github
Master Branch 
All code in the master branch is production-ready. 
The master branch should include: 

✓ All code necessary to perform exploratory analysis 

![DataExploration_code](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/DataExploration_code.png)

✓ Some code necessary to complete the machine learning portion of the project README.md 

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

![BRFCModel_Accuracy_ClassifReport](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/BRFCModel_Accuracy_ClassifReport.PNG)




## Database
 
Team members present a fully integrated database. 
✓ Database stores static data for use during the project 
✓ Database interfaces with the project in some format (e.g., scraping updates the database, or database connects to the model) 
✓ Includes at least two tables (or collections, if using MongoDB) 
✓ Includes at least one join using the database language (not including any joins in Pandas) 
✓ Includes at least one connection string (using SQLAlchemy or PyMongo) 
Note: If you use a SQL database, you must provide your ERD with relationships.

![Database connection](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFCModel_Accuracy_ClassifReport.png)



## README.md must include: 
✓ Description of the communication protocols 
✓ Outline of the project (this may include images, but should be easy to follow and digest) Note: The descriptions and explanations required in all other project deliverables should also be in your README.md as part of your outline, unless otherwise noted.

Individual Branches 
✓ At least one branch for each team member 
✓ Each team member has at least four commits for the duration of the second segment (eight total commits per person)





## Dashboard
To help consumers of our analysis, we are using Tableau to create a visual and interactive dashboard. We will import the dataset from our SQL databse into Tableau. 
Description of interactive element(s)- 
* Have a visualization where is has the total percent of loans selected  at any given time
* A visualization that shows the average FICO score of the loans that are selected at any given time
* A pie chart of one of the ratios we are using
* A gauge chart of that is based on how risky the loan is
* A scatter chart of annual income and loan amount
* A bubble chart of tax liens and loan amount
* Line chart of months and amount of loans or number of good vs. bad loans


