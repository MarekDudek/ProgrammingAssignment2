library(testit)

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    x.inverted.cache <- NULL
    
    set <- function(new.x) {
        x <<- new.x
        x.inverted.cache <<- NULL
    }
    
    get <- function() {
        return(x)
    }
    
    set.inverted <- function(inverted) {
        x.inverted.cache <<- inverted
    }
    
    get.inverted <- function() {
        return(x.inverted.cache)
    }
    
    list(set = set, get = get, set.inverted = set.inverted, get.inverted = get.inverted)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    inverted <- x$get.inverted()
    
    if (!is.null(inverted)) {
        message("getting cached data")
        return(inverted)
    }
    
    stored.matrix <- x$get()
    inverted <- solve(stored.matrix, ...)
    x$set.inverted(inverted)
    
    inverted
}

