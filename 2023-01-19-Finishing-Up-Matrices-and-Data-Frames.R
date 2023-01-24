###### Finishing up Matrices and Data Frames
###### January 19 2023
###### AGG

m<-matrix(data=1:12, nrow=3)

## subsetting based on elements
m[,3:4] # all rows 3-4 columns

## subset with logical (conditional) statements
## select all columns for which totals are > 15
colSums(m) > 15 # logical (TF) output where sum columns > 15
m[, colSums(m)>15] # gives the columns where sum > 15

## row sums now
## select rows that sum up to 22
m[rowSums(m)==22,] # have to do double == because it makes it a logical operator
m[rowSums(m)!=22,] # all rows that don't equal 22. ! means everything that does not equal 22

## == logical operator
## != everything that doesn't equal

#### LOGICAL OPERATORS: == != > <
## subsetting to a vector changes the data type
z<-m[1,]
print(z)
str(z)

z2<- m[1, , drop=FALSE]
  # drop=FALSE sets to a matrix and keeps as a matrix 

## e.g. simulate new matrix
m2<-matrix(data=runif(9),nrow=3)
m2[6] # takes the 6th element (counts down)
m2[3,2] # same thing as above

## use assignment operator to substitute values
m2[m2>0.6]<-NA # puts an NA where the value is > 0.6
m2

data<-iris
head(data)

data[3,2] # numbered indices still work

dataSub<-data[c("Species", "Petal.Length")]
str(dataSub)

#### SORT A DATA FRAME BY VALUES
orderedIris<-iris[order(iris$Petal.Length),] # $ finds the named element which in data frames are almost always columns - it will select the whole column
# take these ordered indices and order them
# ???

## data frame$column # all data from column is extracted


###### FUNCTIONS IN R!!

# everything in R is a function
sum(3,2) # sum
3+2 # + sign is a function
sd

## User-defined functions
functionName<-function(argumentX=defaultX,argY=defaultY){
  # curly bracket starts the body of the function
  # lines of R code and notes
  # create local variables (only `visible` to R within the function)- if you say x<-1 in here, you can't pull x outside of the function
  # return (z) - makes the variable part of the global envt
  # whatever you specify up there^, you use down here in the function e.g
  # argX<-c("IDK")
}
## e.g.
myFunc<-function(a=3,b=4){
  z<-a+b
  return(z)
}
myFunc() # runs defaults
myFunc(a=100,b=3.4)

myFuncBad<-function(a=3, b=3)# SHOULD ALWAYS BE DEFINED WITHIN FUNCTION){
z<-a+b
  return(z)
}
z
myFuncBad() # runs defaults but returns an error bc b not specified

## MULTIPLE RETURN STATEMENTS
############################################################
# a lot of # are best way to annotate, can hide this line
# FUNCTION: HardyWeinberg
# input: an allele frequency p(0,1)
# output: p and the frequencies of 3 genotypes AA AB BB
#-----------------------------------------------------------
HardyWeinberg<-function(p=runif(1)){
  if (p > 1.0 | p < 0.0) {
    return("Function failure: p must be >= 0.0 and <= 1.0")
  }
q<-1-p
fAA<- p^2 # frequency of AA
fAB<- 2*p*q
fBB<- q^2
vecOut<- signif(c(p=p,AA=fAA, AB=fAB, BB=fBB), digits=3)
return(vecOut)
} #there are 2{} because we're using the if statement. they need the condition first then return "Function failure..."
HardyWeinberg()
freqs<-HardyWeinberg()
freqs
HardyWeinberg(p=0.25)
#### confused???

#### CREATE A COMPLEX DEFAULT VALUE
###########################################################
# FUNCTION: fitLinear2
## fits simple linear regression line
## input: numeric list of predictor (x) and response (y)
## outputs: slope and p-value

fitLinear2<-function(p=NULL){
    if(is.null(p)) {
    p<-list(x=runif(20), y=runif(20)) # says we will make a variable p if we don't have one
  }
    myMod<-lm(p$x~p$y)
    myOut<-c(slope=summary(myMod)$coefficients[2,1],
           pValue=summary(myMod)$coefficients[2,4]) #that's the pvalue instead of the slope
           plot(x=p$x, y=p$y) # quick plot to check output
           return(myOut)
}
## from website
fitLinear2 <- function(p=NULL){ #setting default to nothing, if p is null it will run and simulate if data were there - then when we put data in there it will work
  if(is.null(p)) {
    p <- list(x=runif(20),y=runif(20))
  }
  myMod <- lm(p$x~p$y) # fit the model
  myOut <- c(slope=summary(myMod)$coefficients[2,1],
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=p$x,y=p$y) # quick and dirty plot to check output
  return(myOut)
}

# the if statement allows you to input something as a list function or will create something for you to put
############################################################
fitLinear2() #simulates p for us when p=NULL
myPars<-list(x=1:10, y=runif(10))
fitlinear2(p=myPars)