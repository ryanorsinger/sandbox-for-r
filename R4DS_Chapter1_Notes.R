library(tidyverse)
library(palmerpenguins)
library(ggthemes)

# glimpse(penguins)
# View(penguins)

# ?glimpse question mark preceding a function pulls up its documentation
# help(glimpse) produces the same effect

# Notice that all we're doing with + geom_point + geom_line() is adding layers, right?
# ggplot(
#   data = penguins,
#   mapping = aes(x = flipper_length_mm, y = body_mass_g), # aesthetics layer for the visual properties
# ) + geom_point() + geom_boxplot() + geom_line()


ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species), # "GLOBAL" aesthetics layer for the visual properties
) +
  geom_point() + 
  geom_smooth(method="lm") # add a linear model for each category



# This next example shows a line of best fit to the entire species variable, but colors broken out by species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g), # aesthetics layer for the visual properties
) +
  geom_point(mapping = aes(color = species, shape = species)) + # sets the color mapping to only the scatterplot geometry layer. LOCAL aesthetics, to this geom_point
  geom_smooth(method="lm")



  

# This next example shows a line of best fit to the entire species variable, but colors broken out by species
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g), # aesthetics layer for the visual properties
) +
  geom_point(mapping = aes(color = species, shape = species)) + # sets the color mapping to only the scatterplot geometry layer. LOCAL aesthetics, to this geom_point
  geom_smooth(method="loess", formula = y ~ x)


