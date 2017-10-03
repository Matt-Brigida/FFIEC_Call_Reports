library(data.table)

quarter <- "03312012"

read_and_set_key <- function(quarter){

    location <- paste0("../data/", quarter, "/")
    files <- list.files(location)
    
    renamed <- list()
    sch_name <- list()

    for (i in 1:length(files)){
        sch_name[[i]] <- strsplit(files[i], split = "_")
        if( length(sch_name[[i]][[1]]) > 3 ){
            renamed[i] <- paste0(sch_name[[i]][[1]][2], sch_name[[i]][[1]][3], sch_name[[i]][[1]][4], sch_name[[i]][[1]][5])
        } else {
            renamed[i] <- sch_name[[i]][[1]][2]
        }
    }

    data.tables.env <- new.env()
    
        for(i in 1:length(files)){
            assign(renamed[[i]][1], as.data.table(readRDS(paste0(location, files[i]))), envir = data.tables.env)
        }

    ## drop RCON1773, RCON1754, and RCFD1773 from all tables -- shows up multiple times -----
    ## find another way eventually
    eapply(env = data.tables.env, function(x){x[,c("RCON1773", "RCON1754", "RCFD1773"):=NULL]})
    
    eapply(env = data.tables.env, function(x){ setkey(x, "IDRSSD") })

    ## doesn't work
    ## eapply(env = data.tables.env, function(x) x[,!duplicated(colnames(x))])

    full_call_report <- Reduce((function() {counter = 0
        function(x, y) {
            counter <<- counter + 1
            d = merge(x, y, all = T, by = "IDRSSD")
            setnames(d, c(head(names(d), -1), paste0('y.', counter)))
        }})(), mget(ls(envir = data.tables.env), envir = data.tables.env))

    return(full_call_report)
}
