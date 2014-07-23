## Put comments here that give an overall description of what your
## functions do
## These functions use the cache memory to save processing time and 
## leverage the capabilities of R in the definition of objects with its own 
## variables and methods

## Write a short comment describing this function:
## This funtion crates somekind of class where you have a matrix  
## and save its contents and its inverse and saves it in the 
## parent directory 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m <<- solve
    getinv <- function() m
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
    
    
    
}


## Write a short comment describing this function
## This function check in the cache for the inverse of the argument
## and if it is found it is returned it without the computation. If the inverse 
## is not found, calculates it and return the result

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinv()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinv(m)
    m
    
}
