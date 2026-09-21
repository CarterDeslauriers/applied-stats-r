import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import GridSearchCV
import matplotlib.pyplot as plt
from sklearn import tree

df = pd.read_csv("Assignments/Data/breast_cancer.csv")

# First look at the variable names
# print(df.columns.tolist())

# print(df["diagnosis"].value_counts())

missing = df.isna().sum()
print(f"The missing data:\n{missing}\n")

df_y = df["diagnosis"]
df_X = df.drop(columns=["diagnosis", "id", "Unnamed: 32"])

perm = np.random.permutation(len(df_X))

train_cut = int(0.8 * (len(df_X)))

df_y_train = df_y.iloc[perm[:train_cut]]
df_X_train = df_X.iloc[perm[:train_cut]]

df_y_test = df_y.iloc[perm[train_cut:]]
df_X_test = df_X.iloc[perm[train_cut:]]


tree1 = DecisionTreeClassifier(criterion="entropy", max_leaf_nodes=4)
tree1.fit(df_X_train, df_y_train)
accuracy = tree1.score(df_X_test, df_y_test)

print("Testing accuracy:", accuracy)
print("Testing error:", 1 - accuracy, "\n")

param_grid = {"max_leaf_nodes": range(3, 13),
              "criterion": ["gini", "entropy"]}

search = GridSearchCV(DecisionTreeClassifier(), param_grid, cv=5)
search.fit(df_X_train, df_y_train)

print("Best hyperparameters:", search.best_params_, "\n")


best_tree = DecisionTreeClassifier(**search.best_params_)
best_tree.fit(df_X_train, df_y_train)
print("Testing accuracy:", best_tree.score(df_X_test, df_y_test), "\n")


plt.figure(figsize=(16, 8))
tree.plot_tree(best_tree, feature_names=df_X_train.columns,
               class_names=best_tree.classes_, filled=True, rounded=True)
plt.show()