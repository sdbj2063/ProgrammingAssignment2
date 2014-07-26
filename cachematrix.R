
## R Programming through Coursera
## Assignment 2, Lexical Scoping with Inverse Matrix

## This R script creates two functions.

makeCacheMatrix <- function(x = matrix()) {
  
  ## R Programming through Coursera
  ## Assignment 2, Lexical Scoping with Inverse Matrix
    
  ## The goal is to utilize the assignment operator <<-. 
  ## The book 'Software for Data Analysis: Programming with R'
  ## by John Chambers, section 5.4, has a good explanation.
  
  ## Goal is to create a special vector of a list with a function
  ## that does the following:
  ## 1. sets matrix value
  ## 2. gets matrix value
  ## 3. sets inverse matrix value
  ## 4. gets inverse matrix value

  ## Per the assignment instructions, the code logic
  ## assumes the input is always an invertible matrix.
  
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  ## R Programming through Coursera
  ## Assignment 2, Lexical Scoping with Inverse Matrix
  
  ## Calculates the mean of the vector using makeCacheMatrix().
  ## Checks if inverse matrix has been calculated and cached.
  ## If yes, gets inverse matrix from cache and does not calculate.
  ## If no, calculates inverse matrix of data and sets value of cached
  ## inverse matrix using setinverse().
  
  ## Per the assignment instructions, the code logic
  ## assumes the input is always an invertible matrix.
  
  m <- x$getinverse()
  if(!is.null(m)) {
    message("Getting cached inverse matrix.")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m 

}
