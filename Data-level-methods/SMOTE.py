import pandas as pd
import numpy as np
from sklearn.linear_model import LogisticRegression
# See Notes/environment for how I set this up

# SEE Notes/numpy for numpy notes
rng = np.random.default_rng(42)

# See Notes/pandas for pandas notes
df = pd.read_csv("creditcard.csv")

# Seperate the classes and take 70% of each for training data
# I do this because I dont want the 70% to take all the 0.17% of the frauds

df_non_fraud = df[df["Class"] == 0]
df_fraud = df[df["Class"] == 1]

# Randomaly permutate the rows of each then take the first 70%
# This gives and exact split versus a randomaly generated true false mask

# Get the counts
class_counts = df["Class"].value_counts()
non_fraud_count = class_counts.loc[0]
fraud_count = class_counts.loc[1]

# Run the permutation
non_fraud_perm = rng.permutation(non_fraud_count)
fraud_perm = rng.permutation(fraud_count)

split_ratio = 0.7
cut_non_fraud = int(split_ratio * non_fraud_count)
cut_fraud = int(split_ratio * fraud_count)

# Get the training and test data
train_non_fraud = df_non_fraud.iloc[non_fraud_perm[:cut_non_fraud]]
train_fraud = df_fraud.iloc[fraud_perm[:cut_fraud]]

test_non_fraud = df_non_fraud.iloc[non_fraud_perm[cut_non_fraud:]]
test_fraud = df_fraud.iloc[fraud_perm[cut_fraud:]]

# Combine for the samples
train_df = pd.concat([train_non_fraud, train_fraud])
test_df = pd.concat([test_non_fraud, test_fraud])

# print(len(train_df), len(test_df))
# print(train_df["Class"].mean(), test_df["Class"].mean(), df["Class"].mean())

'''

# First show that a logistic regression will predict about 99.83% but is useless
X_train_df = train_df.drop(columns=["Class", "Time"])
y_train_df = train_df["Class"]

X_test_df = test_df.drop(columns=["Class", "Time"])
y_test_df = test_df["Class"]


# Here I implemented before fully understanding scipy to see the failure of the model
# Later I will implement myself and take notes

model = LogisticRegression(max_iter=1000)
model.fit(X_train_df, y_train_df)
predictions = model.predict(X_test_df)

accuracy = 100 * (predictions == y_test_df).mean()
fraud_guesses = predictions.sum()
actual_frauds = y_test_df.sum()

print(f"""\nHere is how accurate our model is: {accuracy:.2f}%\n\n
Now observe how many it guessed would be fraud: {fraud_guesses}\n\n
Now observe the actual amount of frauds: {actual_frauds}\n""")









# Next step is the confusion matrix and then implement the actual SMOTE

'''