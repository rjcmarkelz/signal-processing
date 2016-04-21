# basic signal processing hacking
install.packages("tuneR")
library(tuneR)
library(ggplot2)
setwd("~/git.repos/signal-processing/data")

#read in the data
tester <- readWave("BARRET1_20150612_065505.wav")
head(tester)
plot(tester)

#take a look at the data
out <- extractWave(tester, from = 900, to = 960, xunit = "time")
out

#smaller subset with 
plot(out)
out_2 <- extractWave(tester, from = 902, to = 904, xunit = "time")
plot(out_2)
head(out_2)
str(out_2)
out_plot <- as.data.frame(out_2@left)

#take a look at the S4 class
names(out_plot) <- "song"
str(out_plot)
head(out_plot)
out_plot$index <- as.numeric(rownames(out_plot))
out_plot$seconds <- out_plot$index/48000 # correct for hertz so output is in seconds

# basic ggplot figure
# bird song is between 1.5 to 2.0
test_plot <- ggplot(out_plot) + geom_line(aes(x = seconds, y = song))
test_plot
setwd("~/git.repos/signal-processing/output")
ggsave("isolated-bird-song.pdf")

