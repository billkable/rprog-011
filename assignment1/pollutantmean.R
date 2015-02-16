pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
  
  
        load.pollutant.data <- function(directory,id) {
                output.data.frame <- data.frame(Date = NA, sulfate = NA, nitrate = NA, ID = NA) 
                
                good.data <- complete.cases(output.data.frame)
                
                output.data.frame = output.data.frame[good.data,]
                
                print("loading pollutant monitor data...")
                for(i in id) {
                        file.name <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
                        
                        filtered.data <- load.pollutant.monitor.file(file.name)
                        output.data.frame <- rbind(output.data.frame,filtered.data)
                }
                
                output.data.frame
        }

        if (pollutant == "sulfate") {
                output.data.frame <- load.pollutant.data(directory,id)
               mean(output.data.frame$sulfate)
        } else if (pollutant == "nitrate") {
                output.data.frame <- load.pollutant.data(directory,id)
                mean(output.data.frame$nitrate)
        } else {
                "INVALID POLLUTANT"
        }

}