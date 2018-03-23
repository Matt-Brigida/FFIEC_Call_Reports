## reads from tmp/ dir
## 12312017

library(readr)
library(dplyr)
library(RSQLite)

## create database
dbc <- dbConnect(RSQLite::SQLite(), "callReports")

## names
bulk_POR <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Bulk\ POR\ 12312017.txt")
saveRDS(bulk_POR, "../data/12312017/bulk_POR_12312017.rds")
dbWriteTable(dbc, "bulk_POR_12312017", bulk_POR, overwrite = TRUE)

## Schedule CI
sch_CI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ CI\ 12312017.txt", n_max = 1) %>% names()
sch_CI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ CI\ 12312017.txt", skip = 2, col_names = sch_CI_names)
saveRDS(sch_CI, "../data/12312017/sch_CI_12312017.rds")
dbWriteTable(dbc, "sch_CI_12312017", sch_CI, overwrite = TRUE)


## Schedule ENT
sch_ENT_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ ENT\ 12312017.txt", n_max = 1) %>% names()
sch_ENT <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ ENT\ 12312017.txt", skip = 2, col_names = sch_ENT_names)
saveRDS(sch_ENT, "../data/12312017/sch_ENT_12312017.rds")
dbWriteTable(dbc, "sch_ENT_12312017", sch_ENT, overwrite = TRUE)

## Schedule GI
sch_GI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ GI\ 12312017.txt", n_max = 1) %>% names()
sch_GI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ GI\ 12312017.txt", skip = 2, col_names = sch_GI_names)
saveRDS(sch_GI, "../data/12312017/sch_GI_12312017.rds")
dbWriteTable(dbc, "sch_GI_12312017", sch_GI, overwrite = TRUE)

## Schedule GL
sch_GL_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ GL\ 12312017.txt", n_max = 1) %>% names()
sch_GL <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ GL\ 12312017.txt", skip = 2, col_names = sch_GL_names)
saveRDS(sch_GL, "../data/12312017/sch_GL_12312017.rds")
dbWriteTable(dbc, "sch_GL_12312017", sch_GL, overwrite = TRUE)

## Schedule NARR
sch_NARR_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ NARR\ 12312017.txt", n_max = 1) %>% names()
sch_NARR <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ NARR\ 12312017.txt", skip = 2, col_names = sch_NARR_names)
saveRDS(sch_NARR, "../data/12312017/sch_NARR_12312017.rds")
dbWriteTable(dbc, "sch_NARR_12312017", sch_NARR, overwrite = TRUE)

## Schedule RC
sch_RC_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RC\ 12312017.txt", n_max = 1) %>% names()
sch_RC <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RC\ 12312017.txt", skip = 2, col_names = sch_RC_names)
saveRDS(sch_RC, "../data/12312017/sch_RC_12312017.rds")
dbWriteTable(dbc, "sch_RC_12312017", sch_RC, overwrite = TRUE)

## Schedule RCA
sch_RCA_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCA\ 12312017.txt", n_max = 1) %>% names()
sch_RCA <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCA\ 12312017.txt", skip = 2, col_names = sch_RCA_names)
saveRDS(sch_RCA, "../data/12312017/sch_RCA_12312017.rds")
dbWriteTable(dbc, "sch_RCA_12312017", sch_RCA, overwrite = TRUE)

## Schedule RCB_1_of_2
sch_RCB_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCB\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCB_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCB\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCB_1_of_2_names)
saveRDS(sch_RCB_1_of_2, "../data/12312017/sch_RCB_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCB_1_of_2_12312017", sch_RCB_1_of_2, overwrite = TRUE)

## Schedule RCB_2_of_2
sch_RCB_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCB\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCB_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCB\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCB_2_of_2_names)
saveRDS(sch_RCB_2_of_2, "../data/12312017/sch_RCB_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCB_2_of_2_12312017", sch_RCB_2_of_2, overwrite = TRUE)

## Schedule RCCI
sch_RCCI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCCI\ 12312017.txt", n_max = 1) %>% names()
sch_RCCI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCCI\ 12312017.txt", skip = 2, col_names = sch_RCCI_names)
saveRDS(sch_RCCI, "../data/12312017/sch_RCCI_12312017.rds")
dbWriteTable(dbc, "sch_RCCI_12312017", sch_RCCI, overwrite = TRUE)

## Schedule RCCII
sch_RCCII_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCCII\ 12312017.txt", n_max = 1) %>% names()
sch_RCCII <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCCII\ 12312017.txt", skip = 2, col_names = sch_RCCII_names)
saveRDS(sch_RCCII, "../data/12312017/sch_RCCII_12312017.rds")
dbWriteTable(dbc, "sch_RCCII_12312017", sch_RCCII, overwrite = TRUE)

## Schedule RCD
sch_RCD_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCD\ 12312017.txt", n_max = 1) %>% names()
sch_RCD <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCD\ 12312017.txt", skip = 2, col_names = sch_RCD_names)
saveRDS(sch_RCD, "../data/12312017/sch_RCD_12312017.rds")
dbWriteTable(dbc, "sch_RCD_12312017", sch_RCD, overwrite = TRUE)

## Schedule RCE
sch_RCE_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCE\ 12312017.txt", n_max = 1) %>% names()
sch_RCE <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCE\ 12312017.txt", skip = 2, col_names = sch_RCE_names)
saveRDS(sch_RCE, "../data/12312017/sch_RCE_12312017.rds")
dbWriteTable(dbc, "sch_RCE_12312017", sch_RCE, overwrite = TRUE)

## Schedule RCEI
sch_RCEI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCEI\ 12312017.txt", n_max = 1) %>% names()
sch_RCEI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCEI\ 12312017.txt", skip = 2, col_names = sch_RCEI_names)
saveRDS(sch_RCEI, "../data/12312017/sch_RCEI_12312017.rds")
dbWriteTable(dbc, "sch_RCEI_12312017", sch_RCEI, overwrite = TRUE)

## Schedule RCEII
sch_RCEII_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCEII\ 12312017.txt", n_max = 1) %>% names()
sch_RCEII <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCEII\ 12312017.txt", skip = 2, col_names = sch_RCEII_names)
saveRDS(sch_RCEII, "../data/12312017/sch_RCEII_12312017.rds")
dbWriteTable(dbc, "sch_RCEII_12312017", sch_RCEII, overwrite = TRUE)

## Schedule RCF
sch_RCF_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCF\ 12312017.txt", n_max = 1) %>% names()
sch_RCF <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCF\ 12312017.txt", skip = 2, col_names = sch_RCF_names)
saveRDS(sch_RCF, "../data/12312017/sch_RCF_12312017.rds")
dbWriteTable(dbc, "sch_RCF_12312017", sch_RCF, overwrite = TRUE)

## Schedule RCG
sch_RCG_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCG\ 12312017.txt", n_max = 1) %>% names()
sch_RCG <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCG\ 12312017.txt", skip = 2, col_names = sch_RCG_names)
saveRDS(sch_RCG, "../data/12312017/sch_RCG_12312017.rds")
dbWriteTable(dbc, "sch_RCG_12312017", sch_RCG, overwrite = TRUE)

## Schedule RCH
sch_RCH_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCH\ 12312017.txt", n_max = 1) %>% names()
sch_RCH <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCH\ 12312017.txt", skip = 2, col_names = sch_RCH_names)
saveRDS(sch_RCH, "../data/12312017/sch_RCH_12312017.rds")
dbWriteTable(dbc, "sch_RCH_12312017", sch_RCH, overwrite = TRUE)

## Schedule RCI
sch_RCI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCI\ 12312017.txt", n_max = 1) %>% names()
sch_RCI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCI\ 12312017.txt", skip = 2, col_names = sch_RCI_names)
saveRDS(sch_RCI, "../data/12312017/sch_RCI_12312017.rds")
dbWriteTable(dbc, "sch_RCI_12312017", sch_RCI, overwrite = TRUE)

## Schedule RCI
sch_RCI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCI\ 12312017.txt", n_max = 1) %>% names()
sch_RCI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCI\ 12312017.txt", skip = 2, col_names = sch_RCI_names)
saveRDS(sch_RCI, "../data/12312017/sch_RCI_12312017.rds")
dbWriteTable(dbc, "sch_RCI_12312017", sch_RCI, overwrite = TRUE)

## Schedule RCK
sch_RCK_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCK\ 12312017.txt", n_max = 1) %>% names()
sch_RCK <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCK\ 12312017.txt", skip = 2, col_names = sch_RCK_names)
saveRDS(sch_RCK, "../data/12312017/sch_RCK_12312017.rds")
dbWriteTable(dbc, "sch_RCK_12312017", sch_RCK, overwrite = TRUE)

## Schedule RCL_1_of_2
sch_RCL_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCL\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCL_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCL\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCL_1_of_2_names)
saveRDS(sch_RCL_1_of_2, "../data/12312017/sch_RCL_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCL_1_of_2_12312017", sch_RCL_1_of_2, overwrite = TRUE)

## Schedule RCL_2_of_2
sch_RCL_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCL\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCL_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCL\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCL_2_of_2_names)
saveRDS(sch_RCL_2_of_2, "../data/12312017/sch_RCL_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCL_2_of_2_12312017", sch_RCL_2_of_2, overwrite = TRUE)

## Schedule RCM
sch_RCM_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCM\ 12312017.txt", n_max = 1) %>% names()
sch_RCM <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCM\ 12312017.txt", skip = 2, col_names = sch_RCM_names)
saveRDS(sch_RCM, "../data/12312017/sch_RCM_12312017.rds")
dbWriteTable(dbc, "sch_RCM_12312017", sch_RCM, overwrite = TRUE)

## Schedule RCN_1_of_2
sch_RCN_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCN\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCN_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCN\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCN_1_of_2_names)
saveRDS(sch_RCN_1_of_2, "../data/12312017/sch_RCN_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCN_1_of_2_12312017", sch_RCN_1_of_2, overwrite = TRUE)

## Schedule RCN_2_of_2
sch_RCN_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCN\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCN_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCN\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCN_2_of_2_names)
saveRDS(sch_RCN_2_of_2, "../data/12312017/sch_RCN_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCN_2_of_2_12312017", sch_RCN_2_of_2, overwrite = TRUE)

## Schedule RCO_1_of_2
sch_RCO_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCO\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCO_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCO\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCO_1_of_2_names)
saveRDS(sch_RCO_1_of_2, "../data/12312017/sch_RCO_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCO_1_of_2_12312017", sch_RCO_1_of_2, overwrite = TRUE)

## Schedule RCO_2_of_2
sch_RCO_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCO\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCO_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCO\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCO_2_of_2_names)
saveRDS(sch_RCO_2_of_2, "../data/12312017/sch_RCO_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCO_2_of_2_12312017", sch_RCO_2_of_2, overwrite = TRUE)

## Schedule RCP
sch_RCP_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCP\ 12312017.txt", n_max = 1) %>% names()
sch_RCP <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCP\ 12312017.txt", skip = 2, col_names = sch_RCP_names)
saveRDS(sch_RCP, "../data/12312017/sch_RCP_12312017.rds")
dbWriteTable(dbc, "sch_RCP_12312017", sch_RCP, overwrite = TRUE)

## Schedule RCQ_1_of_2
sch_RCQ_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCQ\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCQ_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCQ\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCQ_1_of_2_names)
saveRDS(sch_RCQ_1_of_2, "../data/12312017/sch_RCQ_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCQ_1_of_2_12312017", sch_RCQ_1_of_2, overwrite = TRUE)

## Schedule RCQ_2_of_2
sch_RCQ_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCQ\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCQ_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCQ\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCQ_2_of_2_names)
saveRDS(sch_RCQ_2_of_2, "../data/12312017/sch_RCQ_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCQ_2_of_2_12312017", sch_RCQ_2_of_2, overwrite = TRUE)

## Schedule RCRI
sch_RCRI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRI\ 12312017.txt", n_max = 1) %>% names()
sch_RCRI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRI\ 12312017.txt", skip = 2, col_names = sch_RCRI_names)
saveRDS(sch_RCRI, "../data/12312017/sch_RCRI_12312017.rds")
dbWriteTable(dbc, "sch_RCRI_12312017", sch_RCRI, overwrite = TRUE)

## Schedule RCRII_1_of_4
sch_RCRII_1_of_4_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(1 of 4).txt", n_max = 1) %>% names()
sch_RCRII_1_of_4 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(1 of 4).txt", skip = 2, col_names = sch_RCRII_1_of_4_names)
saveRDS(sch_RCRII_1_of_4, "../data/12312017/sch_RCRII_1_of_4_12312017.rds")
dbWriteTable(dbc, "sch_RCRII_1_of_4_12312017", sch_RCRII_1_of_4, overwrite = TRUE)

## Schedule RCRII_2_of_4
sch_RCRII_2_of_4_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(2 of 4).txt", n_max = 1) %>% names()
sch_RCRII_2_of_4 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(2 of 4).txt", skip = 2, col_names = sch_RCRII_2_of_4_names)
saveRDS(sch_RCRII_2_of_4, "../data/12312017/sch_RCRII_2_of_4_12312017.rds")
dbWriteTable(dbc, "sch_RCRII_2_of_4_12312017", sch_RCRII_2_of_4, overwrite = TRUE)

## Schedule RCRII_3_of_4
sch_RCRII_3_of_4_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(3 of 4).txt", n_max = 1) %>% names()
sch_RCRII_3_of_4 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(3 of 4).txt", skip = 2, col_names = sch_RCRII_3_of_4_names)
saveRDS(sch_RCRII_3_of_4, "../data/12312017/sch_RCRII_3_of_4_12312017.rds")
dbWriteTable(dbc, "sch_RCRII_3_of_4_12312017", sch_RCRII_3_of_4, overwrite = TRUE)

## Schedule RCRII_4_of_4
sch_RCRII_4_of_4_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(4 of 4).txt", n_max = 1) %>% names()
sch_RCRII_4_of_4 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCRII\ 12312017(4 of 4).txt", skip = 2, col_names = sch_RCRII_4_of_4_names)
saveRDS(sch_RCRII_4_of_4, "../data/12312017/sch_RCRII_4_of_4_12312017.rds")
dbWriteTable(dbc, "sch_RCRII_4_of_4_12312017", sch_RCRII_4_of_4, overwrite = TRUE)

## Schedule RCS
sch_RCS_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCS\ 12312017.txt", n_max = 1) %>% names()
sch_RCS <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCS\ 12312017.txt", skip = 2, col_names = sch_RCS_names)
saveRDS(sch_RCS, "../data/12312017/sch_RCS_12312017.rds")
dbWriteTable(dbc, "sch_RCS_12312017", sch_RCS, overwrite = TRUE)

## Schedule RCT_1_of_2
sch_RCT_1_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCT\ 12312017(1 of 2).txt", n_max = 1) %>% names()
sch_RCT_1_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCT\ 12312017(1 of 2).txt", skip = 2, col_names = sch_RCT_1_of_2_names)
saveRDS(sch_RCT_1_of_2, "../data/12312017/sch_RCT_1_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCT_1_of_2_12312017", sch_RCT_1_of_2, overwrite = TRUE)

## Schedule RCT_2_of_2
sch_RCT_2_of_2_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCT\ 12312017(2 of 2).txt", n_max = 1) %>% names()
sch_RCT_2_of_2 <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCT\ 12312017(2 of 2).txt", skip = 2, col_names = sch_RCT_2_of_2_names)
saveRDS(sch_RCT_2_of_2, "../data/12312017/sch_RCT_2_of_2_12312017.rds")
dbWriteTable(dbc, "sch_RCT_2_of_2_12312017", sch_RCT_2_of_2, overwrite = TRUE)


## Schedule RCV
sch_RCV_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCV\ 12312017.txt", n_max = 1) %>% names()
sch_RCV <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RCV\ 12312017.txt", skip = 2, col_names = sch_RCV_names)
saveRDS(sch_RCV, "../data/12312017/sch_RCV_12312017.rds")
dbWriteTable(dbc, "sch_RCV_12312017", sch_RCV, overwrite = TRUE)


## Schedule RI
sch_RI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RI\ 12312017.txt", n_max = 1) %>% names()
sch_RI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RI\ 12312017.txt", skip = 2, col_names = sch_RI_names)
saveRDS(sch_RI, "../data/12312017/sch_RI_12312017.rds")
dbWriteTable(dbc, "sch_RI_12312017", sch_RI, overwrite = TRUE)


## Schedule RIA
sch_RIA_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIA\ 12312017.txt", n_max = 1) %>% names()
sch_RIA <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIA\ 12312017.txt", skip = 2, col_names = sch_RIA_names)
saveRDS(sch_RIA, "../data/12312017/sch_RIA_12312017.rds")
dbWriteTable(dbc, "sch_RIA_12312017", sch_RIA, overwrite = TRUE)


## Schedule RIBI
sch_RIBI_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIBI\ 12312017.txt", n_max = 1) %>% names()
sch_RIBI <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIBI\ 12312017.txt", skip = 2, col_names = sch_RIBI_names)
saveRDS(sch_RIBI, "../data/12312017/sch_RIBI_12312017.rds")
dbWriteTable(dbc, "sch_RIBI_12312017", sch_RIBI, overwrite = TRUE)


## Schedule RIBII
sch_RIBII_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIBII\ 12312017.txt", n_max = 1) %>% names()
sch_RIBII <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIBII\ 12312017.txt", skip = 2, col_names = sch_RIBII_names)
saveRDS(sch_RIBII, "../data/12312017/sch_RIBII_12312017.rds")
dbWriteTable(dbc, "sch_RIBII_12312017", sch_RIBII, overwrite = TRUE)


## Schedule RIC
sch_RIC_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIC\ 12312017.txt", n_max = 1) %>% names()
sch_RIC <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIC\ 12312017.txt", skip = 2, col_names = sch_RIC_names)
saveRDS(sch_RIC, "../data/12312017/sch_RIC_12312017.rds")
dbWriteTable(dbc, "sch_RIC_12312017", sch_RIC, overwrite = TRUE)


## Schedule RID
sch_RID_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RID\ 12312017.txt", n_max = 1) %>% names()
sch_RID <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RID\ 12312017.txt", skip = 2, col_names = sch_RID_names)
saveRDS(sch_RID, "../data/12312017/sch_RID_12312017.rds")
dbWriteTable(dbc, "sch_RID_12312017", sch_RID, overwrite = TRUE)


## Schedule RIE
sch_RIE_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIE\ 12312017.txt", n_max = 1) %>% names()
sch_RIE <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ RIE\ 12312017.txt", skip = 2, col_names = sch_RIE_names)
saveRDS(sch_RIE, "../data/12312017/sch_RIE_12312017.rds")
dbWriteTable(dbc, "sch_RIE_12312017", sch_RIE, overwrite = TRUE)


## Schedule SU
sch_SU_names <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ SU\ 12312017.txt", n_max = 1) %>% names()
sch_SU <- read_tsv("../data/tmp/FFIEC\ CDR\ Call\ Schedule\ SU\ 12312017.txt", skip = 2, col_names = sch_SU_names)
saveRDS(sch_SU, "../data/12312017/sch_SU_12312017.rds")
dbWriteTable(dbc, "sch_SU_12312017", sch_SU, overwrite = TRUE)
