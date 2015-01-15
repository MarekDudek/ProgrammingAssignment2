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
m.stored <- cm$get()

#### Then
assert( m == m.stored )

###############################################################################################
### ... and cached value should be unavailable at first ...
###############################################################################################

#### When
m.inverted <- cm$get.inverted()

#### Then
assert( is.null(m.inverted) )

###############################################################################################
### ... until it is explicitely set.
###############################################################################################

#### When
cm$set.inverted(other.matrix)

#### Then
m.inverted <- cm$get.inverted()
assert( ! is.null(m.inverted) )

###############################################################################################
### It should be possible to change stored value ...
###############################################################################################

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
cm$set(other.matrix)

#### Then
m.stored <- cm$get()
assert( m.stored == other.matrix )

###############################################################################################
### ... and cached value should be cleared when stored value changes.
###############################################################################################

#### Given
cm$set.inverted(some.matrix)

#### When
cm$set(some.matrix)

#### Then
m.inverted <- cm$get.inverted()
assert( is.null(m.inverted) )

