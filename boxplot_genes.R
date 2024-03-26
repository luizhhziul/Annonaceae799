###########
#
library(ggplot2)
library(reshape2)
#
sample.filename = "~/Desktop/seq_lengths.tsv"
sample.data= as.matrix(read.table(sample.filename,header=T,row.names=1,sep="\t"))
sample.data <- sample.data[,order(colnames(head(sample.data)))]
#
result <- vector()
for(i in 1:length(sample.data[1,])) result[i] <- mean(sample.data[-1,i]/sample.data[1,i])
#
regions <- c(rep("Angio353", 334), rep("Annonaceae", 803-334))
#
DFF <- data.frame(regions, result)
#
y <- 	ggplot(data = DFF, mapping = aes(x = regions, y = result)) +
		geom_boxplot(outlier.shape = NA) +
		geom_jitter(aes(color = result), size=1, alpha=0.8) +
		scale_colour_gradientn(colours = c("#FFFFFF", "#132B43")) +
		#scale_fill_gradient(high = "#132B43", low = "#FFFFFF") +
		#scale_colour_manual(values = c("navyblue", "steelblue3")) +
		theme_bw(base_size = 15) +
		theme(legend.position = "none") +
		xlab("") +
		ylab("")
#
#
