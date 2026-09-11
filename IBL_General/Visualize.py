import matplotlib.pyplot as plt

# Create a consistent color scheme
colors = {
    "baseline": "blue",
    "method": "orange"
}

# Plot everything
# SEE Notes/matplotlib for matplotlib notes
def scatter_plot(results_df, model_name):
    
    s1 = results_df["Traditional-Sensitivity"]
    p1 = results_df["Traditional-Precision"]
    s2 = results_df[f"{model_name}-Sensitivity"]
    p2 = results_df[f"{model_name}-Precision"]
    
    fig, ax = plt.subplots()
    ax.scatter(s1, p1, color=colors["baseline"], label="Baseline", alpha=0.5)
    ax.scatter(s2, p2, color=colors["method"], label=f"{model_name}", alpha=0.5)
    ax.set_ylabel("Precision (%)")
    ax.set_xlabel("Sensitivity (%)")
    ax.legend()
    plt.show()