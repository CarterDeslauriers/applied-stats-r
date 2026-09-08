import pandas as pd
import numpy as np
from sklearn.linear_model import LogisticRegression
import matplotlib.pyplot as plt
# See Notes/environment for how I set this up

# See Notes/pandas for pandas notes
df = pd.read_csv("creditcard.csv")


def data_creation(df, rng):
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


    X_train_df = train_df.drop(columns=["Class", "Time"])
    y_train_df = train_df["Class"]

    X_test_df = test_df.drop(columns=["Class", "Time"])
    y_test_df = test_df["Class"]

    means = X_train_df.mean()
    stds = X_train_df.std()

    X_train_df = (X_train_df - means) / stds

    X_test_df = (X_test_df - means) / stds

    return X_train_df, y_train_df, X_test_df, y_test_df

# First show that a logistic regression will have high accuracy but is useless

# Here I implemented before fully understanding scipy to see the failure of the model
# Later I will implement myself and take notes




def traditional(X_train_df, y_train_df, X_test_df, y_test_df, name, verbose):
    model = LogisticRegression(max_iter=1000)
    model.fit(X_train_df.values, y_train_df.values)
    predictions = model.predict(X_test_df.values)

    return validate(predictions, y_test_df.values, name, verbose)






def validate(predictions, y_test_df, name, verbose=True):
    if verbose:
        print(f"\n{name} Model")

    accuracy = 100 * (predictions == y_test_df).mean()
    fraud_guesses = predictions.sum()
    actual_frauds = y_test_df.sum()

    if verbose:
        print(f"""\nHere is the percentage of time our model is correct: {accuracy:.2f}%\n
Now, how many it guessed would be fraud: {fraud_guesses}\n
Now, the actual amount of frauds: {actual_frauds}\n""")


    # Now create the confusion matrix for a better test of accuracy / usefulness
    # See Notes/validation-metrics.md for notes on the confusion matrix

    false_negatives = ((predictions == 0) & (y_test_df == 1)).sum()
    true_negatives = ((predictions == 0) & (y_test_df == 0)).sum()
    false_positives = ((predictions == 1) & (y_test_df == 0)).sum()
    true_positives = ((predictions == 1) & (y_test_df == 1)).sum()
    recall = 100 * (true_positives / (true_positives + false_negatives))
    precision = 100 * (true_positives / (true_positives + false_positives))

    if verbose:
        print(f"""\nFalse Negatives: {false_negatives}\n
True Negatives: {true_negatives}\n
False Positives: {false_positives}\n
True Positives: {true_positives}\n
Recall: {recall:.2f}%\n
Precision: {precision:.2f}%\n""")
    
    return recall, precision





def SMOTE(X_train_df, y_train_df, X_test_df, y_test_df, rng, name, verbose):

    # Now implement SMOTE
    train_fraud_df = X_train_df[y_train_df == 1]

    train_fraud_matrix = train_fraud_df.values

    k = 5
    k_neighbor_points = []
    for i in range(len(train_fraud_matrix)):

        # Broadcast subtraction
        subtracted = train_fraud_matrix - train_fraud_matrix[i]

        # Sqaure the distances
        squared = subtracted ** 2

        # Sum the distances in each dimension
        summed = squared.sum(axis=1)

        # Take sqaure root
        square_rooted = np.sqrt(summed)

        # List min to max
        listed = np.argsort(square_rooted)

        # Filter to 5 nearest neighbors
        k_nearest = listed[1:k+1]

        # Add it to the list where the index i holds the k nearest neighbors selected at neighbor_points[i]
        k_neighbor_points.append(k_nearest)


    # First turn the list into an array
    k_neighbor_points = np.array(k_neighbor_points)

    # Create the new points
    n = len(X_train_df) - 2*len(train_fraud_matrix)
    point_choice = rng.integers(len(train_fraud_matrix), size=n)
    neighbor_choice = rng.integers(k, size=n)
    neighbor_index = k_neighbor_points[point_choice, neighbor_choice]

    merge_ratio = rng.uniform(size=(n,1))
    new_points = train_fraud_matrix[point_choice] + merge_ratio * (train_fraud_matrix[neighbor_index] - train_fraud_matrix[point_choice])

    X_train_matrix = np.vstack([X_train_df.values, new_points])
    y_train_matrix = np.concatenate([y_train_df.values, np.ones(n)])


    # Now run the regression and re validate

    model = LogisticRegression(max_iter=1000)
    model.fit(X_train_matrix, y_train_matrix)
    predictions = model.predict(X_test_df.values)


    return validate(predictions, y_test_df.values, name, verbose)
    





runs = 50
results = []
for i in range(runs):
    # SEE Notes/numpy for numpy notes
    rng = np.random.default_rng(i)

    X_train_df, y_train_df, X_test_df, y_test_df = data_creation(df, rng)
    r1, p1 = traditional(X_train_df, y_train_df, X_test_df, y_test_df, name="Traditional", verbose=False)
    r2, p2 = SMOTE(X_train_df, y_train_df, X_test_df, y_test_df, rng, name="SMOTE", verbose=False)
    results.append({"Seed": i, "Traditional-Recall": r1, "Traditional-Precision": p1, "SMOTE-Recall": r2, "SMOTE-Precision": p2})

    if i % 10 == 0:
        print(f"{(100 * (i / runs)):.0f}% Done")

results_df = pd.DataFrame(results)

# Plot everything

plt.hist(results_df["Traditional-Recall"], alpha=0.5, label="Baseline")
plt.hist(results_df["SMOTE-Recall"], alpha=0.5, label="SMOTE")
plt.xlabel("Recall (%)")
plt.legend()
plt.show()