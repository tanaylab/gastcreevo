# Embryonic cell types and their display order, given as the atlas type colours (color_ord and mm_col_ord in the source
# notebook). Units of other types (extraembryonic ectoderm and endoderm) are left out of the accessibility matrices.

mm_type_colors = c(
    '#FACB12', # PGC
    '#f7f79e', # Surface ectoderm
    '#C3C388', # Neural crest
    '#879E86', # Neural plate boundary
    '#CDE088', # Neural tube/Floor plate
    '#647A4F', # Forebrain/Midbrain/Hindbrain
    '#354E23', # Caudal neural plate
    '#649146', # Rostral neural plate
    '#90BF75', # Definitive ectoderm
    '#635547', # Epiblast
    '#DABE99', # Primitive streak
    '#9e6762', # Caudal epiblast
    '#8e7e59', # Tail bud - neural
    '#703C37', # Tail bud - mesoderm
    '#C594BF', # Early nascent mesoderm
    '#DFCDE4', # Late nascent mesoderm
    '#1a3f52', # Caudal mesoderm
    '#45d1c5', # Lateral & intermediate mesoderm
    '#408DA1', # Paraxial mesoderm
    '#A8DBF7', # Presomitic mesoderm
    '#1AA2EB', # Somitic mesoderm
    '#8DB5CE', # Rostral mesoderm
    '#53f1fc', # Cardiopharyngeal mesoderm
    '#B51D8D', # Cardiomyocytes
    '#8870ad', # ExE mesoderm
    '#cc7818', # Amnion/Chorion progenitor
    '#824A09', # Amnion/Chorion
    '#532C8A', # Allantois
    '#ff891c', # Endothelial cells
    '#FBBE92', # Haematoendothelial progenitors
    '#C9A997', # Blood progenitors
    '#C72228', # Erythroid 1
    '#D96B2B', # Erythroid 2
    '#FF5608', # Erythroid 3
    '#c19f70', # Anterior Primitive Streak
    '#0F4A9C', # Node/Notochord
    '#F397C0', # Definitive endoderm
    '#EF5A9D', # Gut
    '#F25CD4'  # Hindgut
)

oc_type_colors = c(
    '#FACB12', # PGC
    '#E2F700', # Median TFAP
    '#f7f79e', # Surface ectoderm
    '#CDE087', # Floor plate
    '#C3C388', # Neural crest
    '#879E86', # Neural plate boundary
    '#CDE088', # Neural tube Anterior
    '#647A4F', # Forebrain/Midbrain/Hindbrain
    '#354E23', # Caudal neurectoderm
    '#649146', # Rostral neurectoderm
    '#90BF75', # Ectoderm - Definitive
    '#635547', # Epiblast
    '#DABE99', # Primitive streak
    '#9e6762', # Caudal epiblast
    '#C594BF', # Nascent mesoderm
    '#B6A8ED', # Nascent mesoderm - extraembryonic
    '#1a3f52', # Caudal mesoderm
    '#45d1c5', # Lateral & intermediate mesoderm
    '#408DA1', # Paraxial Mesoderm
    '#A8DBF7', # Presomitic mesoderm
    '#1AA2EB', # Somitic mesoderm
    '#8DB5CE', # Rostral mesoderm
    '#53f1fc', # Cardiopharyngeal mesoderm
    '#B51D8D', # Cardiac
    '#8870ad', # ExE mesoderm
    '#cc7818', # Amnion
    '#532C8A', # Allantois
    '#A69369', # Chorionic mesothelium
    '#966F1B', # Endothelial2
    '#ff891c', # Endothelial
    '#FBBE92', # Hematoendothelial
    '#c9a997', # Blood progenitors
    '#C72228', # Erythroid1
    '#FF5608', # Erythroid2
    '#c19f70', # Anterior primitive streak
    '#6666ED', # Node
    '#0F4A9C', # Notochord
    '#F397C0', # Definitive endoderm
    '#EF5A9E', # Gut
    '#EF5A9D', # Foregut
    '#F25CD4'  # Hindgut
)

# Joint order of the mouse and rabbit type colours for figures that interleave the two species (Fig 1C; source notebook
# c423): the rabbit order with the mouse-only colours in place.
joint_type_colors = toupper(c(
    '#FACB12', # PGC
    '#E2F700', # Median TFAP (rabbit)
    '#F7F79E', # Surface ectoderm
    '#CDE087', # Floor plate (rabbit)
    '#C3C388', # Neural crest
    '#879E86', # Neural plate boundary
    '#CDE088', # Neural tube/Floor plate
    '#647A4F', # Forebrain/Midbrain/Hindbrain
    '#354E23', # Caudal neural plate
    '#649146', # Rostral neural plate
    '#90BF75', # Definitive ectoderm
    '#635547', # Epiblast
    '#DABE99', # Primitive streak
    '#9E6762', # Caudal epiblast
    '#8E7E59', # Tail bud - neural (mouse)
    '#703C37', # Tail bud - mesoderm (mouse)
    '#C594BF', # Early nascent mesoderm
    '#DFCDE4', # Late nascent mesoderm (mouse)
    '#B6A8ED', # Nascent mesoderm - extraembryonic (rabbit)
    '#1A3F52', # Caudal mesoderm
    '#45D1C5', # Lateral & intermediate mesoderm
    '#408DA1', # Paraxial mesoderm
    '#A8DBF7', # Presomitic mesoderm
    '#1AA2EB', # Somitic mesoderm
    '#8DB5CE', # Rostral mesoderm
    '#53F1FC', # Cardiopharyngeal mesoderm
    '#B51D8D', # Cardiomyocytes
    '#8870AD', # ExE mesoderm
    '#CC7818', # Amnion/Chorion progenitor
    '#824A09', # Amnion/Chorion (mouse)
    '#532C8A', # Allantois
    '#A69369', # Chorionic mesothelium (rabbit)
    '#966F1B', # Endothelial2 (rabbit)
    '#FF891C', # Endothelial cells
    '#FBBE92', # Haematoendothelial progenitors
    '#C9A997', # Blood progenitors
    '#C72228', # Erythroid 1
    '#D96B2B', # Erythroid 2 (mouse)
    '#FF5608', # Erythroid 3
    '#C19F70', # Anterior Primitive Streak
    '#6666ED', # Node (rabbit)
    '#0F4A9C', # Node/Notochord
    '#F397C0', # Definitive endoderm
    '#EF5A9E', # Gut (rabbit)
    '#EF5A9D', # Foregut
    '#F25CD4'  # Hindgut
))
