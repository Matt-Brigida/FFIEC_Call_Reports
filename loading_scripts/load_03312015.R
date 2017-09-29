## 03312015

library(readr)
library(dplyr)
library(RSQLite)

## create database
dbc <- dbConnect(RSQLite::SQLite(), "../callReports")

## names
bulk_POR <- read_tsv("../FFIEC\ CDR\ Call\ Bulk\ POR\ 03312015.txt")
saveRDS(bulk_POR, "../data/bulk_POR_03312015.rds")
dbWriteTable(dbc, "bulk_POR_03312015", bulk_POR, overwrite = TRUE)

## Schedule CI
sch_CI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 03312015.txt", n_max = 1) %>% names()
sch_CI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 03312015.txt", skip = 2, col_names = sch_CI_names)
## sch_CI <- sch_CI[,-dim(sch_CI)[2]]
saveRDS(sch_CI, "../data/sch_CI_03312015.rds")
dbWriteTable(dbc, "sch_CI_03312015", sch_CI, overwrite = TRUE)


## Schedule ENT
sch_ENT_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 03312015.txt", n_max = 1) %>% names()
sch_ENT <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 03312015.txt", skip = 2, col_names = sch_ENT_names)
## sch_ENT <- sch_ENT[,-dim(sch_ENT)[2]]
saveRDS(sch_ENT, "../data/sch_ENT_03312015.rds")
dbWriteTable(dbc, "sch_ENT_03312015", sch_ENT, overwrite = TRUE)

## Schedule GI
sch_GI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 03312015.txt", n_max = 1) %>% names()
sch_GI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 03312015.txt", skip = 2, col_names = sch_GI_names)
## sch_GI <- sch_GI[,-dim(sch_GI)[2]]
saveRDS(sch_GI, "../data/sch_GI_03312015.rds")
dbWriteTable(dbc, "sch_GI_03312015", sch_GI, overwrite = TRUE)

## Schedule GL
sch_GL_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 03312015.txt", n_max = 1) %>% names()
sch_GL <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 03312015.txt", skip = 2, col_names = sch_GL_names)
## sch_GL <- sch_GL[,-dim(sch_GL)[2]]
saveRDS(sch_GL, "../data/sch_GL_03312015.rds")
dbWriteTable(dbc, "sch_GL_03312015", sch_GL, overwrite = TRUE)

## Schedule NARR
sch_NARR_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 03312015.txt", n_max = 1) %>% names()
sch_NARR <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 03312015.txt", skip = 2, col_names = sch_NARR_names)
## sch_NARR <- sch_NARR[,-dim(sch_NARR)[2]]
saveRDS(sch_NARR, "../data/sch_NARR_03312015.rds")
dbWriteTable(dbc, "sch_NARR_03312015", sch_NARR, overwrite = TRUE)

## Schedule RC
sch_RC_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 03312015.txt", n_max = 1) %>% names()
sch_RC <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 03312015.txt", skip = 2, col_names = sch_RC_names)
## sch_RC <- sch_RC[,-dim(sch_RC)[2]]
saveRDS(sch_RC, "../data/sch_RC_03312015.rds")
dbWriteTable(dbc, "sch_RC_03312015", sch_RC, overwrite = TRUE)

## Schedule RCA
sch_RCA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 03312015.txt", n_max = 1) %>% names()
sch_RCA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 03312015.txt", skip = 2, col_names = sch_RCA_names)
## sch_RCA <- sch_RCA[,-dim(sch_RCA)[2]]
saveRDS(sch_RCA, "../data/sch_RCA_03312015.rds")
dbWriteTable(dbc, "sch_RCA_03312015", sch_RCA, overwrite = TRUE)

## Schedule RCB_1_of_2
sch_RCB_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCB_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCB_1_of_2_names)
## sch_RCB_1_of_2 <- sch_RCB_1_of_2[,-dim(sch_RCB_1_of_2)[2]]
saveRDS(sch_RCB_1_of_2, "../data/sch_RCB_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCB_1_of_2_03312015", sch_RCB_1_of_2, overwrite = TRUE)

## Schedule RCB_2_of_2
sch_RCB_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCB_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCB_2_of_2_names)
## sch_RCB_2_of_2 <- sch_RCB_2_of_2[,-dim(sch_RCB_2_of_2)[2]]
saveRDS(sch_RCB_2_of_2, "../data/sch_RCB_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCB_2_of_2_03312015", sch_RCB_2_of_2, overwrite = TRUE)

## Schedule RCCI
sch_RCCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 03312015.txt", n_max = 1) %>% names()
sch_RCCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 03312015.txt", skip = 2, col_names = sch_RCCI_names)
## sch_RCCI <- sch_RCCI[,-dim(sch_RCCI)[2]]
saveRDS(sch_RCCI, "../data/sch_RCCI_03312015.rds")
dbWriteTable(dbc, "sch_RCCI_03312015", sch_RCCI, overwrite = TRUE)

## Schedule RCCII
sch_RCCII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 03312015.txt", n_max = 1) %>% names()
sch_RCCII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 03312015.txt", skip = 2, col_names = sch_RCCII_names)
## sch_RCCII <- sch_RCCII[,-dim(sch_RCCII)[2]]
saveRDS(sch_RCCII, "../data/sch_RCCII_03312015.rds")
dbWriteTable(dbc, "sch_RCCII_03312015", sch_RCCII, overwrite = TRUE)

## Schedule RCD
sch_RCD_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 03312015.txt", n_max = 1) %>% names()
sch_RCD <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 03312015.txt", skip = 2, col_names = sch_RCD_names)
## sch_RCD <- sch_RCD[,-dim(sch_RCD)[2]]
saveRDS(sch_RCD, "../data/sch_RCD_03312015.rds")
dbWriteTable(dbc, "sch_RCD_03312015", sch_RCD, overwrite = TRUE)

## Schedule RCE
sch_RCE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 03312015.txt", n_max = 1) %>% names()
sch_RCE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 03312015.txt", skip = 2, col_names = sch_RCE_names)
## sch_RCE <- sch_RCE[,-dim(sch_RCE)[2]]
saveRDS(sch_RCE, "../data/sch_RCE_03312015.rds")
dbWriteTable(dbc, "sch_RCE_03312015", sch_RCE, overwrite = TRUE)

## Schedule RCEI
sch_RCEI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 03312015.txt", n_max = 1) %>% names()
sch_RCEI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 03312015.txt", skip = 2, col_names = sch_RCEI_names)
## sch_RCEI <- sch_RCEI[,-dim(sch_RCEI)[2]]
saveRDS(sch_RCEI, "../data/sch_RCEI_03312015.rds")
dbWriteTable(dbc, "sch_RCEI_03312015", sch_RCEI, overwrite = TRUE)

## Schedule RCEII
sch_RCEII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 03312015.txt", n_max = 1) %>% names()
sch_RCEII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 03312015.txt", skip = 2, col_names = sch_RCEII_names)
## sch_RCEII <- sch_RCEII[,-dim(sch_RCEII)[2]]
saveRDS(sch_RCEII, "../data/sch_RCEII_03312015.rds")
dbWriteTable(dbc, "sch_RCEII_03312015", sch_RCEII, overwrite = TRUE)

## Schedule RCF
sch_RCF_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 03312015.txt", n_max = 1) %>% names()
sch_RCF <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 03312015.txt", skip = 2, col_names = sch_RCF_names)
## sch_RCF <- sch_RCF[,-dim(sch_RCF)[2]]
saveRDS(sch_RCF, "../data/sch_RCF_03312015.rds")
dbWriteTable(dbc, "sch_RCF_03312015", sch_RCF, overwrite = TRUE)

## Schedule RCG
sch_RCG_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 03312015.txt", n_max = 1) %>% names()
sch_RCG <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 03312015.txt", skip = 2, col_names = sch_RCG_names)
## sch_RCG <- sch_RCG[,-dim(sch_RCG)[2]]
saveRDS(sch_RCG, "../data/sch_RCG_03312015.rds")
dbWriteTable(dbc, "sch_RCG_03312015", sch_RCG, overwrite = TRUE)

## Schedule RCH
sch_RCH_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 03312015.txt", n_max = 1) %>% names()
sch_RCH <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 03312015.txt", skip = 2, col_names = sch_RCH_names)
## sch_RCH <- sch_RCH[,-dim(sch_RCH)[2]]
saveRDS(sch_RCH, "../data/sch_RCH_03312015.rds")
dbWriteTable(dbc, "sch_RCH_03312015", sch_RCH, overwrite = TRUE)

## Schedule RCI
sch_RCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 03312015.txt", n_max = 1) %>% names()
sch_RCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 03312015.txt", skip = 2, col_names = sch_RCI_names)
## sch_RCI <- sch_RCI[,-dim(sch_RCI)[2]]
saveRDS(sch_RCI, "../data/sch_RCI_03312015.rds")
dbWriteTable(dbc, "sch_RCI_03312015", sch_RCI, overwrite = TRUE)

## Schedule RCK
sch_RCK_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 03312015.txt", n_max = 1) %>% names()
sch_RCK <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 03312015.txt", skip = 2, col_names = sch_RCK_names)
## sch_RCK <- sch_RCK[,-dim(sch_RCK)[2]]
saveRDS(sch_RCK, "../data/sch_RCK_03312015.rds")
dbWriteTable(dbc, "sch_RCK_03312015", sch_RCK, overwrite = TRUE)

## Schedule RCL_1_of_2
sch_RCL_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCL_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCL_1_of_2_names)
## sch_RCL_1_of_2 <- sch_RCL_1_of_2[,-dim(sch_RCL_1_of_2)[2]]
saveRDS(sch_RCL_1_of_2, "../data/sch_RCL_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCL_1_of_2_03312015", sch_RCL_1_of_2, overwrite = TRUE)

## Schedule RCL_2_of_2
sch_RCL_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCL_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCL_2_of_2_names)
## sch_RCL_2_of_2 <- sch_RCL_2_of_2[,-dim(sch_RCL_2_of_2)[2]]
saveRDS(sch_RCL_2_of_2, "../data/sch_RCL_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCL_2_of_2_03312015", sch_RCL_2_of_2, overwrite = TRUE)

## Schedule RCM
sch_RCM_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 03312015.txt", n_max = 1) %>% names()
sch_RCM <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 03312015.txt", skip = 2, col_names = sch_RCM_names)
## sch_RCM <- sch_RCM[,-dim(sch_RCM)[2]]
saveRDS(sch_RCM, "../data/sch_RCM_03312015.rds")
dbWriteTable(dbc, "sch_RCM_03312015", sch_RCM, overwrite = TRUE)

## Schedule RCN_1_of_2
sch_RCN_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCN_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCN_1_of_2_names)
## sch_RCN_1_of_2 <- sch_RCN_1_of_2[,-dim(sch_RCN_1_of_2)[2]]
saveRDS(sch_RCN_1_of_2, "../data/sch_RCN_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCN_1_of_2_03312015", sch_RCN_1_of_2, overwrite = TRUE)

## Schedule RCN_2_of_2
sch_RCN_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCN_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCN_2_of_2_names)
## sch_RCN_2_of_2 <- sch_RCN_2_of_2[,-dim(sch_RCN_2_of_2)[2]]
saveRDS(sch_RCN_2_of_2, "../data/sch_RCN_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCN_2_of_2_03312015", sch_RCN_2_of_2, overwrite = TRUE)

## Schedule RCO_1_of_2
sch_RCO_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCO_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCO_1_of_2_names)
## sch_RCO_1_of_2 <- sch_RCO_1_of_2[,-dim(sch_RCO_1_of_2)[2]]
saveRDS(sch_RCO_1_of_2, "../data/sch_RCO_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCO_1_of_2_03312015", sch_RCO_1_of_2, overwrite = TRUE)

## Schedule RCO_2_of_2
sch_RCO_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCO_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCO_2_of_2_names)
## sch_RCO_2_of_2 <- sch_RCO_2_of_2[,-dim(sch_RCO_2_of_2)[2]]
saveRDS(sch_RCO_2_of_2, "../data/sch_RCO_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCO_2_of_2_03312015", sch_RCO_2_of_2, overwrite = TRUE)

## Schedule RCP
sch_RCP_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCP\ 03312015.txt", n_max = 1) %>% names()
sch_RCP <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCP\ 03312015.txt", skip = 2, col_names = sch_RCP_names)
## sch_RCP <- sch_RCP[,-dim(sch_RCP)[2]]
saveRDS(sch_RCP, "../data/sch_RCP_03312015.rds")
dbWriteTable(dbc, "sch_RCP_03312015", sch_RCP, overwrite = TRUE)

## Schedule RCQ_1_of_2
sch_RCQ_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCQ_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCQ_1_of_2_names)
## sch_RCQ_1_of_2 <- sch_RCQ_1_of_2[,-dim(sch_RCQ_1_of_2)[2]]
saveRDS(sch_RCQ_1_of_2, "../data/sch_RCQ_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCQ_1_of_2_03312015", sch_RCQ_1_of_2, overwrite = TRUE)

## Schedule RCQ_2_of_2
sch_RCQ_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCQ_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCQ\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCQ_2_of_2_names)
## sch_RCQ_2_of_2 <- sch_RCQ_2_of_2[,-dim(sch_RCQ_2_of_2)[2]]
saveRDS(sch_RCQ_2_of_2, "../data/sch_RCQ_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCQ_2_of_2_03312015", sch_RCQ_2_of_2, overwrite = TRUE)

## Schedule RCRI
sch_RCRI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRI\ 03312015.txt", n_max = 1) %>% names()
sch_RCRI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRI\ 03312015.txt", skip = 2, col_names = sch_RCRI_names)
## sch_RCRI <- sch_RCRI[,-dim(sch_RCRI)[2]]
saveRDS(sch_RCRI, "../data/sch_RCRI_03312015.rds")
dbWriteTable(dbc, "sch_RCRI_03312015", sch_RCRI, overwrite = TRUE)

## Schedule RCRII_1_of_3
sch_RCRII_1_of_3_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(1 of 3).txt", n_max = 1) %>% names()
sch_RCRII_1_of_3 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(1 of 3).txt", skip = 2, col_names = sch_RCRII_1_of_3_names)
## sch_RCRII_1_of_3 <- sch_RCRII_1_of_3[,-dim(sch_RCRII_1_of_3)[2]]
saveRDS(sch_RCRII_1_of_3, "../data/sch_RCRII_1_of_3_03312015.rds")
dbWriteTable(dbc, "sch_RCRII_1_of_3_03312015", sch_RCRII_1_of_3, overwrite = TRUE)

## Schedule RCRII_2_of_3
sch_RCRII_2_of_3_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(2 of 3).txt", n_max = 1) %>% names()
sch_RCRII_2_of_3 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(2 of 3).txt", skip = 2, col_names = sch_RCRII_2_of_3_names)
## sch_RCRII_2_of_3 <- sch_RCRII_2_of_3[,-dim(sch_RCRII_2_of_3)[2]]
saveRDS(sch_RCRII_2_of_3, "../data/sch_RCRII_2_of_3_03312015.rds")
dbWriteTable(dbc, "sch_RCRII_2_of_3_03312015", sch_RCRII_2_of_3, overwrite = TRUE)

## Schedule RCRII_3_of_3
sch_RCRII_3_of_3_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(3 of 3).txt", n_max = 1) %>% names()
sch_RCRII_3_of_3 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCRII\ 03312015(3 of 3).txt", skip = 2, col_names = sch_RCRII_3_of_3_names)
## sch_RCRII_3_of_3 <- sch_RCRII_3_of_3[,-dim(sch_RCRII_3_of_3)[2]]
saveRDS(sch_RCRII_3_of_3, "../data/sch_RCRII_3_of_3_03312015.rds")
dbWriteTable(dbc, "sch_RCRII_3_of_3_03312015", sch_RCRII_3_of_3, overwrite = TRUE)

## Schedule RCS
sch_RCS_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 03312015.txt", n_max = 1) %>% names()
sch_RCS <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 03312015.txt", skip = 2, col_names = sch_RCS_names)
## sch_RCS <- sch_RCS[,-dim(sch_RCS)[2]]
saveRDS(sch_RCS, "../data/sch_RCS_03312015.rds")
dbWriteTable(dbc, "sch_RCS_03312015", sch_RCS, overwrite = TRUE)

## Schedule RCT_1_of_2
sch_RCT_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312015(1 of 2).txt", n_max = 1) %>% names()
sch_RCT_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312015(1 of 2).txt", skip = 2, col_names = sch_RCT_1_of_2_names)
## sch_RCT_1_of_2 <- sch_RCT_1_of_2[,-dim(sch_RCT_1_of_2)[2]]
saveRDS(sch_RCT_1_of_2, "../data/sch_RCT_1_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCT_1_of_2_03312015", sch_RCT_1_of_2, overwrite = TRUE)

## Schedule RCT_2_of_2
sch_RCT_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312015(2 of 2).txt", n_max = 1) %>% names()
sch_RCT_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312015(2 of 2).txt", skip = 2, col_names = sch_RCT_2_of_2_names)
## sch_RCT_2_of_2 <- sch_RCT_2_of_2[,-dim(sch_RCT_2_of_2)[2]]
saveRDS(sch_RCT_2_of_2, "../data/sch_RCT_2_of_2_03312015.rds")
dbWriteTable(dbc, "sch_RCT_2_of_2_03312015", sch_RCT_2_of_2, overwrite = TRUE)


## Schedule RCV
sch_RCV_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCV\ 03312015.txt", n_max = 1) %>% names()
sch_RCV <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCV\ 03312015.txt", skip = 2, col_names = sch_RCV_names)
## sch_RCV <- sch_RCV[,-dim(sch_RCV)[2]]
saveRDS(sch_RCV, "../data/sch_RCV_03312015.rds")
dbWriteTable(dbc, "sch_RCV_03312015", sch_RCV, overwrite = TRUE)


## Schedule RI
sch_RI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 03312015.txt", n_max = 1) %>% names()
sch_RI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 03312015.txt", skip = 2, col_names = sch_RI_names)
## sch_RI <- sch_RI[,-dim(sch_RI)[2]]
saveRDS(sch_RI, "../data/sch_RI_03312015.rds")
dbWriteTable(dbc, "sch_RI_03312015", sch_RI, overwrite = TRUE)


## Schedule RIA
sch_RIA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 03312015.txt", n_max = 1) %>% names()
sch_RIA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 03312015.txt", skip = 2, col_names = sch_RIA_names)
## sch_RIA <- sch_RIA[,-dim(sch_RIA)[2]]
saveRDS(sch_RIA, "../data/sch_RIA_03312015.rds")
dbWriteTable(dbc, "sch_RIA_03312015", sch_RIA, overwrite = TRUE)


## Schedule RIBI
sch_RIBI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 03312015.txt", n_max = 1) %>% names()
sch_RIBI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 03312015.txt", skip = 2, col_names = sch_RIBI_names)
## sch_RIBI <- sch_RIBI[,-dim(sch_RIBI)[2]]
saveRDS(sch_RIBI, "../data/sch_RIBI_03312015.rds")
dbWriteTable(dbc, "sch_RIBI_03312015", sch_RIBI, overwrite = TRUE)


## Schedule RIBII
sch_RIBII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 03312015.txt", n_max = 1) %>% names()
sch_RIBII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 03312015.txt", skip = 2, col_names = sch_RIBII_names)
## sch_RIBII <- sch_RIBII[,-dim(sch_RIBII)[2]]
saveRDS(sch_RIBII, "../data/sch_RIBII_03312015.rds")
dbWriteTable(dbc, "sch_RIBII_03312015", sch_RIBII, overwrite = TRUE)


## Schedule RIC
sch_RIC_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIC\ 03312015.txt", n_max = 1) %>% names()
sch_RIC <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIC\ 03312015.txt", skip = 2, col_names = sch_RIC_names)
## sch_RIC <- sch_RIC[,-dim(sch_RIC)[2]]
saveRDS(sch_RIC, "../data/sch_RIC_03312015.rds")
dbWriteTable(dbc, "sch_RIC_03312015", sch_RIC, overwrite = TRUE)


## Schedule RID
sch_RID_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 03312015.txt", n_max = 1) %>% names()
sch_RID <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 03312015.txt", skip = 2, col_names = sch_RID_names)
## sch_RID <- sch_RID[,-dim(sch_RID)[2]]
saveRDS(sch_RID, "../data/sch_RID_03312015.rds")
dbWriteTable(dbc, "sch_RID_03312015", sch_RID, overwrite = TRUE)


## Schedule RIE
sch_RIE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 03312015.txt", n_max = 1) %>% names()
sch_RIE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 03312015.txt", skip = 2, col_names = sch_RIE_names)
## sch_RIE <- sch_RIE[,-dim(sch_RIE)[2]]
saveRDS(sch_RIE, "../data/sch_RIE_03312015.rds")
dbWriteTable(dbc, "sch_RIE_03312015", sch_RIE, overwrite = TRUE)
