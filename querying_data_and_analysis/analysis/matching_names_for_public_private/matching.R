### Matching names to get which banks are public -----

por <- readRDS("../../../data/06302017/bulk_POR_06302017.rds")

nameID <- data.frame(cbind(por$IDRSSD, por$'Financial Institution Name'), stringsAsFactors = FALSE)
names(nameID) <- c("IDRSSD", "Name")


## remove INC, THE, FSB, F.S.B., 
