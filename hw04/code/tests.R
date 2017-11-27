context('Ensure that remove_missing function gets rid of NA values.')

test_that('All values are non-NA', {
  vec <- c(1,2,3,NA)
  
  expect_that(remove_missing(vec), is_a('numeric'))
  expect_equal(remove_missing(vec), c(1,2,3))
  expect_that(length(remove_missing(vec)) < length(vec), is_true())
  expect_equal((length(vec) - length(remove_missing(vec))), count_missing(vec))
})

context('Ensure that get_minimum function returns the minimum value of a vector and operates properly.')

test_that('Value returned is the minimum of inputted vector ', {
  vec <- c(1,2,3,NA)
  
  expect_that(get_minimum(vec), is_a('numeric'))
  expect_equal(get_minimum(vec), 1)
  expect_equal(length(get_minimum(vec)), 1)
  expect_error(get_minimum('c'))
})

context('Ensure that get_maximum function returns the minimum value of a vector and operates properly.')

test_that('Value returned is the maximum of inputted vector ', {
  vec <- c(1,2,3,NA)
  
  expect_that(get_maximum(vec), is_a('numeric'))
  expect_equal(get_maximum(vec), 3)
  expect_equal(length(get_maximum(vec)), 1)
  expect_error(get_minimum('c'))
})

context('Ensure that get_range function returns the numeric range of a vector and operates properly.')

test_that('Value returned is the range of inputted vector ', {
  vec <- c(1,2,3,NA)
  
  expect_that(get_range(vec), is_a('numeric'))
  expect_equal(get_range(vec), 2)
  expect_equal(length(get_range(vec)), 1)
  expect_error(get_range('c'))
})

context('Ensure that get_percentile10 function returns the tenth percentile of a vector and operates properly.')

test_that('Value returned is the 10th percentile of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_percentile10(vec), is_a('numeric'))
  expect_equal(get_percentile10(vec), 1.9)
  expect_equal(length(get_percentile10(vec)), 1)
  expect_error(get_percentile10('c'))
})

context('Ensure that get_percentile90 function returns the tenth percentile of a vector and operates properly.')

test_that('Value returned is the 90th percentile of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_percentile90(vec), is_a('numeric'))
  expect_equal(get_percentile90(vec), 9.1)
  expect_equal(length(get_percentile90(vec)), 1)
  expect_error(get_percentile90('c'))
})


context('Ensure that get_median function returns the median value of a numeric vector and operates properly.')

test_that('Value returned is the median of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_median(vec), is_a('numeric'))
  expect_equal(get_median(vec), 5.5)
  expect_equal(length(get_median(vec)), 1)
  expect_error(get_median('c'))
})

context('Ensure that get_average function returns the mean value of a numeric vector and operates properly.')

test_that('Value returned is the mean of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_average(vec), is_a('numeric'))
  expect_equal(get_average(vec), 5.5)
  expect_equal(length(get_average(vec)), 1)
  expect_error(get_median('c'))
})

context('Ensure that get_stdev function returns the standard deviation value of a numeric vector and operates properly.')

test_that('Value returned is the SD of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_stdev(vec), is_a('numeric'))
  expect_equal(get_stdev(vec), sd(remove_missing(a)))
  expect_equal(length(get_stdev(vec)), 1)
  expect_error(get_stdev('c'))
})

context('Ensure that get_quartile1 function returns the first quartile value of a numeric vector and operates properly.')

test_that('Value returned is the first quartile of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_quartile1(vec), is_a('numeric'))
  expect_equal(get_quartile1(vec), 3.25)
  expect_equal(length(get_quartile1(vec)), 1)
  expect_error(get_quartile1('c'))
})

context('Ensure that get_quartile3 function returns the third quartile value of a numeric vector and operates properly.')

test_that('Value returned is the third quartile of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(get_quartile3(vec), is_a('numeric'))
  expect_equal(get_quartile3(vec), 7.75)
  expect_equal(length(get_quartile3(vec)), 1)
  expect_error(get_quartile3('c'))
})

context('Ensure that count_missing function returns the number of NA values in a numeric vector and operates properly.')

test_that('Value returned is the number of NA values of inputted vector ', {
  
  expect_that(count_missing(c(1, 4, 7, NA, 10)), is_a('numeric'))
  expect_equal(count_missing(c(1, 4, 7, NA, 10)), 1)
  expect_equal(length(count_missing(c(1, 4, 7, NA, 10))), 1)
  expect_equal(count_missing(c(1, 10, NA, NA, NA, 10, NA)), 4)
})


context('Ensure that summary_stats function operates properly.')

test_that('Values returned is the number of NA values of inputted vector ', {
  vec <- c(1, 4, 7, NA, 10)
  
  expect_that(summary_stats(vec), is_a('list'))
  expect_equal(count_missing(c(1, 4, 7, NA, 10)), 1)
  expect_equal(length(count_missing(vec)), 1)
  expect_equal(count_missing(c(1, 10, NA, NA, NA, 10, NA)), 4)
})


