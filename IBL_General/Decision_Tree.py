import numpy as np
from sklearn.tree import DecisionTreeClassifier
from IBL_General.Validation import validate


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
        

        # self.root = build(X, y, depth=0)

    def predict_probability(self, X):
        if self.fast:
            return self.model.predict_proba(X)[:, 1]
        
        # walk each row down self.root, return leaf probabilities

    def predict(self, X):
        return (self.predict_probability(X) >= self.cut_off).astype(int)