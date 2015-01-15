###############################################################################################
## Tests for 'cachematrix'.
###############################################################################################

library(testit)

script.dir <- dirname(sys.frame(1)$ofile)
source(file.path(script.dir, 'cachematrix.R'))

###############################################################################################
N = 2
some.matrix  <- c(1, 2, 3, 4)
other.matrix <- c(0, 0, 0, 0)
###############################################################################################

###############################################################################################
### Cache matrix should store matrix it was initialized with ...
###############################################################################################

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
m.stored <- cm$get.value()

#### Then
assert( m == m.stored )

###############################################################################################
### ... and cached value should be unavailable at first ...
###############################################################################################

#### When
m.inverse <- cm$get.cache()

#### Then
assert( is.null(m.inverse) )

###############################################################################################
### ... until it is set by solving.
###############################################################################################

#### When
cacheSolve(cm)

#### Then
m.inverse <- cm$get.cache()
assert( ! is.null(m.inverse) )

###############################################################################################
### It should be possible to change stored value ...
###############################################################################################

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
cm$set.value(other.matrix)

#### Then
m.stored <- cm$get.value()
assert( m.stored == other.matrix )

###############################################################################################
### ... and cached value should be cleared when stored value changes.
###############################################################################################

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)
cacheSolve(cm)

#### When
cm$set.value(some.matrix)

#### Then
m.inverse <- cm$get.cache()
assert( is.null(m.inverse) )

###############################################################################################
### Inverse matrix should be returned ...
###############################################################################################

N = 3

#### Given
m  <- matrix(c(1, 0, 1, 2, 4, 0, 3, 5, 6), nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
inverse <- cacheSolve(cm)

#### Then
assert( m %*% inverse == diag(1, N) ) # About matrix inversion see 'matrix-inversion-examples.R'

###############################################################################################
### ... also the second time.
###############################################################################################

#### When
inverse <- cacheSolve(cm)

#### Then
assert( m %*% inverse == diag(1, N) )