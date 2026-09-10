import pandas as pd
import matplotlib.pyplot as plt

# Take the data put it into a dictionary
data = {
    "Observation": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    "True Target": [1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
    "Predicted Probability": [.95, .92, .87, .74, .73, .71, .68, .65, .64, .61, .56, .51, .48, .41, .32, .28, .25, .18, .17, .12]
}

# Turn that into a dataframe
df = pd.DataFrame(data)

# Write a function that gives all the validation metrics
def confusion_matrix(df, cut_off):
    tp = ((df["Predicted Probability"] >= cut_off) & (df["True Target"] == 1)).sum()
    fp = ((df["Predicted Probability"] >= cut_off) & (df["True Target"] == 0)).sum()
    tn = ((df["Predicted Probability"] < cut_off) & (df["True Target"] == 0)).sum()
    fn = ((df["Predicted Probability"] < cut_off) & (df["True Target"] == 1)).sum()
    total = len(df)

    miss_class = (fn + fp) / total
    acc = (tn + tp) / total
    sens = (tp) / (tp + fn)
    spec = (tn) / (tn + fp)
    prec = (tp) / (tp + fp)
    f_score = 2 * ((prec * sens) / (prec + sens))

    return tp, fp, tn, fn, miss_class, acc, sens, spec, prec, f_score

# Get the metrics for question 1
metrics = confusion_matrix(df, 0.6)

print(f"""\nCut off 0.60\n
Sensitivity: {metrics[6]:.2f}\n
Specificity: {metrics[7]:.2f}\n
Precision: {metrics[8]:.2f}\n
F1-Score: {metrics[9]:.2f}\n
      """)

# Now run a loop for question 2
# Include the values you need for question 3
cut_offs = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]

f_scores = []
senses = []
one_min_specs = []
for cut_off in cut_offs:
    metrics = confusion_matrix(df, cut_off)
    f_scores.append([metrics[9], cut_off])

    senses.append(metrics[6])
    one_min_specs.append(1 - metrics[7])

# Print out the highest score and the cut off
print(f"""\nHighest F1-Score: {max(f_scores)[0]:.2f}\n
Cut Off: {max(f_scores)[1]:.2f}\n
        """)

# Draw question 3
plt.scatter(one_min_specs, senses, marker="o")
plt.plot([0, 1], [0, 1], linestyle="--", color="grey")
plt.ylabel("Sensitivity")
plt.xlabel("1 - Specificity")
plt.show()



# How many are positive?
pos_num_percen = (df["True Target"] == 1).sum() / len(df)

# Get the model guess at each step, this works fine how I have it because -
# - the predicted probability is already sorted in descending order ie -
# - the order we would guess in
model_guess = []
correct = 0
percentages = []
for i in range(len(df)):
    if df["True Target"].iloc[i] == 1:
        correct += 1

    model_guess.append((correct / (i + 1)))
    percentages.append(((i + 1) / len(df)))

cum_lift = pd.Series(model_guess) / pos_num_percen
cum_lift.index += 1

# Print out the lift
print(f"""\nCumulative lift over guess:\n{cum_lift}\n""")

cum_response = pd.Series(model_guess)
cum_response.index = percentages

# Print out the response
print(f"""\nCumulative reponse over percentage:\n{cum_response}\n""")