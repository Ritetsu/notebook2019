gates <- c(1, 2, 3)
runtimes <- 100000

notchange_win <- 0
change_win <- 0

for ( i in 1:runtimes) {
  cargate <- sample(gates, 1)
  first_choice <- sample(gates, 1)
  
  ifelse (first_choice == cargate,
          notchange_win <- notchange_win + 1,
          change_win <- change_win + 1)
}

p_notchange <- notchange_win/runtimes 
p_change <- change_win/runtimes 

p_notchange
p_change
