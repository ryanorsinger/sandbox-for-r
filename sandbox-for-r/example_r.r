# Load the data:
# car braking distances in feet paired with speeds in km/h
    

# see ?cars for details
# This appears to bind a global variable without an assignment operation
data(cars)

# fit a linear regression of distance on speed
# Interesting to be able to access this w/o an import
m <- lm( dist ~ speed , data=cars )

# estimated coefficients from the model
# Nice that this is global/default w/o import
coef(m)

# plot residuals against speed
# Nice that this is global/default w/o import
plot( resid(m) ~ speed , data=cars )