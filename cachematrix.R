library(testit)

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

## Matrix inversion examples

# 2x2 matrix
m2 <- matrix(c(4, 3, 3, 2), nrow=2, ncol=2)
m2.inverted <- solve(m2)

assert( m2 %*% m2.inverted == diag(1, 2) )

# 3x3 matrix
m3 <- matrix(c(1, 0, 1, 2, 4, 0, 3, 5, 6), nrow=3, ncol=3)
m3.inverted <- solve(m3)

assert( m3 %*% m3.inverted == diag(1, 3) )

# 4x4 matrix
m4 <- matrix(c(2, 4, 8, 15, 9, 5, 10, 16, 11, 6, 13, 17, 12, 7, 14, 18), nrow=4, ncol=4)
m4.inverted <- solve(m4)

assert( round(m4 %*% m4.inverted) == diag(1, 4) )