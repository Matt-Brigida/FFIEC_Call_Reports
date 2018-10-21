### Matching names to get which banks are public -----

## Banks in FDIC data
por <- readRDS("../../../data/06302017/bulk_POR_06302017.rds")

namesID <- data.frame(cbind(por$IDRSSD, por$'Financial Institution Name'), stringsAsFactors = FALSE)
names(namesID) <- c("IDRSSD", "Name")

## Listed Banks

listed <- read.csv("./public_bank_names.txt")
listed <- data.frame(listed[,1], stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " INC.", replacement = "", listed[,1]), stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " CORP.", replacement = "", listed_cleaned[,1]), stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " CORPORATION", replacement = "", listed_cleaned[,1]), stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " S.A.", replacement = "", listed_cleaned[,1]), stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " PLC.", replacement = "", listed_cleaned[,1]), stringsAsFactors = FALSE)
listed_cleaned <- data.frame(gsub(pattern = " LTD.", replacement = "", listed_cleaned[,1]), stringsAsFactors = FALSE)

## remove anything after the ,
split <- strsplit(namesID[, 2], ",")
namesID_cleaned <- unlist(lapply(split, `[[`, 1))
namesID_cleaned <- data.frame(cbind(namesID[,1], namesID_cleaned), stringsAsFactors = FALSE)
names(namesID_cleaned) <- c("IDRSSD", "Name")

isin <- NA
for (i in 1:length(namesID_cleaned[,2])){
    isin[i] <- namesID_cleaned[i, 2] %in% listed_cleaned[,1]
}

ispublic <- data.frame(cbind(namesID_cleaned, isin), stringsAsFactors = FALSE)

saveRDS(ispublic, "ispublic.rds")
