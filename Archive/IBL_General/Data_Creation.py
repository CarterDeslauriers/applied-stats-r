import pandas as pd

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