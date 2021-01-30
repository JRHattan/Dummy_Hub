# Classification Machine Learning Models for credit decisions

## Introduction

We focused our project on building a Classification based machine learning model to predict whether a loan will be “good”, and be fully paid back (with interest), or “bad”, and be charged off (at a loss to the lender). We chose this in part because we found it an interesting learning opportunity, but also because we felt it had real world application, with lenders of all types, investing a lot of resources into finding more optimal credit decision prediction tools.

### Dataset Acquisiton & Database

We analyzed Lending Club (a peer-to-peer lending company) loan data that we acquired from Kaggle.com (as Lending Club recently stopped making it's loan data available through an API). We then created a Database using AWS and connected it with postgres, and stored both our raw Lending Club CSV file and a CSV file that had undergone our preliminary pre-processing. We used Spark to upload these CSVs to the database named 'credit_decisions'. Once we needed the date of loan issuance, we pulled the clean dataset's variables and the raw CSV's ID and Issue date columns into temporary tables, merged them with a full join, and dropped NaN Columns:
![Updated_Join](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/Updated_Join.PNG)

We created an Entity Relationship Diagram (ERD) to map this relationship:

![Tableau_ERD](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/Tableau_ERD.png)

Our Machine Learning model code files connect to the Database using a SQLAlchemy connection string and read in the data and run the models, outputting accuracy, precision and recall scores.

## Dashboard 
The Tableau dashboard visualizes variable relationships, letting us see changes over time and the relatioships between variables. Many visualizations highlighted dataset class imbalances our project needed to adjust for. In particular, we noticed several variables, such as a borrower's annual income, had wide ranges- going from $1,000 USD to $11,000,000 USD. To protect the model from interference, we realized the dataset needed scaling, which we implemented using StandardScaler. 
Our Dashboard's link allows access to interactive elements, including Average loan amount by state, Loan Purpose, Loan Amounts and Interest Rates Charged, and both the scaled and unscaled versions of annual income vs FICO. The link is: https://public.tableau.com/profile/joel8111#!/vizhome/Deliv4Dashboard/Dashboard1

## Machine Learning Model

### Preliminary data preprocessing
We performed extensive preliminary data preprocessing to prepare our dataset to function properly in Machine Learning models, including:

* Dropping all “loan_status” column categories except “Fully Paid” (good loans) & “Charged Off” (bad loans), creating a “good loan vs. bad loan” column (we excluded loans still in repayment to focus only on loans with a known outcome.)

* Dropping all columns missing over 100,000 values, as our data exploration showed a large amount of columns with many missing values.

* Using Lending Club's "Data Dictionary" as a guide, in addition to loan/credit domain knowledge, we dropped duplicate and redundant columns, text and date columns not usable in ML models, and columns with information lenders would not know pre-issuance.

* Dropping missing values or “na”s from dataset using Panda’s “dropna” method

* Transforming non-numeric categorical data to dummy variables with Panda’s “get_dummies” method

### Preliminary feature engineering and preliminary feature selection
Since our raw dataset contained a large variable count (151 columns), we used feature engineering, reducing the feature quantity included in our ML models. We already eliminated features within our preliminary process, so we then used Principal Component Analysis (PCA), a statistical technique to optimize ML models by reducing the input features by transforming a large set of variables into a smaller one that contains the most valuable information in the original larger set.
The features determined by our feature reduction process represent information about a borrower’s Credit score, Annual Income, Debt-to-Income Ratio, Loan Amount, Total Credit Revolving Balance, Revolving line utilization rate (the proportion of credit the borrower is using relative to all available revolving credit).

![Selected_features_LCDataDictionary](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/Selected_features%20_LCDataDictionary.png) 

### Determining training and testing datasets
Using scikit-learn’s “train_test_split” method, we split our data into training and testing sets. We used the default split, with 75% of data (946,875 each rows representing a loan) used in model training and 25% of data (315,625 loans) used in model testing. Additionally, we use the 'stratify=y' argument which locks class distribution (good loans vs. bad loans) in our 'train' and 'test' sets, ensuring similar class distributions.

![Test_train_split-stratify](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/Test_train_split-stratify.png)

### Model choice, limitations and benefits
We ran multiple Machine Learning models on our preprocessed Lending Club dataset, including Logistic Regression, Decision Trees, Easy Ensemble Classifiers and Balanced Random Forest Classifier models. We focused on BRFC Supervised Machine Learning models because they specialize in classification, deal well with large datasets, and were made specifically to work with data imbalances (our dataset has roughly 3.5 times as many 'good' loans as it does 'bad' loans). We also utilized the 'StandardScaler', as our data contains features with vastly varying magnitudes, units, and wide distributions. Scaling our features reduces the machine learning algorithms' tendency to weigh greater values, higher and consider smaller values as the lower values, regardless of the unit of the values or the range they cover.

![BRFC_model_scaled](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFC_model_scaled.png)

* We added Principal Component Analysis (PCA) to our BRFC model (between Segment 2 and Segment 3 deliverables) reducing the dimensions (columns) we fed into the model, increasing model accuracy and reducing Precision and Recall differences across 'good' and 'bad' loan classes. 

![PCA_15variables-7Components](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/PCA_15variables-7Components.png)

We iterated over different combinations of features and Principal Components, using the 'Feature Importance' ranking to select the highest importance features. Our final BRFC model uses PCA on 15 features, reducing them to 7 Principal Components.

The Balanced Random Forest Classifier model did improve the balance between precision and recall scores between the minority (bad loans) class and the majority (good loans) class modestly, however this type of model was not able to better correct for the class imbalance.


### Confusion Matrix

We used Confusion Matrices and classification reports based on them to evaluate our machine learning models, as looking at accuracy scores alone does not show a the entire picture, as there can be large differences in model performance for the different classes. In our case, precision scores for 'good loans' were higher than those for 'bad loans, indicating the model's bias towards better predicting good loans accurately than predicting bad loans. 

![Confusion_Matrix](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/Confusion_Matrix.png)

#### Accuracy Scores
The successive models we built, trained and tested produced accuracy scores that increased from 0.49 (reducing 46 features to 10 Principal Components) 

![BRFC_PCA10_46Vars_AccuracyClassification](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFC_PCA10_46Vars_AccuracyClassification.png)

to an accuracy score of 0.549 (reducing 15 variables to 7 Principal Components).

![BRFC_PCA7_15Vars_AccuracyClassification](https://github.com/JRHattan/ML_Models_For_Credit_Decisions/blob/main/Resources/BRFC_PCA7_15Vars_AccuracyClassification.png)



### Analysis Conclusion

While we were able to build a machine learning models to predict good and bad loans based on data about borrowers, our model accuracy score and balance between precision and recall are lower than we had hoped for.  Our Balanced Random Forest Classifier model predicts loans accurately better than half the time (0.549), however precision for predicting good loans is higher (at 0.85) for predicting good loans than bad loans (precision of only 0.25).

We found that the features that contributed most to the model were a borrower's credit score, annual income and several indebtedness metrics including debt-to-income ratio, total credit revolving balance and utilization amount.
We also found that models can be improved by using feature scaling and reducing features using Principal Component Analysis.

Ideas for future exploration of building models with higher accuracy and better balance between majority and minority data classes include revisiting all of the variables in the original loan data set for potential inclusion, scaling only some of the data instead of scaling all variables and trying more types of machine learning models and combinations of optimization methods.


## Presentation
We created a presentation slide deck, describing our project predicting loan outcomes with machine learning models. We describe the data's journey, beginning as a CSV file from lending club, then being stored in AWS, finally ending in either python for machine learning or Tableau for visualization. Our visualizations demonstrate the inherent data issues our machine learning model had to compensate for, including imbalanced data and variable magnitude. After describing the model selection process, the model shows favorable majority class results regarding precision and F-1, but weak scores for the minority class and a lower than expected accuracy score. 

the Google Slides access link is:https://docs.google.com/presentation/d/1q2SU-XQI5yillNyortmdWvhH6c2DlVsQcU0IHrX7z9M/edit#slide=id.gafd5d94e75_0_0

The presentation script/notes used for class presentation are available at this link:
 https://docs.google.com/document/d/1-3JaPpjwy7XtnsIfPglCtr1RHugtNz9oesQg2Ze1WS8/edit?usp=sharing


## Github
We used GitHub for storage and sharing project work. We created 7 branches. A branch for each project member, a gitignore branch, a requirementstxt, and a Main Branch. The Master Branch contains all of our final project work screenshots and master code.

