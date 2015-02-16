load.pollutant.monitor.file <- function(file.name, filtered=TRUE) {
        read.data.frame <- read.csv(file.name)
        
        if(filtered) {
                good.data <- complete.cases(read.data.frame)
                filtered.data <- read.data.frame[good.data,] 
                filtered.data
        } else {
                read.data.frame
        }

}