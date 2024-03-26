#################
#
# sequence edition
#
#################
#
require(Biostrings)
#
files <- list.files("~/Desktop/result_non-hybrid/alignments/supercontig/")
#
setwd("~/Desktop/result_non-hybrid/alignments/supercontig/")
#
fails <- vector()
#
for (i in 1:length(files))
	{
		seqs <- readDNAStringSet(files[[i]])
		seqs <- seqs[width(seqs) > 200]
		names(seqs) <- sub(" .*", "", names(seqs))
		if(length(seqs) > 23)
			{
				writeXStringSet(seqs, filepath = paste0("~/Desktop/supercontig2/", files[[i]]))
			}
		else fails[i] <- files[[i]]
	}
#
write.table(na.exclude(fails), file = "~/Desktop/supercontig_failed.txt", quote = FALSE, row.names = FALSE, col.names = FALSE)
#
#########

