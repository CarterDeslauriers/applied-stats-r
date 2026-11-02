A dataframe is just a table or like a matrix, imagine data in excel

If you have only one dimenison its a series, operates like a vector

The difference is you have an index so you will see 0, 1, 2, ... on the left always

.iloc is by position so iloc[0] is first row
.loc is by the index label so .loc[0] is wthe row where index is 0

You can also pass in a mask so df["Class"] == 1 is where the class variable equals 1
So therefore df[df["Class"] ==1 ] is the rows where those values are 1 in the series

You can use df["Class"].value_counts() to get a series with the indexs as the labels
Like here its 0 and 1 and the values on the right side, so index by .loc

To combine simply use pd.concat([combine1, combine2, ...]), this will combine
As long as all the columns match

Can use .drop on a data frame then .drop(columns=["column1, column2, ...])
I gives back a copy not modify in place so I need to assign it

For comparing two series simply series1 == series2 returns a mask or a boolean true false
Where the values intersect or do not, taking .mean()
Gives you the average they intersect so total intersections / length or total values

When creating a mask with series say positvies == 1 & other == 0 we need parenthesis around both
Otherwise I believe the & condition is read first ie in the right side as == 1 and this
Rather than simply looking for the intersection of the sets

You can go from a dataframe to a matrix with df.values

You can take a list of dictionary where it takes the the values at each key turns them into columns then each index row will be the index, each key will be the variable name and the values will be the number for that row or the value for the key