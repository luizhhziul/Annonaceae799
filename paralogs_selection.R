##############
#
# edit trees
#
require(ape)
require(Biostrings)
#
tree <- read.tree("~/Desktop/profissional/Research/Bignoniaceae/Bait_design&phylogeny/result/trees/paralogs/gene412.paralogs.fasta.tre")
#
tree <- ladderize(root(tree, "Jacaranda_mimosifolia", resolve.root = TRUE))
#
quartz(width = 10, height = 12)
#
plot(tree)
#
nodelabels()
#
tree <- keep.tip(tree, c(extract.clade(tree, 67)$tip.label))
#
fasta <- readDNAStringSet("~/Desktop/profissional/Research/Bignoniaceae/Bait_design&phylogeny/result/sequences/paralogs/gene531.paralogs.fasta")
#
names(fasta) <- gsub("\\ .*", "", names(fasta))
#
fasta <- fasta[which(names(fasta) %in% tree$tip.label)]
#
outgroups <- readDNAStringSet("~/Desktop/profissional/Research/Bignoniaceae/Bait_design&phylogeny/result/sequences/supercontig_outgroups/gene531.fasta")
#
outgroups <- outgroups[which(names(outgroups) %in% c("Avicennia_marina", "Buddleja_alternifolia"))]
#
result <- c(outgroups, fasta)
#
names(result) <- gsub("\\..*", "", names(result))
#
names(result) <- paste0(names(result), "-gene531")
#
result <- result[order(names(result))]
#
any(duplicated(names(result)))
#
plot(tree)
#
writeXStringSet(result, file = paste0("~/Desktop/paralogs_edited_automatic/", "gene531", ".fasta"), format="fasta", width=60)
#
#
#########

3 124 412 711





