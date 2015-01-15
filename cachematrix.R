## Funcions to create matrices with cacheable results of solving (inverting) them.
##
## 'makeCacheMatrix' creates cacheable matrix
## 'cacheSolve' returns (possibly cached) solution
##
## Automatic tests of functionality in 'cachematrix-test.R' show example usage.


## Create cacheable matrix.
##
## Function stores source matrix ('x' variable) and (initially empty) cache ('cache' variable) of its derived value. 
## It also exposes functions that enable manipulation of those two values.
## Cache is emptied whenever source matrix changes (by calling 'set.value' function).

makeCacheMatrix <- function(x = matrix()) {

    cache <- NULL
    
    set.value <- function(new.matrix) {
        x      <<- new.matrix
        cache  <<- NULL
    }
    
    get.value <- function() {
        return(x)
    }
    
    set.cache <- function(new.cache) {
        cache <<- new.cache
    }
    
    get.cache <- function() {
        return(cache)
    }
    
    list(set.value = set.value, get.value = get.value, set.cache = set.cache, get.cache = get.cache)
}


## Return inverse matrix, handling cached value.
##
## Function solves (inverts) matrix or returns solution from cache.
## If cache is empty it is filled with solution for further use.

cacheSolve <- function(x, ...) {
    
    inverse <- x$get.cache()
    
    if (is.null(inverse)) {
        value    <- x$get.value()
        inverse <- solve(value, ...)
        x$set.cache(inverse)
    }
    
    inverse
}