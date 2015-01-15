## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

    cache <- NULL
    
    set <- function(new.value) {
        x <<- new.value
        cache <<- NULL
    }
    
    get <- function() {
        return(x)
    }
    
    set.cache <- function(value) {
        cache <<- value
    }
    
    get.cache <- function() {
        return(cache)
    }
    
    list(set = set, get = get, set.cache = set.cache, get.cache = get.cache)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    inverted <- x$get.cache()
    
    if (!is.null(inverted)) {
        message("getting cached data")
        return(inverted)
    }
    
    stored.matrix <- x$get()
    inverted <- solve(stored.matrix, ...)
    x$set.cache(inverted)
    
    inverted
}

