# Classification Machine Learning Models for credit decisions



## Analysis Project
We decided to analyze loan data to build classification supervised machine learning models that predict good and bad loans with high accuracy.

We felt that working with loan data and credit decision predictions would not only be very interesting, as it is widely used across lending institutions, but also a very useful exercise. 

We use a dataset of Lending Club loan data spanning over 10 years.  The dataset was downloaded from Kaggle, as Lending Club no longer makes its loan data available to the general public as they did until recently.  Our dataset contains over 2.2 million rows of data, representing loan recipients and 151 columns of data pertaining to the loans. 

### Questions we hope to answer through this project

* Can we build machine learning models that predict good and bad loans with high accuracy?
* Which factors (variables) contribute the most helpful information to the machine learning model?
* Which type of machine learning model is best suited for this task?
* Which optimization or boosting methods best help optimize the accuracy of machine learning models for this type of dataset?



## GitHub
Our communication protocols include:
* Schedule group online meetings (Google Hangouts/Zoom)
* Slack to notify team members of GitHub commits
* Email & Slack to coordinate collaboration and schedule changes
* Coordinating to attend TA office hours as a team 

## Machine Learning Model
We built a first iteration machine learning model that connects to the sample data from the provisional database we built. This model is a Logistic Regression ML model that takes whether a loan is "Good" or "Bad" as the variable we are looking to predict (dependent or "y" value) and takes "FICO credit score" and "Debt-to-Income Ratio" as independent variables ("X" variable for the ML model).


![ML model code](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/ML%20model%20code.PNG) 

Our initial mockup Machine Learning model produces an accuracy score of 0.81
![accuracy score](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/accuracy%20score.PNG)

## Database
We built a provisional SQLite database that takes sample loan data from our Lending Club loan dataset and creates a dataframe that can be read into our Machine Learning model. 

![Database connection](https://github.com/JRHattan/Dummy_Hub/blob/main/Resources/Database%20connection.PNG) 

