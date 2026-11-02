To create a random seed rng.random_default_rng(seed)

Simply makes things repeatable across runs

To sort an entire list or vector you can you np.argsort(list), which returns a list of the indexs
So insted of having the values you have the index positons and the order based on the values

For choosing a single values from a list you can use rng.choice(list)

Instead of looping can create numpy matrixes all at once and then do operations on them

np.vstack to stack matrix on top of each other

np.concatenate if you are using vectors or arrays instead of matrices