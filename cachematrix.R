## Put comments here that give an overall description of what your
## functions do

## returns list of functions set, get, setinverse, getinverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
            x <<- y
            inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Check whether inverse matrix exists or calculate inverse matrix 

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    print(data)
    data2 <- x$set
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}

my_matrix <- matrix(1:4, nrow = 2, ncol = 2)
my_cache_matrix <- makeCacheMatrix(my_matrix)
cacheinverse(my_cache_matrix)


