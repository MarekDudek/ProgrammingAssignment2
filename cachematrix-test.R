## Tests for 'cachematrix'.
library(testit)

script.dir <- dirname(sys.frame(1)$ofile)
source(file.path(script.dir, 'cachematrix.R'))

###
N = 2
some.matrix  <- c(1, 2, 3, 4)
other.matrix <- c(0, 0, 0, 0)

### Cache matrix should store matrix it was initialized with

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
m.stored <- cm$get()

#### Then
assert( m == m.stored )


### It should be possible to change stored value

#### Given
m  <- matrix(some.matrix, nrow=N, ncol=N)
cm <- makeCacheMatrix(m)

#### When
cm$set(other.matrix)

#### Then
m.stored <- cm$get()
assert( m.stored == other.matrix )
