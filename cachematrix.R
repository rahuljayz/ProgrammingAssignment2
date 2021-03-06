# Matrix inversion is usually a costly computation and there may be some benefit
# to caching the inverse of a matrix rather than compute it repeatedly. The
# following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix() function creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  mi <- NULL
  set <- function(y) {  #set the matrix x
    x <<- y
    mi <<- NULL
  }
  get <- function() x #gets the matrix x
  setInverse <- function(inverse) mi <<- inverse #set the inverse mi
  getInverse <- function() mi #get the inverse mi
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# cacheSolve() function returns the inverse of the matrix. It first checks if
# the inverse has already been computed and set in the original matrix. If so, 
# it gets the result and skips the computation. If not, 
# it computes the inverse, sets the value in the cache via setinverse function.

# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
  mi <- x$getInverse()
  if(!is.null(mi)) {
    message("getting cached matrix inverse")
    return(mi)
  }
  data <- x$get()
  mi <- solve(data)
  x$setInverse(mi)
  mi
}
