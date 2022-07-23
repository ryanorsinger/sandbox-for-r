## Impressions
- RStudio is nice
    - A play button is nice
    - Integrated terminal and file explorer w/o complicated/unnecessary editor popups and other BS is clean, nice, and refreshing
- Some of the defaults in R are surprisingly intuitive
- Running an r file on the terminal with `R < example_r.r --no-save` auto-generated a PDF of the plot and that's rad! What useful defaults!

## Interesting and Intuitive Tidbits
- R's `print` function returns the value and datatype that prints. That's interesting b/c it matches most people's expectation of print instead of a void function.
- Range syntax like `1:3` is inclusive of the ending number. That's logical for most folks. 


## Weirdness to look into later
Mathematics tells that these two expressions are equivalent:

```
p1 = log(0.01200)
p2 = 200 × log(0.01)
```

But when you use R to compute them, they yield different answers:
```
R code 0.3
 ( log( 0.01^200 ) )
( 200 * log(0.01) )
[1] -Inf
[1] -921.034
```
The second line is the right answer. This problem arises because of rounding error, when the computer rounds very small decimal values to zero. This loses precision and can introduce substantial errors in inference. As a result, we nearly always do statistical calculations using the logarithm of a probability, rather than the probability itself.

> What the heck?

