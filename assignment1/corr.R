corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        corr.vector <- vector(mode = "logical", length = 0)
        
        for(i in 1:332) {
                file.name <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
                data.frame <- load.pollutant.monitor.file(file.name)
                
                if(nrow(data.frame) > threshold) {
                        c <- cor(data.frame$sulfate,data.frame$nitrate)
                        corr.vector <- append(corr.vector,c)
                }
        }
        
        corr.vector
}