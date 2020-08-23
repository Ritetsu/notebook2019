data("airquality")

dim(airquality)

sum(is.na(airquality))

which(is.na(airquality), arr.ind = T)


library(summarytools)
dfSummary(airquality)

###
aq <- airquality
dim(aq)
sum(is.na(aq))

aq <- na.omit(aq)
dim(aq)
sum(is.na(aq))


###
start <- proc.time()
a <- rnorm(5000000)
b <- rnorm(5000000)
c <- a + b
end <- proc.time()
end - start

###
start <- proc.time()
a <- rnorm(5000000)
b <- rnorm(5000000)

x <- 1:5000000
for (i in x) {
  c[i] = a[i] + b[i]
}
end <- proc.time()
end - start
