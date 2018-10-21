## 09302011

library(readr)
library(dplyr)
library(RSQLite)

## create database
dbc <- dbConnect(RSQLite::SQLite(), "../callReports")

## names
bulk_POR <- read_tsv("../FFIEC\ CDR\ Call\ Bulk\ POR\ 09302011.txt")
saveRDS(bulk_POR, "../data/bulk_POR_09302011.rds")
dbWriteTable(dbc, "bulk_POR_09302011", bulk_POR, overwrite = TRUE)

## Schedule CI
sch_CI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 09302011.txt", n_max = 1) %>% names()
sch_CI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 09302011.txt", skip = 2, col_names = sch_CI_names)
## sch_CI <- sch_CI[,-dim(sch_CI)[2]]
saveRDS(sch_CI, "../data/sch_CI_09302011.rds")
dbWriteTable(dbc, "sch_CI_09302011", sch_CI, overwrite = TRUE)


## Schedule ENT
sch_ENT_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 09302011.txt", n_max = 1) %>% names()
sch_ENT <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 09302011.txt", skip = 2, col_names = sch_ENT_names)
## sch_ENT <- sch_ENT[,-dim(sch_ENT)[2]]
saveRDS(sch_ENT, "../data/sch_ENT_09302011.rds")
dbWriteTable(dbc, "sch_ENT_09302011", sch_ENT, overwrite = TRUE)

## Schedule GI
sch_GI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 09302011.txt", n_max = 1) %>% names()
sch_GI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 09302011.txt", skip = 2, col_names = sch_GI_names)
## sch_GI <- sch_GI[,-dim(sch_GI)[2]]
saveRDS(sch_GI, "../data/sch_GI_09302011.rds")
dbWriteTable(dbc, "sch_GI_09302011", sch_GI, overwrite = TRUE)

## Schedule GL
sch_GL_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 09302011.txt", n_max = 1) %>% names()
sch_GL <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 09302011.txt", skip = 2, col_names = sch_GL_names)
## sch_GL <- sch_GL[,-dim(sch_GL)[2]]
saveRDS(sch_GL, "../data/sch_GL_09302011.rds")
dbWriteTable(dbc, "sch_GL_09302011", sch_GL, overwrite = TRUE)

## Schedule NARR
sch_NARR_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 09302011.txt", n_max = 1) %>% names()
sch_NARR <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 09302011.txt", skip = 2, col_names = sch_NARR_names)
## sch_NARR <- sch_NARR[,-dim(sch_NARR)[2]]
saveRDS(sch_NARR, "../data/sch_NARR_09302011.rds")
dbWriteTable(dbc, "sch_NARR_09302011", sch_NARR, overwrite = TRUE)

## Schedule RC
sch_RC_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 09302011.txt", n_max = 1) %>% names()
sch_RC <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 09302011.txt", skip = 2, col_names = sch_RC_names)
## sch_RC <- sch_RC[,-dim(sch_RC)[2]]
saveRDS(sch_RC, "../data/sch_RC_09302011.rds")
dbWriteTable(dbc, "sch_RC_09302011", sch_RC, overwrite = TRUE)

## Schedule RCA
sch_RCA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 09302011.txt", n_max = 1) %>% names()
sch_RCA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 09302011.txt", skip = 2, col_names = sch_RCA_names)
## sch_RCA <- sch_RCA[,-dim(sch_RCA)[2]]
saveRDS(sch_RCA, "../data/sch_RCA_09302011.rds")
dbWriteTable(dbc, "sch_RCA_09302011", sch_RCA, overwrite = TRUE)

## Schedule RCB_1_of_2
sch_RCB_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCB_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCB_1_of_2_names)
## sch_RCB_1_of_2 <- sch_RCB_1_of_2[,-dim(sch_RCB_1_of_2)[2]]
saveRDS(sch_RCB_1_of_2, "../data/sch_RCB_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCB_1_of_2_09302011", sch_RCB_1_of_2, overwrite = TRUE)

## Schedule RCB_2_of_2
sch_RCB_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCB_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCB_2_of_2_names)
## sch_RCB_2_of_2 <- sch_RCB_2_of_2[,-dim(sch_RCB_2_of_2)[2]]
saveRDS(sch_RCB_2_of_2, "../data/sch_RCB_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCB_2_of_2_09302011", sch_RCB_2_of_2, overwrite = TRUE)

## Schedule RCCI
sch_RCCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 09302011.txt", n_max = 1) %>% names()
sch_RCCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 09302011.txt", skip = 2, col_names = sch_RCCI_names)
## sch_RCCI <- sch_RCCI[,-dim(sch_RCCI)[2]]
saveRDS(sch_RCCI, "../data/sch_RCCI_09302011.rds")
dbWriteTable(dbc, "sch_RCCI_09302011", sch_RCCI, overwrite = TRUE)

## Schedule RCCII
sch_RCCII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 09302011.txt", n_max = 1) %>% names()
sch_RCCII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 09302011.txt", skip = 2, col_names = sch_RCCII_names)
## sch_RCCII <- sch_RCCII[,-dim(sch_RCCII)[2]]
saveRDS(sch_RCCII, "../data/sch_RCCII_09302011.rds")
dbWriteTable(dbc, "sch_RCCII_09302011", sch_RCCII, overwrite = TRUE)

## Schedule RCD
sch_RCD_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 09302011.txt", n_max = 1) %>% names()
sch_RCD <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 09302011.txt", skip = 2, col_names = sch_RCD_names)
## sch_RCD <- sch_RCD[,-dim(sch_RCD)[2]]
saveRDS(sch_RCD, "../data/sch_RCD_09302011.rds")
dbWriteTable(dbc, "sch_RCD_09302011", sch_RCD, overwrite = TRUE)

## Schedule RCE
sch_RCE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 09302011.txt", n_max = 1) %>% names()
sch_RCE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 09302011.txt", skip = 2, col_names = sch_RCE_names)
## sch_RCE <- sch_RCE[,-dim(sch_RCE)[2]]
saveRDS(sch_RCE, "../data/sch_RCE_09302011.rds")
dbWriteTable(dbc, "sch_RCE_09302011", sch_RCE, overwrite = TRUE)

## Schedule RCEI
sch_RCEI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 09302011.txt", n_max = 1) %>% names()
sch_RCEI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 09302011.txt", skip = 2, col_names = sch_RCEI_names)
## sch_RCEI <- sch_RCEI[,-dim(sch_RCEI)[2]]
saveRDS(sch_RCEI, "../data/sch_RCEI_09302011.rds")
dbWriteTable(dbc, "sch_RCEI_09302011", sch_RCEI, overwrite = TRUE)

## Schedule RCEII
sch_RCEII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 09302011.txt", n_max = 1) %>% names()
sch_RCEII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 09302011.txt", skip = 2, col_names = sch_RCEII_names)
## sch_RCEII <- sch_RCEII[,-dim(sch_RCEII)[2]]
saveRDS(sch_RCEII, "../data/sch_RCEII_09302011.rds")
dbWriteTable(dbc, "sch_RCEII_09302011", sch_RCEII, overwrite = TRUE)

## Schedule RCF
sch_RCF_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 09302011.txt", n_max = 1) %>% names()
sch_RCF <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 09302011.txt", skip = 2, col_names = sch_RCF_names)
## sch_RCF <- sch_RCF[,-dim(sch_RCF)[2]]
saveRDS(sch_RCF, "../data/sch_RCF_09302011.rds")
dbWriteTable(dbc, "sch_RCF_09302011", sch_RCF, overwrite = TRUE)

## Schedule RCG
sch_RCG_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 09302011.txt", n_max = 1) %>% names()
sch_RCG <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 09302011.txt", skip = 2, col_names = sch_RCG_names)
## sch_RCG <- sch_RCG[,-dim(sch_RCG)[2]]
saveRDS(sch_RCG, "../data/sch_RCG_09302011.rds")
dbWriteTable(dbc, "sch_RCG_09302011", sch_RCG, overwrite = TRUE)

## Schedule RCH
sch_RCH_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 09302011.txt", n_max = 1) %>% names()
sch_RCH <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 09302011.txt", skip = 2, col_names = sch_RCH_names)
## sch_RCH <- sch_RCH[,-dim(sch_RCH)[2]]
saveRDS(sch_RCH, "../data/sch_RCH_09302011.rds")
dbWriteTable(dbc, "sch_RCH_09302011", sch_RCH, overwrite = TRUE)

## Schedule RCI
sch_RCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 09302011.txt", n_max = 1) %>% names()
sch_RCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 09302011.txt", skip = 2, col_names = sch_RCI_names)
## sch_RCI <- sch_RCI[,-dim(sch_RCI)[2]]
saveRDS(sch_RCI, "../data/sch_RCI_09302011.rds")
dbWriteTable(dbc, "sch_RCI_09302011", sch_RCI, overwrite = TRUE)

## Schedule RCK
sch_RCK_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 09302011.txt", n_max = 1) %>% names()
sch_RCK <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 09302011.txt", skip = 2, col_names = sch_RCK_names)
## sch_RCK <- sch_RCK[,-dim(sch_RCK)[2]]
saveRDS(sch_RCK, "../data/sch_RCK_09302011.rds")
dbWriteTable(dbc, "sch_RCK_09302011", sch_RCK, overwrite = TRUE)

## Schedule RCL_1_of_2
sch_RCL_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCL_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCL_1_of_2_names)
## sch_RCL_1_of_2 <- sch_RCL_1_of_2[,-dim(sch_RCL_1_of_2)[2]]
saveRDS(sch_RCL_1_of_2, "../data/sch_RCL_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCL_1_of_2_09302011", sch_RCL_1_of_2, overwrite = TRUE)

## Schedule RCL_2_of_2
sch_RCL_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCL_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCL_2_of_2_names)
## sch_RCL_2_of_2 <- sch_RCL_2_of_2[,-dim(sch_RCL_2_of_2)[2]]
saveRDS(sch_RCL_2_of_2, "../data/sch_RCL_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCL_2_of_2_09302011", sch_RCL_2_of_2, overwrite = TRUE)

## Schedule RCM
sch_RCM_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 09302011.txt", n_max = 1) %>% names()
sch_RCM <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 09302011.txt", skip = 2, col_names = sch_RCM_names)
## sch_RCM <- sch_RCM[,-dim(sch_RCM)[2]]
saveRDS(sch_RCM, "../data/sch_RCM_09302011.rds")
dbWriteTable(dbc, "sch_RCM_09302011", sch_RCM, overwrite = TRUE)

## Schedule RCN_1_of_2
sch_RCN_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCN_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCN_1_of_2_names)
## sch_RCN_1_of_2 <- sch_RCN_1_of_2[,-dim(sch_RCN_1_of_2)[2]]
saveRDS(sch_RCN_1_of_2, "../data/sch_RCN_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCN_1_of_2_09302011", sch_RCN_1_of_2, overwrite = TRUE)

## Schedule RCN_2_of_2
sch_RCN_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCN_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCN_2_of_2_names)
## sch_RCN_2_of_2 <- sch_RCN_2_of_2[,-dim(sch_RCN_2_of_2)[2]]
saveRDS(sch_RCN_2_of_2, "../data/sch_RCN_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCN_2_of_2_09302011", sch_RCN_2_of_2, overwrite = TRUE)

## Schedule RCO
sch_RCO_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 09302011.txt", n_max = 1) %>% names()
sch_RCO <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 09302011.txt", skip = 2, col_names = sch_RCO_names)
## sch_RCO <- sch_RCO[,-dim(sch_RCO)[2]]
saveRDS(sch_RCO, "../data/sch_RCO_09302011.rds")
dbWriteTable(dbc, "sch_RCO_09302011", sch_RCO, overwrite = TRUE)

## Schedule RCP
sch_RCP_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCP\ 09302011.txt", n_max = 1) %>% names()
sch_RCP <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCP\ 09302011.txt", skip = 2, col_names = sch_RCP_names)
## sch_RCP <- sch_RCP[,-dim(sch_RCP)[2]]
saveRDS(sch_RCP, "../data/sch_RCP_09302011.rds")
dbWriteTable(dbc, "sch_RCP_09302011", sch_RCP, overwrite = TRUE)

## Schedule RCQ_1_of_2
sch_RCQ_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCQ_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCQ_1_of_2_names)
## sch_RCQ_1_of_2 <- sch_RCQ_1_of_2[,-dim(sch_RCQ_1_of_2)[2]]
saveRDS(sch_RCQ_1_of_2, "../data/sch_RCQ_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCQ_1_of_2_09302011", sch_RCQ_1_of_2, overwrite = TRUE)

## Schedule RCQ_2_of_2
sch_RCQ_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCQ_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCQ_2_of_2_names)
## sch_RCQ_2_of_2 <- sch_RCQ_2_of_2[,-dim(sch_RCQ_2_of_2)[2]]
saveRDS(sch_RCQ_2_of_2, "../data/sch_RCQ_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCQ_2_of_2_09302011", sch_RCQ_2_of_2, overwrite = TRUE)

## Schedule RCR_1_of_2
sch_RCR_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCR_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCR_1_of_2_names)
## sch_RCR_1_of_2 <- sch_RCR_1_of_2[,-dim(sch_RCR_1_of_2)[2]]
saveRDS(sch_RCR_1_of_2, "../data/sch_RCR_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCR_1_of_2_09302011", sch_RCR_1_of_2, overwrite = TRUE)

## Schedule RCR_2_of_2
sch_RCR_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCR_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCR_2_of_2_names)
## sch_RCR_2_of_2 <- sch_RCR_2_of_2[,-dim(sch_RCR_2_of_2)[2]]
saveRDS(sch_RCR_2_of_2, "../data/sch_RCR_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCR_2_of_2_09302011", sch_RCR_2_of_2, overwrite = TRUE)

## Schedule RCS
sch_RCS_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 09302011.txt", n_max = 1) %>% names()
sch_RCS <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 09302011.txt", skip = 2, col_names = sch_RCS_names)
## sch_RCS <- sch_RCS[,-dim(sch_RCS)[2]]
saveRDS(sch_RCS, "../data/sch_RCS_09302011.rds")
dbWriteTable(dbc, "sch_RCS_09302011", sch_RCS, overwrite = TRUE)

## Schedule RCT_1_of_2
sch_RCT_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 09302011(1 of 2).txt", n_max = 1) %>% names()
sch_RCT_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 09302011(1 of 2).txt", skip = 2, col_names = sch_RCT_1_of_2_names)
## sch_RCT_1_of_2 <- sch_RCT_1_of_2[,-dim(sch_RCT_1_of_2)[2]]
saveRDS(sch_RCT_1_of_2, "../data/sch_RCT_1_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCT_1_of_2_09302011", sch_RCT_1_of_2, overwrite = TRUE)

## Schedule RCT_2_of_2
sch_RCT_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 09302011(2 of 2).txt", n_max = 1) %>% names()
sch_RCT_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 09302011(2 of 2).txt", skip = 2, col_names = sch_RCT_2_of_2_names)
## sch_RCT_2_of_2 <- sch_RCT_2_of_2[,-dim(sch_RCT_2_of_2)[2]]
saveRDS(sch_RCT_2_of_2, "../data/sch_RCT_2_of_2_09302011.rds")
dbWriteTable(dbc, "sch_RCT_2_of_2_09302011", sch_RCT_2_of_2, overwrite = TRUE)


## Schedule RCV
sch_RCV_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCV\ 09302011.txt", n_max = 1) %>% names()
sch_RCV <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCV\ 09302011.txt", skip = 2, col_names = sch_RCV_names)
## sch_RCV <- sch_RCV[,-dim(sch_RCV)[2]]
saveRDS(sch_RCV, "../data/sch_RCV_09302011.rds")
dbWriteTable(dbc, "sch_RCV_09302011", sch_RCV, overwrite = TRUE)


## Schedule RI
sch_RI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 09302011.txt", n_max = 1) %>% names()
sch_RI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 09302011.txt", skip = 2, col_names = sch_RI_names)
## sch_RI <- sch_RI[,-dim(sch_RI)[2]]
saveRDS(sch_RI, "../data/sch_RI_09302011.rds")
dbWriteTable(dbc, "sch_RI_09302011", sch_RI, overwrite = TRUE)


## Schedule RIA
sch_RIA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 09302011.txt", n_max = 1) %>% names()
sch_RIA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 09302011.txt", skip = 2, col_names = sch_RIA_names)
## sch_RIA <- sch_RIA[,-dim(sch_RIA)[2]]
saveRDS(sch_RIA, "../data/sch_RIA_09302011.rds")
dbWriteTable(dbc, "sch_RIA_09302011", sch_RIA, overwrite = TRUE)


## Schedule RIBI
sch_RIBI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 09302011.txt", n_max = 1) %>% names()
sch_RIBI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 09302011.txt", skip = 2, col_names = sch_RIBI_names)
## sch_RIBI <- sch_RIBI[,-dim(sch_RIBI)[2]]
saveRDS(sch_RIBI, "../data/sch_RIBI_09302011.rds")
dbWriteTable(dbc, "sch_RIBI_09302011", sch_RIBI, overwrite = TRUE)


## Schedule RIBII
sch_RIBII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 09302011.txt", n_max = 1) %>% names()
sch_RIBII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 09302011.txt", skip = 2, col_names = sch_RIBII_names)
## sch_RIBII <- sch_RIBII[,-dim(sch_RIBII)[2]]
saveRDS(sch_RIBII, "../data/sch_RIBII_09302011.rds")
dbWriteTable(dbc, "sch_RIBII_09302011", sch_RIBII, overwrite = TRUE)

## Schedule RID
sch_RID_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 09302011.txt", n_max = 1) %>% names()
sch_RID <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 09302011.txt", skip = 2, col_names = sch_RID_names)
## sch_RID <- sch_RID[,-dim(sch_RID)[2]]
saveRDS(sch_RID, "../data/sch_RID_09302011.rds")
dbWriteTable(dbc, "sch_RID_09302011", sch_RID, overwrite = TRUE)


## Schedule RIE
sch_RIE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 09302011.txt", n_max = 1) %>% names()
sch_RIE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 09302011.txt", skip = 2, col_names = sch_RIE_names)
## sch_RIE <- sch_RIE[,-dim(sch_RIE)[2]]
saveRDS(sch_RIE, "../data/sch_RIE_09302011.rds")
dbWriteTable(dbc, "sch_RIE_09302011", sch_RIE, overwrite = TRUE)
