# Heart Disease Project: Decisions & Results Log

Plain-English record of every choice, so it can be turned into slides.
Notebook: `heart_disease.ipynb`

## The data
- 34,300 training patients, 14,700 test patients
- Target `heart_disease` is 50/50, so guessing gets about 50%
- `patient_id` is not used as a feature (it's just a label)

## 6.1 Missing data
| Column | Missing | % |
|---|---|---|
| family_history | 2,028 | 5.9% |
| sleep_hours | 1,747 | 5.1% |
| waist_cm | 1,635 | 4.8% |
| resting_hr | 1,313 | 3.8% |
| weight_lb | 1,044 | 3.0% |
| cholesterol_level | 688 | 2.0% |

- Dropping rows with any missing value would lose 7,619 rows (22%), so we didn't do it.
- **What we did:** fill each blank with the column median, and add a 0/1 "was missing" column (option B).
- **Why:** keeps all the data, works with every model, and lets the model learn if missing-ness itself matters.

### Recording errors
Realistic ranges: systolic 80-220, diastolic 40-140, height 48-84 in, weight at least 80 lb.
1. Negative values: dropped the minus sign (-135 becomes 135)
2. Extra digits: dropped trailing digits until in range (14010 becomes 140, 995 becomes 99)
3. Diastolic > systolic (603 rows): swapped them
4. Anything still unrealistic: set to missing, then filled like the other blanks

Result: most bad readings were recovered. Values set to missing: systolic 108, diastolic 136, height 45, weight 35.

### Encoding
- cholesterol / glucose: normal=0, above=1, well above=2 (they have an order)
- sex: M=1, F=0
- clinic_site: one 0/1 column per site (no order)

## 6.3 Partitioning
- 5-fold stratified cross-validation on train.csv only (shuffled, random_state=42)
- Stratified means each fold keeps the 50/50 yes/no balance
- Metric: accuracy (the Kaggle metric)
- No leakage: filling blanks happens inside a pipeline, so in every fold the medians come only from the 4 training folds

## 6.2 / 6.4 Models and tuning (grid search, 5-fold CV)
| Model | Why we tried it | Combos | Best CV accuracy |
|---|---|---|---|
| Decision tree | Simple, explainable baseline | 20 | 0.7148 |
| Random forest | Averaging many trees reduces variance | 18 | 0.7255 |
| Extra trees | Random splits for more variety | 18 | 0.7186 |
| LightGBM | Boosting fixes mistakes step by step; strong on tables | 16 | 0.7257 |

Decision tree: max_depth [3,5,7,10,None] best 7; min_samples_leaf [1,20,50,100] best 100
Random forest: n_estimators [200,400] best 400; max_depth [8,12,None] best 12; min_samples_leaf [1,10,30] best 30
Extra trees: n_estimators [200,400] best 400; max_depth [8,12,None] best None; min_samples_leaf [1,10,30] best 10
LightGBM: n_estimators [200,500] best 200; learning_rate [0.03,0.1] best 0.03; num_leaves [15,31] best 15; min_child_samples [20,100] best 100

Lesson: an unlimited-depth tree scored only 0.617 because it overfit (memorized training patients).

## Change log
1. Created notebook: load, explore, missing-value table
2. Added cleaning rules for blood pressure, height, weight
3. Added encoding of categories
4. Added 5-fold CV + pipeline (median fill + missing indicators)
5. Baseline decision tree: no limit 0.617, depth 5 0.712
6. Tuned 4 models with grid search (results above)
