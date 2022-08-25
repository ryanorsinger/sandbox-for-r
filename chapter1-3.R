# This pulls in and makes a bunch of stuff globally available
library(tidyverse)

# MPG dataset
mpg

# Calculate the average displacement of the displacement column
mean(mpg[["displ"]])

## ggplot on its own creates a coordinate system for adding layers.
## "Layered Grammer of Graphics"
ggplot(data = mpg)


## Creating a ggplot
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# ggplot pattern
# ggplot(data = <DATA>) + 
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

#?object pulls up documentation
?mpg
head(mpg)

# Scatterplot of cylinders vs. highway gas mileage
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y=hwy))

# Scatterplots for categorical vs. categorical ain't helpful
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y=drv))


# Using "levels" to add another dimension, like "hue" in seaborn
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y=hwy, color = class))

# using the size aesthetic
# Using size for a discrete variable is not advised. 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y=hwy, size = class))


# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
# What happened to the SUVs? ggplot2 will only use six shapes at a time. By default, additional groups will go unplotted when you use the shape aesthetic.
# The syntax highlights a useful insight about x and y: the x and y locations of a point are themselves aesthetics, visual properties that you can map to variables to display information about the data.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

# aes function is the aesthetic function
# We can manually specify colors  (outside of the aes function), this binds it to geom_point as an argument
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")



# What happens when we map the same variable to both size and class aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class, size=class, shape=class))


# Plotting multiple plots from categories with facets are powerful. 
# Facets are subplots for-each category population
# "formula" in R here is not an "equation", it's a name of a data structure in R.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
  
# Facet on the drivetrain
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ drv, nrow = 2)


# Facet on drv ~ cyl
# We can facet on multiple categorical values, holy moly!
# Seaborn can do this, too with sns.relplot(data=tips, x="total_bill", y="tip", hue="day", col="time", row="sex")
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(drv ~ cyl)


# I'm not yet sure how the formula of . ~ cyl is different than ~ cyl.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(. ~ cyl)

# Make columns for-each drivetrain
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ drv)

# Make rows for-each drivetrain
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

# Make columns foreach class of vehicle and wrap around to make two rows
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

## Geometric objects
# A geom is the geometircal object that a plot uses to represent data.
# bar plots use bar goems
# line charts use line goems
# boxplots use boxplot geoms
# etc...


# point plot (scatterplot)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# Smooth line
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

# Notice how this produces a different kind of line for each drivetrain
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


?geom_smooth

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)
