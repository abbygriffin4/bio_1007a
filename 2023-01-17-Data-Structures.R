###### Vectors, Matrices, Data Frames, and Lists
###### January 17 2023
###### AGG

#### VECTORS (cont'd)
#### PROPERTIES
## All atomic vectors are of the same data type
## If you use c() to assemble different types, R coerces them
## logical -> integer -> double -> character #always coerces them to lowest/base form
## e.g.
a<- c(2, 2.0) # 2 is integer, 2.0 is double
typeof(a) # it will coerce to double
## e.g. 2
b <- c("purple", "green")
typeof(b) # both character

d<-c(a,b) #taking elements of vector a (doubles) and elements of vector b (characters), they will coerce to characters
typeof(d) # it is coerced to characters

## Comparison operators yield a logical result
a<-runif(10) # 10 random uniform numbers
print(a)

## e.g.
a>0.5 # conditional statement

## Can ask how many elements in the vector are > 0.5
sum(a>0.5) #sums together number of elements that are over 0.5 - sums up the trues
mean(a>0.5) # what proportion of vector are > 0.5

#### VECTORIZATION: adds a constant to a vector
## e.g.
z<-c(10,20,30)
z+1 # adds 1 to all vectors

## what happens when vectors are added together?
y<-c(1,2,3)
z+y # results in an "element by element" operation on the vector
z^2
# it's easy when you have vectors of same length, but what if they're not equal...

## RECYCLING: what if vector lengths are not equal?
## e.g.
z
x<-c(1,2)
z+x # it'll go through the 2 then go back to the top of the shorter vector. shorter vector is always recycled

## SIMULATING DATA: runif and rnorm()
## e.g.
runif(5) # or for more specificity
runif(n=5, min=5, max=10) # n is sample size, min=minimum value, max=maximum value

set.seed(123) # generates SAME random numbers. set.seed can be any number, sets random number generator (and is reproducible). set before anything random
runif(n=5, min=5, max=10)
hist(runif(n=100, min=5, max=10))

#rnorm: random normal values with mean 0 and sd 1
randomNormalNumbers<-rnorm(100)
mean(randomNormalNumbers) # mean will be 0
hist(randomNormalNumbers) # hist function shows distribution
rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30)) #use these ways to simulate data


## MATRIX DATA STRUCTURE: 2 dimensional (rows and columns), only homogenous data (usually numeric)
## matrix is an atomic vector organized into rows and columns
my_vec<-1:12 # can arrange into rows and columns in form of a matrix using the matrix function
m<-matrix(data=my_vec, nrow=4) # will use default # of rows unless specified
m<-matrix(data=my_vec, ncol=3) # to specify columns
m<-matrix(data=my_vec, ncol=3, byrow=TRUE) # default is false, if we do TRUE, then it will fill in by row and not by column
dim(my_vec) # returns NULL because it doesn't have a dimension
dim(m) # returns number of rows and columns


#### LISTS: are atomic vectors BUT each element can hold different data types (and different sizes)
myList<-list(1:10, matrix(1:8, nrow=4, byrow=TRUE),letters[1:3],pi) # fill in across=byrow=T
class(myList) # so we know it's a list
str(myList) #gives glimpse of what it looks like, shows that each element retains its data type

## SUBSETTING LISTS
## using [] gives you a single item BUT not the elements
## e.g.
myList[4]
myList[4]-3 # cannot do this because this list is still in its compartment. 
## to grab object itself, use [[]]
## e.g.
myList[[4]] # no double brackets above it, can subtract 3 from it bc it can access object within the list
myList[[4]]-3
## e.g. 2
myList[[2]]
myList[2] # still within list compartment. Can't work with a list, can only work with the elements inside a list
## e.g. 3
myList[[2]][4,1] # if we want that 7 in the matrix - 4th row, 1st column. in 2 dim subsetting, [4,1] - first # is always that row index, second is always column
myList[c(1,2)] # to obtain multiple compartments [[]] within lists
c(myList[[1]],myList[[2]]) # to obtain multiple elements within list

#### NAME LIST ITEMS WHEN THEY ARE CREATED
myList2<- list(Tester=FALSE, littleM=matrix(1:9, nrow=3))
myList2$Tester # $ used with name slots. compartment is gone and we are only working with elements within tester
myList2$littleM[2,3] # extracts second row, third column of little M
myList2$littleM[2,] # leave blank if you want all elements [2,] = second row, all columns
myList2$littleM[2] # gives second element ????

#### UNLIST to string everything back to vector ????
unRolled<-unlist(myList2)
unRolled # tester is 0 because of the binary system where 0=false, 1= true????

## VISUALIZING DATA
data(iris)
head(iris)
plot(Sepal.Length~Petal.Length, data=iris) #y variable~x variable
model<-lm(Sepal.Length~Petal.Length, data=iris) #interested in how much variance in sepal length can be attributed to petal length
results<-summary(model) # gives us stats we're used to seeing in excel # signif codes say what astericks mean
# Pr(<ltl) tells us about the p value for the relationship between petal and sepal length
# we also care about the estimate: it tells us what the predicted slope is.

str(results) # structure of results
results$coefficients #"The $ operator can be used to select a variable/column, to assign new values to a variable/column, or to add a new variable/column in an R object. This R operator can be used on e.g. lists, and dataframes. For example, if we want to print the values in the column “A” in the dataframe called “dollar” we can use the following code: print(dollar$A),
#What is the difference between [[]] and $ in R?
#First of all, using the double brackets enables us to e.g. select multiple columns whereas the $ operator only enables us to select one column"
# In class assignment: only extract Petal Length p value from results. Use [] and unlist() function
results$coefficients["Petal.Length","Pr(>|t|)"]
results[[4]][2,4]
unlist(results)$coefficients8

#### DATA FRAMES: (list of) equal-lengthed vectors, each of which is a column **must all be equal lengths**
varA<-1:12
varB<-rep(c("Con","LowN","HighN"), each=4)
varC<-runif(12)

dFrame<-data.frame(varA,varB,varC, stringsAsFactors = FALSE)
print(dFrame)
str(dFrame) # see they're int/chr/num

## ADD another row (if we want a 1-D type of data structure, we use a list)
newData<-list(varA=13,varB="HighN",varC=0.668)
# use rbind() to add a row
dFrame<-rbind(dFrame,newData)
# why can't we use c?
newData2<-c(14, "HighN",0.668) #bad
dFrame<-rbind(dFrame,newData2) #bad
# the vector was coerced to be characters


## ADD another column
newVar<-runif(14)

# use cbind() function to add column
dFrame<-cbind(dFrame, newVar)
head(dFrame) # ????

#### DATA FRAMES V. MATRICES: what is the major diff?
zMat<-matrix(data=1:30,ncol=3, byrow=TRUE) # can easily convert into data frame because it's 2D
zDframe<-as.data.frame(zMat) # Data frames have labels instead of brackets like in matrix
zMat[3,3] # takes 3rd row and column [row,column]
zDframe[3,3]

zMat[,3] # if want all rows, 3rd column
zDframe[3,] # if want all columns, 3rd row
zDframe$V3 # much easier than square brackets
zDframe["V3"]

zMat[3]
zDframe[3] # different!! whole third volumn is given

#### ELIMINATING NA'S: use complete.cases() function
zD<-c(NA, rnorm(10), NA, rnorm(3)) # in this vector, 1st and 9th element have NA's in it
complete.cases(zD) # gives logical output: FALSE for any NA's it comes upon

## CLEAN out NA's
zD[complete.cases(zD)] # automatically removes NA's
which(!complete.cases(zD)) # ! is used bc complete cases gives what is not an NA - need ! for which is not a complete case (which is an NA)
which(is.na(zD))

# use with a matrix
m<-matrix(1:20, nrow=5)
m[1,1]<-NA # assign an NA
m[5,4]<-NA
complete.cases(m) # gives T/F as to whether whole row is 'complete' (no NAs)

# get complete cases for only certain rows
m[complete.cases(m[,c(1:2)]),] # without second comma it will not come back as vector- returns all columns but doesn't complete case for columns 3&4. says only look at first two columns of matrix
