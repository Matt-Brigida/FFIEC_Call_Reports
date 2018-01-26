
## function to reshape data for panel -----
panelify <- function(x, value_name){
    for (i in 1:dim(x)[2]){
        assign("tmp", data.frame(cbind(1:length(x[, i]), gsub("ID_", "", names(x[, i])), as.vector(x[, i]))))

        names(tmp) <- c("quarter", "IDRSSD", value_name)

    assign(paste0("tmp", i),
           tmp, envir = panelify_env)
    }
}




## change for whatever data we are reshaping ------
data <- readRDS("../Full_Sample/pulling_alive_2017/Cloans_cap.rds")

### Reshaping data: x is the output from query (xts with IDRSSD in column name) ----

panelify_env <- new.env()

panelify(data, "Cloans_cap")

panelified <- do.call(rbind, as.list(panelify_env))

saveRDS(panelified, "panel_Cloans_cap.rds")
