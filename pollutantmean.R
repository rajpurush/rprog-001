pollutantmean <- function(directory, pollutant, id = 1:332) {
       
		# Change working directory to where the file are located    
		setwd("C:/Users/vipl/rprog-001")
        setwd(directory)
				
	    # Temp vector to hold non-NA values for the pollutants from all the
        # files.
		
  		pollvec <- c()
		for (i in id) {
		    # Identify the file name from id
  		    file <- paste(sprintf("%03d", i), ".csv", sep="")
		    
			# read the file into a data.frame
			data <- read.csv(file)
			
			# Extract the Non-NA values for the pollutant 
			pollfna <- (data[,pollutant])
			pollvec <- append(pollvec, pollfna[!is.na(pollfna)])
	    }

		# calculate the mean
		meanpol <- mean(pollvec)

		return (meanpol)
}
