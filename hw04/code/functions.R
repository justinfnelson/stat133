library('printr')
library('stringr')

non_numeric <- function(vec) {
  #Helper function to halt non-numeric vector inputs in functions.
  for (i in vec) {
    if (is.numeric(i) == FALSE &  !is.na(i)) {
      stop('The input contains a non-numeric value.')
    }
  }
}

remove_missing <- function(vec) {
  #Removes all NA values in a vector.
  vec <- vec[!is.na(vec)]
  return(vec)
}

get_minimum <- function(vec, na.rm = NULL) {
  #Returns the minimum of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(sort(vec)[1])
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(sort(vec)[1])
  }
}

get_maximum <- function(vec, na.rm = NULL) {
  #Returns the maximum of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(sort(vec)[length(vec)])
    
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(sort(vec)[length(vec)])
  }
}

get_range <- function(vec, na.rm = NULL) {
  #Returns the range of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    return(get_maximum(vec) - get_minimum(vec))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(get_maximum(vec) - get_minimum(vec))
  }
}

get_median <- function(vec, na.rm = NULL) {
  #Returns the median of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    sorted <- sort(vec)
    quantile(sorted, .5, names = FALSE)
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    sorted <- sort(vec)
    quantile(sorted, .5, names = FALSE)
  }
}

get_average <- function(vec, na.rm = NULL) {
  #Returns the average of the inputted vector. If na.rm is TRUE,   NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    sum <- 0
    length <- 0
    for (num in vec) {
      if (!is.na(num)){
        sum <- sum + num
        length <- length + 1
      }
    }
    return(sum / length)
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    sum <- 0
    for (num in vec) {
      sum <- sum + num
    }
    return(sum / length(vec))
  }
}

get_percentile10 <- function(vec, na.rm= NULL) {
  #Returns the requested percentage of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(quantile(vec, .1, na.rm = TRUE, names = FALSE))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(quantile(vec, .1, na.rm = TRUE, names = FALSE))    
  }
}

get_percentile90 <- function(vec, na.rm= NULL) {
  #Returns the requested percentage of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(quantile(vec, .9, na.rm = TRUE, names = FALSE))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(quantile(vec, .9, na.rm = TRUE, names = FALSE))    
  }
}


get_stdev <- function(vec, na.rm = NULL) {
  #Returns the standard deviation of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    avg <- get_average(vec)
    devs <- 0
    for (num in vec) {
      devs <- devs + (num - avg)**2 
    }
    return(sqrt(((1 / (length(vec) - 1)) * devs)))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    avg <- get_average(vec)
    devs <- 0
    for (num in vec) {
      devs <- devs + (num - avg)**2 
    }
    return(sqrt(((1 / (length(vec) - 1)) * devs)))
  }
}

get_quartile1 <- function(vec, na.rm = NULL) {
  #Returns the first quartile of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(quantile(vec, .25, na.rm = TRUE, names = FALSE))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(quantile(vec, .25, na.rm = TRUE, names = FALSE))
  }
}

get_quartile3 <- function(vec, na.rm = NULL) {
  #Returns the third quartile of the inputted vector. If na.rm is TRUE, NA values ommitted.
  non_numeric(vec)
  if (is.null(na.rm)) {
    vec <- remove_missing(vec)
    return(quantile(vec, .75, na.rm = TRUE, names = FALSE))
  }
  else if (na.rm == TRUE) {
    vec <- remove_missing(vec)
    return(quantile(vec, .75, na.rm = TRUE, names = FALSE))
  }
}

count_missing <- function(vec) {
  count <- 0
  for (i in vec) {
    if (is.na(i) == TRUE) {
      count <- count + 1
    }
  }
  return(count)
}

summary_stats <- function(vec) {
  #Returns a list of all summary statistics of the inputted vector.
  list(minimum = get_minimum(vec),
       percent10 = get_percentile10(vec),
       quartile1 = get_quartile1(vec),
       median = get_median(vec),
       mean = get_average(vec),
       quartile3 = get_quartile3(vec),
       percent90 = get_percentile90(vec),
       maximum = get_maximum(vec),
       range = get_range(vec),
       stdev = get_stdev(vec),
       missing = count_missing(vec))
}

print_stats <- function(stats){
  stats <- summary_stats(stats)
  cat('minimum  :', format(unlist(stats[1]), nsmall = 4), '\n')
  cat('percent10:', format(unlist(stats[2]), nsmall = 4), '\n')
  cat('quartile1:', format(unlist(stats[3]), nsmall = 4), '\n')
  cat('median   :', format(unlist(stats[4]), nsmall = 4), '\n')
  cat('mean     :', format(unlist(stats[5]), nsmall = 4), '\n')
  cat('quartile3:', format(unlist(stats[6]), nsmall = 4), '\n')
  cat('percent90:', format(unlist(stats[7]), nsmall = 4), '\n')
  cat('maximum  :', format(unlist(stats[8]), nsmall = 4), '\n')
  cat('range    :', format(unlist(stats[9]), nsmall = 4), '\n')
  cat('stdev    :', sprintf('%1.4f', unlist(stats[10])), '\n')
  cat('missing  :', format(unlist(stats[11]), nsmall = 4), '\n')
}


rescale100 <- function(x, xmin, xmax) {
  return(
    100 * ((x -xmin) / (xmax - xmin))
  )
}

drop_lowest <- function(vec) {
  drop <- sort(vec)[-1]
  return(sort(drop, decreasing = TRUE))
}

score_homework <- function(vec, drop = TRUE) {
  if (drop == FALSE) {
    return(get_average(vec))
  }
  else if (drop == TRUE) {
    drop <- drop_lowest(vec)
    return (get_average(drop))
  }
}

score_quiz <- function(vec, drop = TRUE) {
  if (drop == FALSE) {
    return(get_average(vec))
  }
  else if (drop == TRUE) {
    drop <- drop_lowest(vec)
    return (get_average(drop))
  }
}

score_lab <- function(attendance) {
  if (attendance >= 11) {
    return(100)
  }
  else if (attendance == 10) {
    return(80)
  }
  else if (attendance == 9) {
    return(60)
  }
  else if (attendance == 8) {
    return(40)
  }
  else if (attendance == 7) {
    return(20)
  }
  else if (attendance <= 6) {
    return(0)
  }
}

give_grade <- function(score) {
  if (score >= 0 & score < 50) {
    return('F')
  }
  else if (score >= 50 & score < 60) {
    return('D')
  }
  else if (score >= 60 & score < 70) {
        return('C-')
  }
  else if (score >= 70 & score < 77.5) {
        return('C')
  }
  else if (score >= 77.5 & score < 79.5) {
        return('C+')
   }
   else if (score >= 79.5 & score < 82) {
        return('B-')
    }
  else if (score >= 82 & score < 86) {
         return('B')
    }
  else if (score >= 86 & score < 88) {
        return('B+')
  }
  else if (score >= 88 & score < 90) {
          return('A-')
    }
  else if (score >= 90 & score < 95) {
            return('A')
  }
  else if (score >= 95 & score <= 100) {
              return('A+')
  }
}
    


