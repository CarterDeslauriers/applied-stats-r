# Re-runs the notebook's cleaning + best XGBoost settings with different random seeds
import json, sys
import numpy as np, pandas as pd
nb = json.load(open("Heart_Disease_Kaggle.ipynb", encoding="utf8"))
src = ["".join(c["source"]) for c in nb["cells"] if c["cell_type"] == "code"]
ns = {}
for s in src:
    exec(s, ns)
    if "imputer = ColumnTransformer" in s:
        break
from sklearn.pipeline import Pipeline
from xgboost import XGBClassifier
X_all, y_all, X_test, test, imputer = (ns[k] for k in ["X_all", "y_all", "X_test", "test", "imputer"])
probs = {}
for seed in [1, 7, 13, 21, 99]:
    m = Pipeline([("impute", imputer), ("model", XGBClassifier(
        learning_rate=0.05, max_depth=3, min_child_weight=1, n_estimators=300,
        subsample=0.8, colsample_bytree=0.8, random_state=seed))]).fit(X_all, y_all)
    probs[seed] = m.predict_proba(X_test)[:, 1]
out = lambda p, f: pd.DataFrame({"patient_id": test.patient_id, "heart_disease": (p >= 0.5).astype(int)}).to_csv(f, index=False)
out(probs[7], "seed_runs/xgb_seed7.csv")
out(np.mean(list(probs.values()), axis=0), "seed_runs/xgb_5seed_avg.csv")
print("written")
