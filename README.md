# gastcreevo

Notebooks that reproduce the figures of the GastCreEvo manuscript (mouse-rabbit gastrulation multiome) from the CSV
tables listed in `data/MANIFEST.tsv`. Peak calling, the locus namespaces and the metacell models are upstream of this
repository. The figures are shown in the executed notebooks.

## Notebooks

| Notebook | Figures |
|---|---|
| `01_crecls.ipynb` | none: pdCREs and CRECls of mouse and rabbit (k-means, k = 100, seed 19), used by the later notebooks |
| `02_states.ipynb` | Fig 1C: expression in the 40 RNA states per species; the 24 homologous states |
| `03_crecl_homology.ipynb` | Figs 1D, 1E: CRECl classes, accessibility by state, the 33 anchor pairs, CRECl numbering |
| `04_motifs.ipynb` | Figs 2A-C: motif enrichment of CRECls |
| `05_orthology.ipynb` | Figs 3C-E: orthology classes (p2p, p2w, p2b, p2no) and accessibility at orthologs |
| `06_lineage_specificity.ipynb` | Figs 3F-L: Gini and correlation of p2p pairs, ten examples |
| `07_crecl_groups.ipynb` | Figs 4A-D: CRECl groups, constrained bases, motif energies of p2p pairs |
| `08_mammals.ipynb` | Fig 5A: evolutionary classes of Mesp2 sites across mammals |
| `09_motif_hits.ipynb` | Figs 4E, 4F, 5B, 5C: motif sites in p2p and p2b pdCREs |
| `10_gene_neighbourhoods.ipynb` | Figs 6A-F, Fig S11C: pdCREs around 146 orthologous gastrulation genes; Hi-C contacts |

Later notebooks read tables that earlier ones write to `output/`. Not drawn here: Figs 1A and 1B, the motif logos of
Fig 2B, and Figs 3A (schematic) and 3B (genome browser view). In the paper, labels and colours of Figs 3-5 were edited by
hand; the notebooks say where.

## Running

```bash
conda activate amosbase8     # R 4.3.3; Jupyter kernel ir43 ("amosbase8 R4.3.3")
data/stage_data.sh           # link the inputs into data/ and check their md5
./run.sh                     # execute all notebooks in order (or: ./run.sh 01_crecls.ipynb)
```

`data/stage_data.sh <dir>` links the inputs from `<dir>` instead of the paths in the manifest. `$GASTCREEVO_DATA`
overrides `data/` and `$GASTCREEVO_OUT` overrides `output/`. A full run takes about 6 minutes.

## Layout

- `notebooks/`: one numbered notebook per step.
- `R/setup.R`: packages, paths, figure display, and in-process versions of tgstat's group functions.
  `R/cell_types.R`: embryonic cell types and their order. `R/sup_style.R`: the figure style of notebook 10.
- `data/MANIFEST.tsv`: every input with md5, size, source and description. The data files are not in git.
- `run.sh`: executes the notebooks in place, so they keep their figures.

## Environment

R 4.3.3 with tglkmeans 0.5.5, tgstat 2.3.27, tgutil 0.1.21, tidyverse 2.0.0 (dplyr 1.1.4, ggplot2 4.0.2), data.table
1.15.4, ComplexHeatmap 2.18.0, DescTools 0.99.60, zoo 1.8.12, patchwork 1.3.0, ragg 1.3.2, ggtext 0.1.2, ape 5.8.1,
bnpsd 1.3.13 and shaman 2.1.1; the font Nimbus Sans (urw-base35) and cairo 1.18; Jupyter with IRkernel 1.3.2 and repr
1.1.7. The CRECls depend on the tglkmeans version: `TGL_kmeans` seeds k-means++ through R's random number generator
(`set.seed(19)`).

## Notes

- Run the notebooks with `run.sh` or in Jupyter: ComplexHeatmap sizes the raster images of its heatmaps by the plot size of
  the Jupyter R kernel, and Figs 4A-C come out as in the paper only there.
- Sums of UMIs and hits by group use `col_group_sums()` (`R/setup.R`, base R `rowsum()`) instead of tgstat's
  `tgs_matrix_tapply(x, index, sum)`, which evaluates `sum` in forked worker processes whose exit intermittently kills the
  Jupyter kernel. The sums are identical.
