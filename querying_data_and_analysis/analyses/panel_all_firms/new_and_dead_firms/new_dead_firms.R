################################################################
### Create a quarter by quarter list of new and dead IDRSSDs ###
################################################################

library(here)

## This is nice but doesn't give me quarters in order
## quarters <- list.dirs("../../../../data/", full.names = FALSE)[-1]

quarters <- c("03312001", "06302001", "09302001", "12312001", "03312002", "06302002", "09302002", "12312002", "03312003", "06302003", "09302003", "12312003", "03312004", "06302004", "09302004", "12312004", "03312005", "06302005", "09302005", "12312005", "03312006", "06302006", "09302006", "12312006", "03312007", "06302007", "09302007", "12312007", "03312008", "06302008", "09302008", "12312008", "03312009", "06302009", "09302009", "12312009", "03312010", "06302010", "09302010", "12312010", "03312011", "06302011", "09302011", "12312011", "03312012", "06302012", "09302012", "12312012", "03312013", "06302013", "09302013", "12312013", "03312014", "06302014", "09302014", "12312014", "03312015", "06302015", "09302015", "12312015", "03312016", "06302016", "09302016", "12312016", "03312017", "06302017")

idrssds <- list()

for (q in quarters){
    
tmp_bulk_por <- readRDS(paste0(here(), "/data/", q, "/bulk_POR_", q, ".rds"))

idrssds[[q]] <- tmp_bulk_por$IDRSSD

    }

### ^ works

### firms in quarter 3 that are not in quarter 2
idrssds[[3]][!(idrssds[[3]] %in% idrssds[[2]])]

## births -----
births <- list()

for (i in 2:length(quarters)){
    births[[quarters[i]]] <- idrssds[[i]][!(idrssds[[i]] %in% idrssds[[i - 1]])]
}

### firms in quarter 3 that are not in quarter 4
idrssds[[3]][!(idrssds[[3]] %in% idrssds[[4]])]

## deaths -----
deaths <- list()

for (i in 1:(length(quarters) - 1)){
    deaths[[quarters[i + 1]]] <- idrssds[[i]][!(idrssds[[i]] %in% idrssds[[i + 1]])]
}



### vizualizations

### plot deaths

plot(unlist(lapply(deaths, length)), type = "b", xaxt = "n", xlab = "", main = "Deaths", ylab = "Number of Deaths")
axis(1, at = 1:length(names(deaths)), labels = names(deaths), las = 2)

### plot births

plot(unlist(lapply(births, length)), type = "b")

### birth - death

plot(unlist(lapply(births, length)) - unlist(lapply(deaths, length)), type = "b")
