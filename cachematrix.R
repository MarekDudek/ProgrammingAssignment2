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


## Return inverted matrix, handling cached value.
##
## Function solves (inverts) matrix or returns solution from cache.
## If cache is empty it is filled with solution for further use.

cacheSolve <- function(cachable.matrix, ...) {
    
    inverted <- cachable.matrix$get.cache()
    
    if (is.null(inverted)) {
        value <- cachable.matrix$get.value()
        inverted <- solve(value, ...)
        cachable.matrix$set.cache(inverted)
    } else {
        message("getting cached data")
    }
    
    inverted
}