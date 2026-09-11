import pandas as pd
import numpy as np
from IBL_General.Data_Creation import data_creation
from IBL_General.Validation import validate
from IBL_General.Logistic_Regression import logistic_regression
from IBL_General.Logistic_Regression import traditional
from IBL_General.Visualize import scatter_plot
import matplotlib.pyplot as plt
# See Notes/environment for how I set this up

# See Notes/pandas for pandas notes
df = pd.read_csv("creditcard.csv")



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

    model = logistic_regression(fast=True)
    model.fit(X_train_matrix, y_train_matrix)
    predictions = model.predict(X_test_df.values)


    return validate(predictions, y_test_df.values, name, verbose)
    





runs = 30
results = []
for i in range(runs):
    # SEE Notes/numpy for numpy notes
    rng = np.random.default_rng(i)

    X_train_df, y_train_df, X_test_df, y_test_df = data_creation(df, rng)
    s1, p1, _ = traditional(X_train_df, y_train_df, X_test_df, y_test_df, name="Traditional", verbose=False, fast=True)
    s2, p2, _ = SMOTE(X_train_df, y_train_df, X_test_df, y_test_df, rng, name="SMOTE", verbose=False)
    results.append({"Seed": i, "Traditional-Sensitivity": s1, "Traditional-Precision": p1, "SMOTE-Sensitivity": s2, "SMOTE-Precision": p2})

    if i % 10 == 0:
        print(f"{(100 * (i / runs)):.0f}% Done")

results_df = pd.DataFrame(results)

# Plot everything
scatter_plot(results_df, "SMOTE")