import numpy as np
from sklearn.linear_model import LogisticRegression
from IBL_General.Validation import validate
# From my current understanding sklearn is logisitic regression the way I derivied it
# But they use different methods to get there faster

class logistic_regression:
    # Just input fast=True if I want to use the other verison
    def __init__(self, lr=0.2, max_iters=1000, cut_off=0.5, fast=False):
        self.lr = lr
        self.max_iters = max_iters
        self.fast = fast
        self.cut_off = cut_off
        self.w = None
        self.b = None

    def fit(self, X, y):
    
        # Just use the sklearn verison
        if self.fast:
            model = LogisticRegression()
            model.fit(X, y)
            self.w = model.coef_[0]
            self.b = model.intercept_[0]
            return
        
        # Make sure its in matrix form
        X = np.asarray(X)

        # Get the number of variables and number of rows
        m = X.shape[1]
        n = X.shape[0]

        # Intialize the wieghts and b
        w = np.zeros(m)
        b = 0.0

        last_loss = np.inf
        for i in range(self.max_iters):

            # Find Z this is the summation step, z is a vector and b gets broadasted to each
            # Clip so it doesnt overflow
            z = X @ w + b
            z = np.clip(z, -500, 500)

            # Calculate p for each
            p = 1 / (1 + np.exp(-z))
            p = np.clip(p, 1e-15, 1 - 1e-15)

            # Calcuate L for each, the mean is the summation times the 1/n
            L = -(y * np.log(p) + (1 - y) * np.log(1 - p))
            avg_L = L.mean()

            # If the loss steps are tiny then break
            if last_loss - avg_L < 1e-6:
                self.w = w
                self.b = b
                return
            else:
                last_loss = avg_L
            
            # print every 50 steps
            if i % 50 == 0:
                print(f"Current average loss: {avg_L:.2f}")

            # Now compute the gradient
            gradient = (X.T @ (p - y)) / n

            # Now take our step
            w = w - (self.lr * gradient)
            b = b - (self.lr * (p - y).mean())


        self.w = w
        self.b = b
    

    def predict(self, X):

        X = np.asarray(X)

        z = X @ self.w + self.b
        z = np.clip(z, -500, 500)

        p = 1 / (1 + np.exp(-z))

        prediction = (p >= self.cut_off)
        
        return prediction.astype(int)
    







def traditional(X_train, y_train, X_test, y_test, name, verbose, fast=False):

    X_train = np.asarray(X_train)
    X_test = np.asarray(X_test)
    y_train = np.asarray(y_train)
    y_test = np.asarray(y_test)

    model = logistic_regression(fast=fast)
    model.fit(X_train, y_train)
    predictions = model.predict(X_test)

    return validate(predictions, y_test, name, verbose)