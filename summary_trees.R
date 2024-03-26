##########
#
# Script to obtain bootstrap node supports (BS)
#
##########
#
################ read trees
#
require(phangorn)
require(phytools)
#
bs <- read.tree("~/Desktop/phylogenetics_results/supercontigCombined/partitions_supercontig.txt.ufboot") # bootstrap trees
#
ml_tree <- read.tree("~/Desktop/phylogenetics_results/supercontigCombined/partitions_supercontig.txt.treefile") # best tree
#
bs <- lapply(bs, root, "Jacaranda_mimosifolia", resolve.root = TRUE)
#
class(bs) <- "multiPhylo"
#
ml_tree <- root(ml_tree, "Jacaranda_mimosifolia", resolve.root = TRUE) # root the best tree
#
################ tree support
#
output_tree <- addConfidences(ml_tree, bs, type = "edge")
#
output_tree$node.label <- round(output_tree$node.label, 2)*100
#
write.tree(ladderize(output_tree), file = "supercontig_bestTree_bootstrap.tre")
#
###############