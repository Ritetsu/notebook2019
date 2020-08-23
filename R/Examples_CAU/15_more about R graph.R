library(ggplot2)

set.seed(133)
df <- data.frame(xval=rnorm(50), yval=rnorm(50))

# Make color depend on yval
ggplot(df, aes(x=xval, y=yval, colour=yval)) + geom_point()

# Use a different gradient
ggplot(df, aes(x=xval, y=yval, colour=yval)) + geom_point() + 
  scale_colour_gradientn(colours=rainbow(4))


### 

data("airquality")
aq <- airquality
aq %>% mutate(date = as.Date(paste("1973", Month, Day, sep = "-"))) -> aq
head(aq)

ggplot(aq, aes(date, Temp, fill = Ozone, size = Solar.R)) +
  geom_point(shape = 21) +
  scale_fill_gradientn(colours=rainbow(4))

###
library(ggplot2) 
bp <- ggplot(data=PlantGrowth, aes(x=group, y=weight, fill=group)) + 
  geom_boxplot() 
bp

# Remove title for fill legend
bp + guides(fill=guide_legend(title=NULL))

# Remove title for all legends
bp + theme(legend.title=element_blank())

### geom_path
set.seed(1)

dat <- data.frame(x = 1:5, y = 1:5 + rnorm(5))
dat

dat$x[5] <- dat$x[5] - 1.5
dat_new <- dat
dat_new$y <- dat_new$y - 0.1
dat
dat_new

ggplot(dat, aes(x, y)) +
  geom_line() +
  geom_path(dat_new, mapping = aes(x, y), color = "red")


nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +
  geom_path()

dat <- data.frame(range = c(-3, 3))
ggplot(dat, aes(range)) + stat_function(fun = dnorm)

dat <- data.frame(range = c(0, 6.28))
ggplot(dat, aes(range)) + stat_function(fun = sin)

dat <- data.frame(range = c(0, 2))
ggplot(dat, aes(range)) + stat_function(fun = sinpi)


### 
library(tidyverse)
library(corrplot)

se <- read.csv("soilproperty.csv")
head(se)
se <- se %>% select(N:Mo)

cor_se <- cor(se)
round(cor_se, digits = 2)

corrplot(cor_se, type = "lower")

corrplot(cor_se, tl.col="purple", tl.srt=75, type = "upper")

corrplot(cor_se, method="ellipse", tl.col="purple", tl.srt=75, type = "lower")


ppi = 600
cor_se <- cor(se)
png("mycorrplot.png", width = 4*ppi, height = 4*ppi, res = ppi)
corrplot(cor_se, method="ellipse", tl.col="purple", tl.srt=75, type = "upper")
dev.off()
