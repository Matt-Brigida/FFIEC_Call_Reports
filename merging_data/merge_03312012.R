library(data.table)

## merge command
test <- por[ci,][ent,][gi,][gl,]


por <- readRDS("../data/03312012/bulk_POR_03312012.rds")
por <- as.data.table(por)
setkey(x = por, "IDRSSD")

## Schedule CI

ci <- readRDS("../data/03312012/sch_CI_03312012.rds")
ci <- as.data.table(ci)
setkey(x = ci, "IDRSSD")

## Schedule ENT

ent <- readRDS("../data/03312012/sch_ENT_03312012.rds")
ent <- as.data.table(ent)
setkey(x = ent, "IDRSSD")

## Schedule GI

gi <- readRDS("../data/03312012/sch_GI_03312012.rds")
gi <- as.data.table(gi)
setkey(x = gi, "IDRSSD")

## Schedule GL

gl <- readRDS("../data/03312012/sch_GL_03312012.rds")
gl <- as.data.table(gl)
setkey(x = gl, "IDRSSD")

## Schedule NARR

narr <- readRDS("../data/03312012/sch_NARR_03312012.rds")
narr <- as.data.table(narr)
setkey(x = narr, "IDRSSD")

## Schedule RC

rc <- readRDS("../data/03312012/sch_RC_03312012.rds")
rc <- as.data.table(rc)
setkey(x = rc, "IDRSSD")

## Schedule RCA

rca <- readRDS("../data/03312012/sch_RCA_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCB_1_of_2

rcb_1_of_2 <- readRDS("../data/03312012/sch_RCB_1_of_2_03312012.rds")
rcb_1_of_2 <- as.data.table(rcb_1_of_2)
setkey(x = rcb_1_of_2, "IDRSSD")

## Schedule RCB_2_of_2

rcb_2_of_2 <- readRDS("../data/03312012/sch_RCB_2_of_2_03312012.rds")
rcb_2_of_2 <- as.data.table(rcb_2_of_2)
setkey(x = rcb_2_of_2, "IDRSSD")

## Schedule RCCI

rcci <- readRDS("../data/03312012/sch_RCCI_03312012.rds")
rcci <- as.data.table(rcci)
setkey(x = rcci, "IDRSSD")

## Schedule RCCII

rccii <- readRDS("../data/03312012/sch_RCCII_03312012.rds")
rccii <- as.data.table(rccii)
setkey(x = rccii, "IDRSSD")

## Schedule RCD

rcd <- readRDS("../data/03312012/sch_RCD_03312012.rds")
rcd <- as.data.table(rcd)
setkey(x = rcd, "IDRSSD")

## Schedule RCE

rce <- readRDS("../data/03312012/sch_RCE_03312012.rds")
rce <- as.data.table(rce)
setkey(x = rce, "IDRSSD")

## Schedule RCEI

rcei <- readRDS("../data/03312012/sch_RCEI_03312012.rds")
rcei <- as.data.table(rcei)
setkey(x = rcei, "IDRSSD")

## Schedule RCEII

rceii <- readRDS("../data/03312012/sch_RCEII_03312012.rds")
rceii <- as.data.table(rceii)
setkey(x = rceii, "IDRSSD")

## Schedule RCF

rcf <- readRDS("../data/03312012/sch_RCF_03312012.rds")
rcf <- as.data.table(rcf)
setkey(x = rcf, "IDRSSD")

## Schedule RCG

rcg <- readRDS("../data/03312012/sch_RCG_03312012.rds")
rcg <- as.data.table(rcg)
setkey(x = rcg, "IDRSSD")

## Schedule RCH

rch <- readRDS("../data/03312012/sch_RCH_03312012.rds")
rch <- as.data.table(rch)
setkey(x = rch, "IDRSSD")

## Schedule RCI

rci <- readRDS("../data/03312012/sch_RCI_03312012.rds")
rci <- as.data.table(rci)
setkey(x = rci, "IDRSSD")

## Schedule RCK

rck <- readRDS("../data/03312012/sch_RCK_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCL_1_of_2

rcl_1_of_2 <- readRDS("../data/03312012/sch_RCL_1_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCL_2_of_2

rcl_2_of_2 <- readRDS("../data/03312012/sch_RCL_2_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCM

rcm <- readRDS("../data/03312012/sch_RCM_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCN_1_of_2

rcn_1_of_2 <- readRDS("../data/03312012/sch_RCN_1_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCN_2_of_2

rcn_2_of_2 <- readRDS("../data/03312012/sch_RCN_2_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCO

rco <- readRDS("../data/03312012/sch_RCO_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCP

rcp <- readRDS("../data/03312012/sch_RCP_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCQ_1_of_2

rcq_1_of_2 <- readRDS("../data/03312012/sch_RCQ_1_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCQ_2_of_2

rcq_2_of_2 <- readRDS("../data/03312012/sch_RCQ_2_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCR_1_of_2

rcr_1_of_2 <- readRDS("../data/03312012/sch_RCR_1_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCR_2_of_2

rcr_2_of_2 <- readRDS("../data/03312012/sch_RCR_2_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCS

rcs <- readRDS("../data/03312012/sch_RCS_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCT_1_of_2

rct_1_of_2 <- readRDS("../data/03312012/sch_RCT_1_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCT_2_of_2

rct_2_of_2 <- readRDS("../data/03312012/sch_RCT_2_of_2_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RCV

rcv <- readRDS("../data/03312012/sch_RCV_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RI

ri <- readRDS("../data/03312012/sch_RI_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RIA

ria <- readRDS("../data/03312012/sch_RIA_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RIBI

ribi <- readRDS("../data/03312012/sch_RIBI_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RIBII

ribii <- readRDS("../data/03312012/sch_RIBII_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RID

rid <- readRDS("../data/03312012/sch_RID_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")

## Schedule RIE

rie <- readRDS("../data/03312012/sch_RIE_03312012.rds")
rca <- as.data.table(rca)
setkey(x = rca, "IDRSSD")
