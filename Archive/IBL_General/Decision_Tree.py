import numpy as np
from sklearn.tree import DecisionTreeClassifier
from IBL_General.Validation import validate


# Gini index
def gini(y):
    return 1 - (y.mean())**2 - (1 - y.mean())**2

# Score the split so the weighted sum of the children impurity
def split_score(X, y, feature, threshold):

    left = y[X[:, feature] <= threshold]
    right = y[X[:, feature] > threshold]

    left_score = gini(left)
    right_score = gini(right)

    t_len = len(X)

    weighted_score = (len(left)/t_len) * left_score + (len(right)/t_len) * right_score
    return weighted_score

# loop over all the features and then over a bunch of cut offs and find the next best one
def best_split(X, y):
    # Gini index <= 0.5 so curr_score will always beat best_score on first try
    best_score = 1
    f, t = None, None

    num_cols = X.shape[1]
    for feature in range(num_cols):

        column = X[:, feature]
        thresholds = np.percentile(column, np.linspace(1, 99, 50))

        for threshold in thresholds:
            curr_score = split_score(X, y, feature, threshold)
            if curr_score < best_score:
                f, t = feature, threshold
                best_score = curr_score

    return f, t


# Actually build recursively the tree, cut based on depth, min samples, or perfect impurity
def build(X, y, depth, max_depth, min_samples_leaf):
    
    if (depth >= max_depth) or (len(X) <= min_samples_leaf) or (gini(y) == 0):
        return {"leaf": True, "p": y.mean()}


    f, t = best_split(X, y)
    if f is None:
        return {"leaf": True, "p": y.mean()}

    
    mask = X[:, f] <= t

    left = build(X[mask], y[mask], depth + 1, max_depth, min_samples_leaf)
    right = build(X[~mask], y[~mask], depth + 1, max_depth, min_samples_leaf)

    return {"leaf": False, "feature": f, "threshold": t, "left": left, "right": right}


# Actually now walk through the tree to get to a leaf and return the p value
def predict_one(node, x):
    while not node["leaf"]:
        if x[node["feature"]] <= node["threshold"]:
            node = node["left"]
        else:
            node = node["right"]
    return node["p"]



class decision_tree:
    def __init__(self, max_depth=5, min_samples_leaf=20, cut_off=0.5, fast=False):
        self.max_depth = max_depth
        self.min_samples_leaf = min_samples_leaf
        self.fast = fast
        self.cut_off = cut_off

        # My tree
        self.root = None      

        # For sklearn
        self.model = None     

    def fit(self, X, y):

        # Just use the sklearn verison
        if self.fast:
            self.model = DecisionTreeClassifier(max_depth=self.max_depth, min_samples_leaf=self.min_samples_leaf)
            self.model.fit(X, y)
            return
        

        X = np.asarray(X)
        y = np.asarray(y)
        self.root = build(X, y, 0, self.max_depth, self.min_samples_leaf)

    def predict_probability(self, X):
        if self.fast:
            return self.model.predict_proba(X)[:, 1]
        
        X = np.asarray(X)
        return np.array([predict_one(self.root, row) for row in X])

    def predict(self, X):
        return (self.predict_probability(X) >= self.cut_off).astype(int)
    








def traditional(X_train, y_train, X_test, y_test, name, verbose, cut_off=0.5, fast=False):

    X_train = np.asarray(X_train)
    X_test = np.asarray(X_test)
    y_train = np.asarray(y_train)
    y_test = np.asarray(y_test)

    model = decision_tree(cut_off=cut_off, fast=fast)
    model.fit(X_train, y_train)
    p = model.predict_probability(X_test)
    predictions = (p >= cut_off).astype(int)

    return validate(predictions, y_test, name, verbose), p