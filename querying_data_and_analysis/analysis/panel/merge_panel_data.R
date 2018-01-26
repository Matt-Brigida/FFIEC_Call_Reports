## read in data and merge-----

panel_total_equity <- readRDS("panel_total_equity.rds")
panel_total_assets <- readRDS("panel_total_assets.rds")

panel <- merge(panel_total_assets, panel_total_equity, by = c("quarter", "IDRSSD"), all = FALSE)

