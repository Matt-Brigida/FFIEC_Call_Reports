## 03312006

library(readr)
library(dplyr)
library(RSQLite)

## create database
dbc <- dbConnect(RSQLite::SQLite(), "../callReports")

## names
bulk_POR <- read_tsv("../FFIEC\ CDR\ Call\ Bulk\ POR\ 03312006.txt")
saveRDS(bulk_POR, "../data/bulk_POR_03312006.rds")
dbWriteTable(dbc, "bulk_POR_03312006", bulk_POR, overwrite = TRUE)

## Schedule CI
sch_CI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 03312006.txt", n_max = 1) %>% names()
sch_CI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ CI\ 03312006.txt", skip = 2, col_names = sch_CI_names)
## sch_CI <- sch_CI[,-dim(sch_CI)[2]]
saveRDS(sch_CI, "../data/sch_CI_03312006.rds")
dbWriteTable(dbc, "sch_CI_03312006", sch_CI, overwrite = TRUE)


## Schedule ENT
sch_ENT_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 03312006.txt", n_max = 1) %>% names()
sch_ENT <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ ENT\ 03312006.txt", skip = 2, col_names = sch_ENT_names)
## sch_ENT <- sch_ENT[,-dim(sch_ENT)[2]]
saveRDS(sch_ENT, "../data/sch_ENT_03312006.rds")
dbWriteTable(dbc, "sch_ENT_03312006", sch_ENT, overwrite = TRUE)

## Schedule GI
sch_GI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 03312006.txt", n_max = 1) %>% names()
sch_GI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GI\ 03312006.txt", skip = 2, col_names = sch_GI_names)
## sch_GI <- sch_GI[,-dim(sch_GI)[2]]
saveRDS(sch_GI, "../data/sch_GI_03312006.rds")
dbWriteTable(dbc, "sch_GI_03312006", sch_GI, overwrite = TRUE)

## Schedule GL
sch_GL_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 03312006.txt", n_max = 1) %>% names()
sch_GL <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ GL\ 03312006.txt", skip = 2, col_names = sch_GL_names)
## sch_GL <- sch_GL[,-dim(sch_GL)[2]]
saveRDS(sch_GL, "../data/sch_GL_03312006.rds")
dbWriteTable(dbc, "sch_GL_03312006", sch_GL, overwrite = TRUE)

## Schedule LEO
sch_LEO_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ LEO\ 03312006.txt", n_max = 1) %>% names()
sch_LEO <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ LEO\ 03312006.txt", skip = 2, col_names = sch_LEO_names)
## sch_LEO <- sch_LEO[,-dim(sch_LEO)[2]]
saveRDS(sch_LEO, "../data/sch_LEO_03312006.rds")
dbWriteTable(dbc, "sch_LEO_03312006", sch_LEO, overwrite = TRUE)

## Schedule NARR
sch_NARR_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 03312006.txt", n_max = 1) %>% names()
sch_NARR <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ NARR\ 03312006.txt", skip = 2, col_names = sch_NARR_names)
## sch_NARR <- sch_NARR[,-dim(sch_NARR)[2]]
saveRDS(sch_NARR, "../data/sch_NARR_03312006.rds")
dbWriteTable(dbc, "sch_NARR_03312006", sch_NARR, overwrite = TRUE)

## Schedule RC
sch_RC_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 03312006.txt", n_max = 1) %>% names()
sch_RC <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RC\ 03312006.txt", skip = 2, col_names = sch_RC_names)
## sch_RC <- sch_RC[,-dim(sch_RC)[2]]
saveRDS(sch_RC, "../data/sch_RC_03312006.rds")
dbWriteTable(dbc, "sch_RC_03312006", sch_RC, overwrite = TRUE)

## Schedule RCA
sch_RCA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 03312006.txt", n_max = 1) %>% names()
sch_RCA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCA\ 03312006.txt", skip = 2, col_names = sch_RCA_names)
## sch_RCA <- sch_RCA[,-dim(sch_RCA)[2]]
saveRDS(sch_RCA, "../data/sch_RCA_03312006.rds")
dbWriteTable(dbc, "sch_RCA_03312006", sch_RCA, overwrite = TRUE)

## Schedule RCB
sch_RCB_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312006.txt", n_max = 1) %>% names()
sch_RCB <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCB\ 03312006.txt", skip = 2, col_names = sch_RCB_names)
## sch_RCB <- sch_RCB[,-dim(sch_RCB)[2]]
saveRDS(sch_RCB, "../data/sch_RCB_03312006.rds")
dbWriteTable(dbc, "sch_RCB_03312006", sch_RCB, overwrite = TRUE)

## Schedule RCCI
sch_RCCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 03312006.txt", n_max = 1) %>% names()
sch_RCCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCI\ 03312006.txt", skip = 2, col_names = sch_RCCI_names)
## sch_RCCI <- sch_RCCI[,-dim(sch_RCCI)[2]]
saveRDS(sch_RCCI, "../data/sch_RCCI_03312006.rds")
dbWriteTable(dbc, "sch_RCCI_03312006", sch_RCCI, overwrite = TRUE)

## Schedule RCCII
sch_RCCII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 03312006.txt", n_max = 1) %>% names()
sch_RCCII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCCII\ 03312006.txt", skip = 2, col_names = sch_RCCII_names)
## sch_RCCII <- sch_RCCII[,-dim(sch_RCCII)[2]]
saveRDS(sch_RCCII, "../data/sch_RCCII_03312006.rds")
dbWriteTable(dbc, "sch_RCCII_03312006", sch_RCCII, overwrite = TRUE)

## Schedule RCD
sch_RCD_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 03312006.txt", n_max = 1) %>% names()
sch_RCD <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCD\ 03312006.txt", skip = 2, col_names = sch_RCD_names)
## sch_RCD <- sch_RCD[,-dim(sch_RCD)[2]]
saveRDS(sch_RCD, "../data/sch_RCD_03312006.rds")
dbWriteTable(dbc, "sch_RCD_03312006", sch_RCD, overwrite = TRUE)

## Schedule RCE
sch_RCE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 03312006.txt", n_max = 1) %>% names()
sch_RCE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCE\ 03312006.txt", skip = 2, col_names = sch_RCE_names)
## sch_RCE <- sch_RCE[,-dim(sch_RCE)[2]]
saveRDS(sch_RCE, "../data/sch_RCE_03312006.rds")
dbWriteTable(dbc, "sch_RCE_03312006", sch_RCE, overwrite = TRUE)

## Schedule RCEI
sch_RCEI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 03312006.txt", n_max = 1) %>% names()
sch_RCEI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEI\ 03312006.txt", skip = 2, col_names = sch_RCEI_names)
## sch_RCEI <- sch_RCEI[,-dim(sch_RCEI)[2]]
saveRDS(sch_RCEI, "../data/sch_RCEI_03312006.rds")
dbWriteTable(dbc, "sch_RCEI_03312006", sch_RCEI, overwrite = TRUE)

## Schedule RCEII
sch_RCEII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 03312006.txt", n_max = 1) %>% names()
sch_RCEII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCEII\ 03312006.txt", skip = 2, col_names = sch_RCEII_names)
## sch_RCEII <- sch_RCEII[,-dim(sch_RCEII)[2]]
saveRDS(sch_RCEII, "../data/sch_RCEII_03312006.rds")
dbWriteTable(dbc, "sch_RCEII_03312006", sch_RCEII, overwrite = TRUE)

## Schedule RCF
sch_RCF_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 03312006.txt", n_max = 1) %>% names()
sch_RCF <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCF\ 03312006.txt", skip = 2, col_names = sch_RCF_names)
## sch_RCF <- sch_RCF[,-dim(sch_RCF)[2]]
saveRDS(sch_RCF, "../data/sch_RCF_03312006.rds")
dbWriteTable(dbc, "sch_RCF_03312006", sch_RCF, overwrite = TRUE)

## Schedule RCG
sch_RCG_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 03312006.txt", n_max = 1) %>% names()
sch_RCG <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCG\ 03312006.txt", skip = 2, col_names = sch_RCG_names)
## sch_RCG <- sch_RCG[,-dim(sch_RCG)[2]]
saveRDS(sch_RCG, "../data/sch_RCG_03312006.rds")
dbWriteTable(dbc, "sch_RCG_03312006", sch_RCG, overwrite = TRUE)

## Schedule RCH
sch_RCH_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 03312006.txt", n_max = 1) %>% names()
sch_RCH <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCH\ 03312006.txt", skip = 2, col_names = sch_RCH_names)
## sch_RCH <- sch_RCH[,-dim(sch_RCH)[2]]
saveRDS(sch_RCH, "../data/sch_RCH_03312006.rds")
dbWriteTable(dbc, "sch_RCH_03312006", sch_RCH, overwrite = TRUE)

## Schedule RCI
sch_RCI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 03312006.txt", n_max = 1) %>% names()
sch_RCI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCI\ 03312006.txt", skip = 2, col_names = sch_RCI_names)
## sch_RCI <- sch_RCI[,-dim(sch_RCI)[2]]
saveRDS(sch_RCI, "../data/sch_RCI_03312006.rds")
dbWriteTable(dbc, "sch_RCI_03312006", sch_RCI, overwrite = TRUE)

## Schedule RCK
sch_RCK_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 03312006.txt", n_max = 1) %>% names()
sch_RCK <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCK\ 03312006.txt", skip = 2, col_names = sch_RCK_names)
## sch_RCK <- sch_RCK[,-dim(sch_RCK)[2]]
saveRDS(sch_RCK, "../data/sch_RCK_03312006.rds")
dbWriteTable(dbc, "sch_RCK_03312006", sch_RCK, overwrite = TRUE)

## Schedule RCL
sch_RCL_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312006.txt", n_max = 1) %>% names()
sch_RCL <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCL\ 03312006.txt", skip = 2, col_names = sch_RCL_names)
## sch_RCL <- sch_RCL[,-dim(sch_RCL)[2]]
saveRDS(sch_RCL, "../data/sch_RCL_03312006.rds")
dbWriteTable(dbc, "sch_RCL_03312006", sch_RCL, overwrite = TRUE)

## Schedule RCM
sch_RCM_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 03312006.txt", n_max = 1) %>% names()
sch_RCM <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCM\ 03312006.txt", skip = 2, col_names = sch_RCM_names)
## sch_RCM <- sch_RCM[,-dim(sch_RCM)[2]]
saveRDS(sch_RCM, "../data/sch_RCM_03312006.rds")
dbWriteTable(dbc, "sch_RCM_03312006", sch_RCM, overwrite = TRUE)

## Schedule RCN
sch_RCN_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312006.txt", n_max = 1) %>% names()
sch_RCN <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCN\ 03312006.txt", skip = 2, col_names = sch_RCN_names)
## sch_RCN <- sch_RCN[,-dim(sch_RCN)[2]]
saveRDS(sch_RCN, "../data/sch_RCN_03312006.rds")
dbWriteTable(dbc, "sch_RCN_03312006", sch_RCN, overwrite = TRUE)

## Schedule RCO
sch_RCO_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312006.txt", n_max = 1) %>% names()
sch_RCO <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCO\ 03312006.txt", skip = 2, col_names = sch_RCO_names)
## sch_RCO <- sch_RCO[,-dim(sch_RCO)[2]]
saveRDS(sch_RCO, "../data/sch_RCO_03312006.rds")
dbWriteTable(dbc, "sch_RCO_03312006", sch_RCO, overwrite = TRUE)

## Schedule RCR_1_of_2
sch_RCR_1_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 03312006(1 of 2).txt", n_max = 1) %>% names()
sch_RCR_1_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 03312006(1 of 2).txt", skip = 2, col_names = sch_RCR_1_of_2_names)
## sch_RCR_1_of_2 <- sch_RCR_1_of_2[,-dim(sch_RCR_1_of_2)[2]]
saveRDS(sch_RCR_1_of_2, "../data/sch_RCR_1_of_2_03312006.rds")
dbWriteTable(dbc, "sch_RCR_1_of_2_03312006", sch_RCR_1_of_2, overwrite = TRUE)

## Schedule RCR_2_of_2
sch_RCR_2_of_2_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 03312006(2 of 2).txt", n_max = 1) %>% names()
sch_RCR_2_of_2 <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCR\ 03312006(2 of 2).txt", skip = 2, col_names = sch_RCR_2_of_2_names)
## sch_RCR_2_of_2 <- sch_RCR_2_of_2[,-dim(sch_RCR_2_of_2)[2]]
saveRDS(sch_RCR_2_of_2, "../data/sch_RCR_2_of_2_03312006.rds")
dbWriteTable(dbc, "sch_RCR_2_of_2_03312006", sch_RCR_2_of_2, overwrite = TRUE)

## Schedule RCS
sch_RCS_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 03312006.txt", n_max = 1) %>% names()
sch_RCS <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCS\ 03312006.txt", skip = 2, col_names = sch_RCS_names)
## sch_RCS <- sch_RCS[,-dim(sch_RCS)[2]]
saveRDS(sch_RCS, "../data/sch_RCS_03312006.rds")
dbWriteTable(dbc, "sch_RCS_03312006", sch_RCS, overwrite = TRUE)

## Schedule RCT
sch_RCT_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312006.txt", n_max = 1) %>% names()
sch_RCT <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RCT\ 03312006.txt", skip = 2, col_names = sch_RCT_names)
## sch_RCT <- sch_RCT[,-dim(sch_RCT)[2]]
saveRDS(sch_RCT, "../data/sch_RCT_03312006.rds")
dbWriteTable(dbc, "sch_RCT_03312006", sch_RCT, overwrite = TRUE)

## Schedule RI
sch_RI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 03312006.txt", n_max = 1) %>% names()
sch_RI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RI\ 03312006.txt", skip = 2, col_names = sch_RI_names)
## sch_RI <- sch_RI[,-dim(sch_RI)[2]]
saveRDS(sch_RI, "../data/sch_RI_03312006.rds")
dbWriteTable(dbc, "sch_RI_03312006", sch_RI, overwrite = TRUE)


## Schedule RIA
sch_RIA_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 03312006.txt", n_max = 1) %>% names()
sch_RIA <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIA\ 03312006.txt", skip = 2, col_names = sch_RIA_names)
## sch_RIA <- sch_RIA[,-dim(sch_RIA)[2]]
saveRDS(sch_RIA, "../data/sch_RIA_03312006.rds")
dbWriteTable(dbc, "sch_RIA_03312006", sch_RIA, overwrite = TRUE)


## Schedule RIBI
sch_RIBI_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 03312006.txt", n_max = 1) %>% names()
sch_RIBI <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBI\ 03312006.txt", skip = 2, col_names = sch_RIBI_names)
## sch_RIBI <- sch_RIBI[,-dim(sch_RIBI)[2]]
saveRDS(sch_RIBI, "../data/sch_RIBI_03312006.rds")
dbWriteTable(dbc, "sch_RIBI_03312006", sch_RIBI, overwrite = TRUE)


## Schedule RIBII
sch_RIBII_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 03312006.txt", n_max = 1) %>% names()
sch_RIBII <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIBII\ 03312006.txt", skip = 2, col_names = sch_RIBII_names)
## sch_RIBII <- sch_RIBII[,-dim(sch_RIBII)[2]]
saveRDS(sch_RIBII, "../data/sch_RIBII_03312006.rds")
dbWriteTable(dbc, "sch_RIBII_03312006", sch_RIBII, overwrite = TRUE)

## Schedule RID
sch_RID_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 03312006.txt", n_max = 1) %>% names()
sch_RID <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RID\ 03312006.txt", skip = 2, col_names = sch_RID_names)
## sch_RID <- sch_RID[,-dim(sch_RID)[2]]
saveRDS(sch_RID, "../data/sch_RID_03312006.rds")
dbWriteTable(dbc, "sch_RID_03312006", sch_RID, overwrite = TRUE)


## Schedule RIE
sch_RIE_names <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 03312006.txt", n_max = 1) %>% names()
sch_RIE <- read_tsv("../FFIEC\ CDR\ Call\ Schedule\ RIE\ 03312006.txt", skip = 2, col_names = sch_RIE_names)
## sch_RIE <- sch_RIE[,-dim(sch_RIE)[2]]
saveRDS(sch_RIE, "../data/sch_RIE_03312006.rds")
dbWriteTable(dbc, "sch_RIE_03312006", sch_RIE, overwrite = TRUE)
