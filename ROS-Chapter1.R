
library(rosdata)
library(rstanarm)

data(hibbs)

plot(hibbs$growth, hibbs$vote, xlab="Average recent growth in personal income",
     ylab="Incumbent party's vote share")

M1 <- stan_glm(vote ~ growth, data=hibbs)

M1
