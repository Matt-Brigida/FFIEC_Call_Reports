

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify <- function(x){
    for (i in 1:dim(x)[2]){
        assign("tmp", data.frame(cbind(1:length(x[, i]), gsub("ID_", "", names(x[, i])), as.vector(x[, i]))))

        names(tmp) <- c("quarter", "IDRSSD", "value")

    assign(paste0("tmp", i),
           tmp, envir = panelify_env)
    }
}

panelified <- do.call(cbind, as.list(panelify_env))
