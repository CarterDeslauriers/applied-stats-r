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



def curves_plot(baseline, method, model_name):
    # baseline and method are (fprs, sens, precs)

    fig, (ax1, ax2) = plt.subplots(1, 2)

    ax1.plot(baseline[0], baseline[1], color=colors["baseline"], label="Baseline")
    ax1.plot(method[0], method[1], color=colors["method"], label=model_name)

    ax2.plot(baseline[1], baseline[2], color=colors["baseline"], label="Baseline")
    ax2.plot(method[1], method[2], color=colors["method"], label=model_name)

    ax1.legend()
    ax2.legend()
    plt.show()