# Figure style of the panels drawn with ggplot in notebook 10 (Figs 6A-F, S11C): font, base size, themes and
# cell-type points. Sizes are print sizes: a page is 7.0 in wide.

suppressMessages({
    library(ggplot2)
    library(patchwork)
    library(data.table)
    library(dplyr)
    library(grid)
})

SUP_FONT <- "Nimbus Sans"          # Helvetica clone (Arial-metric)
SUP_BASE <- 7                       # axis titles 7 pt, tick labels 6 pt

# R's own pdf() / postscript() devices know only their font database: register Nimbus Sans there with the metrics of
# Helvetica (the two are metrically identical), so the panels draw on those devices too (e.g. under Rscript)
local({
    if (!SUP_FONT %in% names(grDevices::pdfFonts())) {
        ff <- list(grDevices::pdfFonts()$Helvetica); names(ff) <- SUP_FONT
        do.call(grDevices::pdfFonts, ff)
        do.call(grDevices::postscriptFonts, ff)
    }
})

theme_sup <- function(base_size = SUP_BASE, grid = FALSE, legend = "right") {
    t <- theme_classic(base_size = base_size, base_family = SUP_FONT) +
        theme(
            line              = element_line(linewidth = 0.25),
            axis.line         = element_line(linewidth = 0.25, colour = "black"),
            axis.ticks        = element_line(linewidth = 0.25, colour = "black"),
            axis.ticks.length = unit(1.5, "pt"),
            axis.text         = element_text(size = base_size - 1, colour = "black"),
            axis.title        = element_text(size = base_size, colour = "black"),
            legend.title      = element_text(size = base_size - 1),
            legend.text       = element_text(size = base_size - 1),
            legend.key.size   = unit(6, "pt"),
            legend.position   = legend,
            legend.margin     = margin(0, 0, 0, 0),
            legend.background = element_blank(),
            strip.background  = element_blank(),
            strip.text        = element_text(size = base_size, colour = "black",
                                             margin = margin(1, 1, 1, 1)),
            plot.title        = element_text(size = base_size, hjust = 0.5,
                                             margin = margin(0, 0, 2, 0)),
            plot.tag          = element_text(size = 10, face = "bold", family = SUP_FONT),
            plot.margin       = margin(2, 3, 2, 2)
        )
    if (grid) {
        t <- t + theme(panel.grid.major = element_line(linewidth = 0.15, colour = "grey88"))
    }
    t
}

# points coloured by cell type always get a thin dark outline: the surface
# ectoderm colour (#f7f79e) is invisible as a bare point on white.
geom_celltype_point <- function(..., size = 1.3, stroke = 0.15) {
    geom_point(..., shape = 21, colour = "grey15", size = size, stroke = stroke)
}

# small multiples: every facet framed (axis lines only on outer facets look
# unfinished), light grid, compact strips
theme_sup_facets <- function(base_size = SUP_BASE) {
    theme_sup(base_size, grid = TRUE) +
        theme(axis.line = element_blank(),
              panel.border = element_rect(fill = NA, colour = "black", linewidth = 0.25),
              strip.text = element_text(size = base_size - 1, margin = margin(1, 1, 1.5, 1)),
              panel.spacing = unit(3, "pt"),
              axis.text = element_text(size = base_size - 1.5))
}
