## aprenderNoR
## apply
## applyNoR
## ref: 
# 1 - ttps://www.youtube.com/watch?v=5lJX4IgmqRA - How To Use Apply in R
# 2 - https://www.youtube.com/watch?v=34sbvhr_pm8 - How to Use lapply, sapply and mapply in R
# 

# function across columns

apply(X = mtcars,
      FUN = median,
      MARGIN = 2)
 
# new function across rows

descriptive_info <- function(x){
  return(paste(
    x["cyl"],"cillindradas" 
  ))
}


apply(X = mtcars,
      FUN = descriptive_info,
      MARGIN = 1)


# new function across with more than one argument

descriptive_info_2 <- function(x,args){
  leitura <- paste(
    x["cyl"],"cillindradas" 
  )
  for(arg in args){
    leitura <- paste(leitura, "and", x[arg], arg)
  }
  return(leitura)
}


apply(X = mtcars,
      FUN = descriptive_info_2,
      MARGIN = 1,
      args = c("drat","wt","qsec","vs"))



# execute functions on different data structures

data = mtcars

### TO RETURN IN LISTS

lapply(X = data$mpg, FUN = mean)


mpg_category <- function(mpg){
  if(mpg > 30){
    return("High")
  } else if (mpg > 20){
    return("Medium")
  } 
  return("Low")
}

# Use sapply to simplify the result to a vector or matrix instead of a list
# good for data.frames
sapply(X = data$mpg, FUN = mpg_category)

data$mpg_category <- factor(
  sapply(X = data$mpg, FUN = mpg_category),
  levels = c("Low","Medium","High")
)


# new function across with more than one argument

within_range <-  function(mpg, low, high){
  if (mpg >= low & mpg <= high){
    return(TRUE)
  }
  return(FALSE)
}

data$is_in_mpg_range <- sapply(X = data$mpg, FUN = within_range,
                            low = 10, high=25)


### TO USE MULTIPLE VECTORS IN THE FUNCTION

mpg_within_standard_range  <-  function(mpg, cyl){
  if (cyl == 4){
    return(within_range(mpg, low = 23, high = 31))
  } else if (cyl == 6) {
    return(within_range(mpg, low = 18, high = 23))
  }
  return(within_range(mpg, low = 13, high = 18))
}

(RES = mapply(FUN = mpg_within_standard_range, mpg = data$mpg, cyl = data$cyl))

data$mpg_within_standard_range <- RES

print(head(data))

# 
# ```
#                   mpg  cyl disp hp  drat  wt   qsec  vs am gear carb
# Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
# Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
#                      mpg_category is_in_mpg_range  mpg_within_standard_range
# Mazda RX4               Medium            TRUE                      TRUE
# Mazda RX4 Wag           Medium            TRUE                      TRUE
# Datsun 710              Medium            TRUE                     FALSE
# Hornet 4 Drive          Medium            TRUE                      TRUE
# Hornet Sportabout          Low            TRUE                     FALSE
# Valiant                    Low            TRUE                      TRUE
# ```




















