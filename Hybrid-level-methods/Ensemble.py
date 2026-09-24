import pandas as pd
import numpy as np
from IBL_General.Data_Creation import data_creation
from IBL_General.Validation import validate
from IBL_General.Validation import curves_creation
from IBL_General.Logistic_Regression import logistic_regression
from IBL_General.Logistic_Regression import traditional
from IBL_General.Visualize import scatter_plot
from IBL_General.Visualize import curves_plot
import matplotlib.pyplot as plt

df = pd.read_csv("creditcard.csv")


def Ensemble(X_train_df, y_train_df, X_test_df, y_test_df, T, rng, name, verbose):
    major_X = X_train_df[y_train_df == 0]
    major_y = y_train_df[y_train_df == 0]
    minor_X = X_train_df[y_train_df == 1]
    minor_y = y_train_df[y_train_df == 1]

    num_major = len(major_X)
    num_minor = len(minor_X)

    ps = []

    for _ in range(T):
        perm = rng.permutation(num_major)
        cur_major_X = major_X.iloc[perm[:num_minor]]
        cur_major_y = major_y.iloc[perm[:num_minor]]

        new_X_train = pd.concat([cur_major_X, minor_X])
        new_y_train = pd.concat([cur_major_y, minor_y])

        model = logistic_regression(fast=True)
        model.fit(new_X_train, new_y_train)
        p = model.predict_probability(X_test_df)

        ps.append(p)

    avg_p = np.mean(ps, axis=0)
    predictions = np.where(avg_p > 0.5, 1, 0)

    return validate(predictions, y_test_df.values, name, verbose), p

# This takes the data, splits into X and y. 
# Gets the counts of each.
# Takes a random permutation of the counts.
# Takes the first 70% and last 30% and .ilocs the data to split it.
# Takes the mean and std for each variable and creates z-scores.
# Returns it.



runs = 1
results = []
for i in range(runs):
    # SEE Notes/numpy for numpy notes
    rng = np.random.default_rng(i)

    X_train_df, y_train_df, X_test_df, y_test_df = data_creation(df, rng)
    (s1, p1, raw1), prob1 = traditional(X_train_df, y_train_df, X_test_df, y_test_df, name="Traditional", verbose=False, cut_off=0.002, fast=True)
    (s2, p2, raw2), prob2 = Ensemble(X_train_df, y_train_df, X_test_df, y_test_df, 100, rng, name="Ensemble", verbose=False)
    results.append({"Seed": i, "Traditional-Sensitivity": s1, "Traditional-Precision": p1, "Ensemble-Sensitivity": s2, "Ensemble-Precision": p2})

    if i % 10 == 0:
        print(f"{(100 * (i / runs)):.0f}% Done")

results_df = pd.DataFrame(results)

# Plot everything
# scatter_plot(results_df, "Ensemble")

base = curves_creation(prob1, y_test_df.values)
method = curves_creation(prob2, y_test_df.values)
curves_plot(base, method, "Ensemble")