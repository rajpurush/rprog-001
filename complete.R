complete <- function(directory, id = 1:332) {
 		
		# Change working directory to where the file are located       
		setwd("C:/Users/vipl/rprog-001")
        setwd(directory)
		
   	    # Temporary vector to hold id's and its corresponding complete obs
        idvec <- c()
		obsvec <- c()
		
		for (i in id) {
		
		    # Identify the file name from id
  		    file <- paste(sprintf("%03d", i), ".csv", sep="")
		    
			# read the file into a data.frame
			data <- read.csv(file)
			
			# Determine the complete observation for the data.frame
			obscount <- nrow(data[complete.cases(data),])
			
			# Append to the vector
			obsvec <- append(obsvec, obscount)
			idvec <- append(idvec, i)
	    }
		# Data frame to hold the results - generate using the id and obs vector
		df <- data.frame(idvec, obsvec)
		names(df) <- c("id", "obs")
				
		return (df)
}