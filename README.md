# Classification Machine Learning Models for credit decisions



## Analysis Project
We decided to analyze loan data to build classification supervised machine learning models that predict good and bad loans with high accuracy.

We felt that working with loan data and credit decision predictions would not only be very interesting, as it is widely used across lending institutions, but also a very useful exercise. 

We use a dataset of Lending Club loan data spanning over 10 years.  The dataset was downloaded from Kaggle, as Lending Club no longer makes its loan data available to the general public as they did until recently.  Our dataset contains over 2.2 million rows of data, representing loan recipients and 151 columns of data pertaining to the loans. 

### Questions we hope to answer through this project

    What factors constitutes a successful loan versus a risky loan
	    Does the time at which a payment is done determine the outcome of a loan
	    Does the amount of a payment indicate the successfulness of the loan
	    Do  delinquents alter the amount of successful versus not being successful
	    What step of a loan is important for predicting the outcome of a loan

	    What information should be defined for the machine learning
		    What are the dependent variable versus the independent variable based off of the filtered loan data
    Do we need to have more than one independent variable to compare against the one dependent variable


## GitHub
✓ Description of the communication
protocols 
    *Schedule group online meetings (Google Hangouts/Zoom)
    *Slack to notify team members of GitHub commits
    *Email & Slack to coordinate collaboration and schedule changes

## Machine Learning Model
we built a first iteration machine learning model
✓ Takes in data in from the provisional
database
✓ Outputs label(s) for input data

![ML_model_mockup_version1](./Resources/ML_model_mockup_version1.png) 

## Database
✓ Sample data that mimics the
expected final database structure or
schema
✓ Draft machine learning module is
connected to the provisional database

![SQLite_DB_mockup](./Resources/SQLite_DB_mockup.png) 

### Resources
    All of the data comes from a CSV file from Lending Club which can be found on Kaggle.com  
	    The data presented comes from the collection of information such as:
		    Fully paid
		    Current
		    In Grace Period
		    Late (16-30)
		    Late (30-120)
		    Charged off 
