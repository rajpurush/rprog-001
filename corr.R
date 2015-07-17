corr <- function(directory, threshold = 0) {
        
		# Change working directory to where the file are located    
		setwd("C:/Users/vipl/rprog-001")
        setwd(directory)
		      
		
		# get the list of files in the directory
		files <- list.files()
		nitrate <- "nitrate"
		sulfate <- "sulfate"
		
		# vector to hold the "cor" 
		corvec <- c()
		
		for (file in files) {
		
		    # for each of the file in the "directory" get the number of 
			# complete observations. Had no choice but to read the completly 
			# to determine the count. Not sure if there is "memory" efficient
			# approach.
			
		    data <- read.csv(file)
			obscount <- nrow(data[complete.cases(data),])
		    
            # "cor" only if the no of complete observations above the threshold			
            if( obscount > threshold) {
			    cor <- cor(data[complete.cases(data),nitrate], 
				           data[complete.cases(data),sulfate]) 
				corvec <- append(corvec, cor)
			}
	    }
		return (corvec)
}