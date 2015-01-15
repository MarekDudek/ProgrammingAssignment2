library(testit)

## Matrix inversion examples
##
## Three example invertible matrices are inverted using 'solve' function and the result is tested.
## Matrix multiplied by its inverse should give identity matrix - square diagonal matrix with ones along the diagonal.
##
## '%*%'     operator performs matrix multiplication
## 'diag'    function creates singular matrices with given size
## 'assert'  function checks given condition
## 'round'   function rounds values as in the last example values very close but not equal to zero and one appear

### 2 x 2

N = 2

m2     <- matrix(c(4, 3, 3, 2), nrow=N, ncol=N)
m2.inv <- solve(m2)

assert( m2 %*% m2.inv == diag(1, N) )

### 3 x 3

N = 3

m3     <- matrix(c(1, 0, 1, 2, 4, 0, 3, 5, 6), nrow=N, ncol=N)
m3.inv <- solve(m3)

assert( m3 %*% m3.inv == diag(1, N) )


### 4 x 4

N = 4

m4     <- matrix(c(2, 4, 8, 15, 9, 5, 10, 16, 11, 6, 13, 17, 12, 7, 14, 18), nrow=N, ncol=N)
m4.inv <- solve(m4)

assert( round(m4 %*% m4.inv) == diag(1, N) )