###### Programming in R
###### January 12 2023
###### AGG

## Let's start with the basic

## Assignment operator: used to assign a new value to a variable

x <- 5
## then you hit command enter

print(x)
## printing obtains that output for us. it shows what is contained in that variable
## or you can highlight x then command enter

y = 4
# legal but not used except in function arguments

print (y)
y = y + 1.1

y <- y + 1.1
## overriding our values and replacing whatever the value is with our new value

## common error is forgetting a parentheses - you'll see a plus sign in the console. you can add an end parentheses in the console or put cursor in the console and press escape
## to run all at once, highlight and hit command enter or press source to see what your variables are

## variables: used to store information (a container)

z <- 3 # single letter variables
plantHeight <- 10 #camel case format (first word lower, second word upper case)
plant_height <- 3.3 #snake case format, a preferred method
plant.height <- 4.2
. <-5.5 #reserve for temporary variable

## functions: blocks of code that performs a task; use short command over again isntead of writing out that block code multiple times

## you can create your own function!

square <- function(x = NULL){
  x<-x^2
  print(x)
}
z<-103
square(x=z) #the argument here is x (before the =); anything after the = is the function

## or there are built in functions
sum(109, 3, 10) ## look at package info using ?sum (type in console) or going to Help panel


## Atomic Vector types
## character strings (usually within quotes)
## integers (whole #)
## double (real #, decimal)
## integers, doubles are “numeric”
## logical (TRUE or FALSE_)
## factor (categorizes, groups variable)
## vector of lists!

# c function (combine)
z<- c(3.2,5,5,6)
print(z) #prints
class(z) #returns class
typeof(z) #they'll never be different types of data in the same vector, returns type of variable
is.numeric(z) #returns T/F query

## c always "flattens" to a vector
## c() useful for creating vectors
z<-c(c(3,4), c(5,6))
# this strings together these numbers, it's still 1-D

#we have been using numeric but we can also do character vectors
z<-c("perch", "bass", "trout")
z<-c("This is only 'one' character string", "a second", "a third")
print (z)
typeof(z)
is.character(z) #is. functions tests whether it is certain data type

## logical (Boolean), no quotes, all caps: TRUE and/or FALSE
z<-c(TRUE, FALSE) #as. functions coerces data type
z<- as.character(z)
is.logical(z)

## Type
## is.numeric / as.character
## type of()


# Length
length(z)
dim(z) #NULL because vectors are 1-D

# Names
z<-runif(5) #gives random uniform numbers
names(z) # no names yet

names(z)<-c("chow","pug", "beagle", "greyhound", "akita") #add names
print(z) #you'll see atomic vector (1 row) but they'll have their assigned names
names(z) #shows names now
names(z)<-NULL #resets the names

# Final type of data: NA values. Stands for missing data
z<-c(3.2, 3.5, NA)
typeof(z)
# double means it's numeric and there aren't any NA's in it
mean(z)
sum(z)

#how to check data for NAs
anyNA(z) #returns a logical (T/F)
is.na(z) #looks at any element of your vector
which(is(na(z))) #helpful for exploring data and determining where NAs are

#SUBSETTING VECTORS
# vectors are indexed
z<-c(3.1, 9.2, 1.3, 0.4, 7.5)
z[4] #use square brackets to subset by index - only returns the fourth element
z[c(4,5)] #to subset more than one, it combines it into one element to feed two different values back
z[-c(2,3)] #use negative to exclude values
z[-1]
z #still get all 5 because we didn't use the assignment operator to save it as a new variable
z[z==7.5] #only returns what meets that exact condition. if only z==7.5, tells you T/F what meets that condition
z[z<7.5] #use logical statements within square brackets to subset by conditions **preferred for cleaner coding
z[which(z<7.5)] #tells you the values of those less than 7.5
which(z<7.5) #only give index (where those integers are)

# creating logical vector
z<7.5

# subsetting characters (named elements)
names(z)<-c("a","b","c","d","e")
z[c("a","d")] #returns just a and d

# subset
subset(x=z, subset=z>1.5) #must look up subset and see the argument name

# randomly sample
# sample function
story_vec<-c("A","Frog", "Jumped","here")
sample(story_vec) #it randomly shuffles the vector around (with no arguments)

#randomly select 3 elements from vector
sample(story_vec, size=3)

#to add a word to this vector
story_vec<-c(story_vec[1], "Green", story_vec[2:4])

#to replace
story_vec[2]<-"Blue"


#FUNCTIONS TO CREATE VECTORS
vec<-vector(mode="numeric", length=5)

## rep and seq function
z<-rep(x=0, times=100) #repeats 0 100x
z<-rep(x=1:4, each=3) #gives me a sequence of 1-4, repeats each 3x
z<-rep(x=1:4, times=3) #repeats 1-4 3x

z<-seq(from=2, to=4) #sequence of 2,3,4
seq(from=2, to=4, by=0.5) #sequence counting up by 0.5

seq(from=1, to=length(z)) #use length if you think your variable will change???

