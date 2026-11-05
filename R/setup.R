# Shared setup for the notebooks: packages, paths, figure display, and in-process versions of tgstat's group functions.
# fread/fwrite are tgutil's (data.table wrappers that return data.frames and write NA as "NA").
suppressPackageStartupMessages({
    library(tidyverse)
    library(tgutil)
    library(tgstat)
    library(tglkmeans)
})

find_repo = function(dir = getwd()) {
    while (!file.exists(file.path(dir, "data", "MANIFEST.tsv"))) {
        parent = dirname(dir)
        if (parent == dir) stop("run from inside the gastcreevo repository")
        dir = parent
    }
    normalizePath(dir)
}
REPO = find_repo()
DATA_DIR = Sys.getenv("GASTCREEVO_DATA", file.path(REPO, "data"))
OUT_DIR = Sys.getenv("GASTCREEVO_OUT", file.path(REPO, "output"))

data_path = function(file) file.path(DATA_DIR, file)

out_path = function(step) {
    dir = file.path(OUT_DIR, step)
    dir.create(dir, recursive = TRUE, showWarnings = FALSE)
    dir
}

# Figures are shown in the notebooks as PNG; each figure cell sets the figure's print size in inches (repr.plot.width,
# repr.plot.height) and, for small text, a higher resolution (repr.plot.res).
options(jupyter.plot_mimetypes = c("text/plain", "image/png"), repr.plot.res = 150)

# Sums of the columns of x by group (index, one per column), laid out as tgs_matrix_tapply(x, index, sum) returns them:
# groups in rows, the rows of x in columns. tgs_matrix_tapply evaluates `sum` in forked worker processes, up to one per
# row, and the workers' exit can break the Jupyter kernel's sockets ("Bad file descriptor (src/epoll.cpp:118)", then
# "Kernel died"). rowsum() gives the same matrix in one process; the sums are exact, as the values are integers.
col_group_sums = function(x, index, na.rm = FALSE) {
    sums = rowsum(t(x), index, na.rm = na.rm)
    storage.mode(sums) = "double"
    sums
}

# fun over the columns of each group, per row, laid out as tgs_matrix_tapply(x, index, fun) returns it (groups in rows), in
# one process (see col_group_sums).
col_group_apply = function(x, index, fun) {
    index = factor(index)
    r = vapply(levels(index), function(g) apply(x[, index == g, drop = FALSE], 1, fun), numeric(nrow(x)))
    if (is.null(dim(r))) r = matrix(r, nrow = 1, dimnames = list(rownames(x), levels(index)))
    t(r)
}
