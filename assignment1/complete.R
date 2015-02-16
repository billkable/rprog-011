complete <- function(directory, id = 1:332) {
        
        obs.entry.data.frame <- data.frame(id = NA, nobs = NA) 
        
        good.data <- complete.cases(obs.entry.data.frame)
        
        obs.entry.data.frame = obs.entry.data.frame[good.data,]
        
        for(i in id) {
                file.name <- paste(directory,"/",sprintf("%03d",i),".csv",sep="")
                output.data.frame <- load.pollutant.monitor.file(file.name)
                new.obs.entry.data.frame <- data.frame(id = i, nobs = nrow(output.data.frame)) 
                obs.entry.data.frame <- rbind(obs.entry.data.frame,new.obs.entry.data.frame)
        }
        
        obs.entry.data.frame
}
