

def validate(predictions, y_test_df, name, verbose=True):
    if verbose:
        print(f"\n{name} Model")

    accuracy = 100 * (predictions == y_test_df).mean()
    fraud_guesses = predictions.sum()
    actual_frauds = y_test_df.sum()

    if verbose:
        print(f"""\nHere is the percentage of time our model is correct: {accuracy:.2f}%\n
Now, how many it guessed would be fraud: {fraud_guesses}\n
Now, the actual amount of frauds: {actual_frauds}\n""")


    # Now create the confusion matrix for a better test of accuracy / usefulness
    # See Notes/validation-metrics.md for notes on the confusion matrix

    false_negatives = ((predictions == 0) & (y_test_df == 1)).sum()
    true_negatives = ((predictions == 0) & (y_test_df == 0)).sum()
    false_positives = ((predictions == 1) & (y_test_df == 0)).sum()
    true_positives = ((predictions == 1) & (y_test_df == 1)).sum()
    sensitivity = 100 * (true_positives / (true_positives + false_negatives))
    precision = 100 * (true_positives / (true_positives + false_positives))

    if verbose:
        print(f"""\nFalse Negatives: {false_negatives}\n
True Negatives: {true_negatives}\n
False Positives: {false_positives}\n
True Positives: {true_positives}\n
sensitivity: {sensitivity:.2f}%\n
Precision: {precision:.2f}%\n""")
    
    return sensitivity, precision, (false_negatives, true_negatives, false_positives, true_positives)