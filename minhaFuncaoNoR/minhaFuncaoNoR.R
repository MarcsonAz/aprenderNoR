## minhaFuncaoNoR
## function
## ref: 
# 1 - https://www.youtube.com/watch?v=3uK1OzA7CTs
# 


# function needs a name
# the body of the function
# the returning value

example_function <- function(example_argument = 'example_default_value_of_argument'){
  
  ## the function body
  ### doing the calculations
  
  return('example_default_value_of_result')
  
}



# simple example

c_to_f <- function(celsius) 9/5*celsius+32

# chamar

c_to_f(20) # resposta: [1] 68



# new argument
c_to_f_2 <- function(celsius, freez) 9/5*celsius+freez

# chamar

c_to_f_2(20,32) # resposta: [1] 68



# default value to an argument
c_to_f_3 <- function(celsius, freez=32) 9/5*celsius+freez

# chamar

c_to_f_3(20) # resposta: [1] 68



# more lines
c_to_f_4 <- function(celsius, freez=32){
  multi <- 9/5*celsius
  multi + freez
  
  # ou f = multi + freez
  # e colocar f no fim
  # o mais comum é: return(f)
} 

# chamar

c_to_f_4(20) # resposta: [1] 68


#minhaFuncaoNoR










