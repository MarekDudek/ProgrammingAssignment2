## Funcions to create matrices with cacheable results of solving (inverting) them.
##
## 'makeCacheMatrix' creates cacheable matrix
## 'cacheSolve' returns (possibly cached) solution


## Create cacheable matrix.
##
## Function stores source matrix and (initially empty) cache of its derived value. 
## It also exposes functions that enable manipulation of those two values.
## Cache is emptied whenever source matrix changes.

makeCacheMatrix <- function(matrix = matrix()) {

    cache <- NULL
    
    set.value <- function(new.matrix) {
        matrix <<- new.matrix
        cache  <<- NULL
    }
    
    get.value <- function() {
        return(matrix)
    }
    
    set.cache <- function(new.cache) {
        cache <<- new.cache
    }
    
    get.cache <- function() {
        return(cache)
    }
    
    list(set.value = set.value, get.value = get.value, set.cache = set.cache, get.cache = get.cache)
}


## Write a short comment describing this function

cacheSolve <- function(cachable.matrix, ...) {
    
    cache <- cachable.matrix$get.cache()
    
    if (is.null(cache)) {
        value <- cachable.matrix$get.value()
        cache <- solve(value, ...)
        cachable.matrix$set.cache(cache)
    } else {
        message("getting cached data")
    }
    
    cache
}