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



