library(here)

quarters <- c("12312017", "03312018", "06302018", "09302018", "12312018")

idrssds <- list()

for (q in quarters){
	tmp_bulk_por <- tmp_bulk_por <- readRDS(paste0(here(), "/data/", q, "/bulk_POR_", q, ".rds"))

	idrssds[[q]] <- tmp_bulk_por$IDRSSD
    }

### births
births <- list()

for (i in 2:length(quarters)){
    births[[quarters[i]]] <- idrssds[[i]][!(idrssds[[i]] %in% idrssds[[i - 1]])]
}


saveRDS(object = births, file = "idrssds_births_since_12312017.rds")
