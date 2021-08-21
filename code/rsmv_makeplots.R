
setwd('C:/Dropbox/projects/rsmv/code')
rm(list = ls())

source('set_plot_params.R')

subsetdata = fread('../results/subsets_sumdata.csv')
fulldata = fread('../results/fullsample_data.csv')

# Main plot fulldata

plotdata = fulldata[majshare == 0.5]

full50plot = ggplot(plotdata, aes(x = v, y = passrate)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  #scale_color_manual(name = '% cutoff', values = colorgrid) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'none',
        legend.key.size = unit(5,"line"))
full50plot

CairoPNG(filename = paste("../plots/full_50.png", sep = ""), width = 1600, height = 1200)
print(full50plot)
dev.off()

fulldata[, majsharefac := factor(majshare, levels = c(0.65, 0.5, 0.35, 0.2))]

for(my_majshare in c(0.65, 0.5, 0.35, 0.2)) {
  
  d('MAJSHARE: ', my_majshare)
  
  plotdata = fulldata[majshare == my_majshare]
  my_majstring = as.character(my_majshare * 100) 
  
  fullnumplot = ggplot(plotdata, aes(x = v, y = passrate)) + 
    geom_line(alpha = alphaparam, size = linesize) + 
    scale_x_continuous(name = TeX("$t_j$")) + 
    scale_y_continuous(name = TeX("Admit probability"), label = percent) +
    #scale_color_manual(name = '% cutoff', values = colorgrid) + 
    theme_bw() + 
    ggtitle(p('Cutoff: ', my_majstring, '%')) + 
    theme(text = element_text(size = textsize*2), 
          legend.text = element_text(size = legendtextsize*2),
          axis.text = element_text(size = axistextsize*2),
          #axis.title.y = element_text(angle = 0, vjust = 0.5),
          legend.position = 'none',
          legend.key.size = unit(5,"line"))
  fullnumplot
  
  CairoPNG(filename = paste("../plots/full_", my_majstring, ".png", sep = ""), 
           width = 1600, height = 1200)
  print(fullnumplot)
  dev.off()
}

fullplotmulti = ggplot(fulldata, aes(x = v, y = passrate, group = majsharefac, color = majsharefac)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  scale_color_gdocs(name = TeX('Maj. cutoff'), labels = c('65%', '50%', '35%', '20%')) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'right',
        legend.key.size = unit(5,"line"))
fullplotmulti

CairoPNG(filename = paste("../plots/full_multi.png", sep = ""), width = 1600*1.5, height = 1200)
print(fullplotmulti)
dev.off()

setwd('C:/Dropbox/projects/rsmv/code')
rm(list = ls())

source('set_plot_params.R')

subsetdata = fread('../results/subsets_sumdata.csv')
fulldata = fread('../results/fullsample_data.csv')

# Main plot fulldata

plotdata = fulldata[majshare == 0.5]

# full50plot = ggplot(plotdata, aes(x = v, y = passrate)) + 
#   geom_line(alpha = alphaparam, size = linesize) + 
#   scale_x_continuous(name = TeX("$t_j$")) + 
#   scale_y_continuous(name = TeX("Admit probability"), label = percent) +
#   #scale_color_manual(name = '% cutoff', values = colorgrid) + 
#   theme_bw() + 
#   theme(text = element_text(size = textsize*2), 
#         legend.text = element_text(size = legendtextsize*2),
#         axis.text = element_text(size = axistextsize*2),
#         #axis.title.y = element_text(angle = 0, vjust = 0.5),
#         legend.position = 'none',
#         legend.key.size = unit(5,"line"))
# full50plot
# 
# CairoPNG(filename = paste("../plots/full_50.png", sep = ""), width = 1600, height = 1200)
# print(full50plot)
# dev.off()

fulldata[, majsharefac := factor(majshare, levels = c(0.65, 0.5, 0.35, 0.2))]

for(my_majshare in c(0.65, 0.5, 0.35, 0.2)) {
  
  d('MAJSHARE: ', my_majshare)
  
  plotdata = fulldata[majshare == my_majshare]
  my_majstring = as.character(my_majshare * 100) 
  
  fullnumplot = ggplot(plotdata, aes(x = v, y = passrate)) + 
    geom_line(alpha = alphaparam, size = linesize) + 
    scale_x_continuous(name = TeX("$t_j$")) + 
    scale_y_continuous(name = TeX("Admit probability"), label = percent) +
    #scale_color_manual(name = '% cutoff', values = colorgrid) + 
    theme_bw() + 
    ggtitle(p('Cutoff: ', my_majstring, '%')) + 
    theme(text = element_text(size = textsize*2), 
          legend.text = element_text(size = legendtextsize*2),
          axis.text = element_text(size = axistextsize*2),
          #axis.title.y = element_text(angle = 0, vjust = 0.5),
          legend.position = 'none',
          legend.key.size = unit(5,"line"))
  fullnumplot
  
  CairoPNG(filename = paste("../plots/full_", my_majstring, ".png", sep = ""), 
           width = 1600, height = 1200)
  print(fullnumplot)
  dev.off()
}

fullplotmulti = ggplot(fulldata, aes(x = v, y = passrate, group = majsharefac, color = majsharefac)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  scale_color_gdocs(name = TeX('Maj. cutoff'), labels = c('65%', '50%', '35%', '20%')) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'right',
        legend.key.size = unit(5,"line"))
fullplotmulti

CairoPNG(filename = paste("../plots/full_multi.png", sep = ""), width = 1600*1.5, height = 1200)
print(fullplotmulti)
dev.off()

# Make it into separate plots to be clearer


setwd('C:/Dropbox/projects/rsmv/code')
rm(list = ls())

source('set_plot_params.R')

subsetdata = fread('../results/subsets_sumdata.csv')
fulldata = fread('../results/fullsample_data.csv')

# Main plot fulldata

plotdata = fulldata[majshare == 0.5]

# Calculate cutoff

plotdata[v > 0 & passrate == 0]

full50plot = ggplot(plotdata, aes(x = v, y = passrate)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  #scale_color_manual(name = '% cutoff', values = colorgrid) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'none',
        legend.key.size = unit(5,"line"))
full50plot

CairoPNG(filename = paste("../plots/full_50.png", sep = ""), width = 1600, height = 1200)
print(full50plot)
dev.off()

fulldata[, majsharefac := factor(majshare, levels = c(0.65, 0.5, 0.35, 0.2))]

for(my_majshare in c(0.65, 0.5, 0.35, 0.2)) {
  
  d('MAJSHARE: ', my_majshare)
  
  plotdata = fulldata[majshare == my_majshare]
  my_majstring = as.character(my_majshare * 100) 
  
  fullnumplot = ggplot(plotdata, aes(x = v, y = passrate)) + 
    geom_line(alpha = alphaparam, size = linesize) + 
    scale_x_continuous(name = TeX("$t_j$")) + 
    scale_y_continuous(name = TeX("Admit probability"), label = percent) +
    #scale_color_manual(name = '% cutoff', values = colorgrid) + 
    theme_bw() + 
    ggtitle(p('Cutoff: ', my_majstring, '%')) + 
    theme(text = element_text(size = textsize*2), 
          legend.text = element_text(size = legendtextsize*2),
          axis.text = element_text(size = axistextsize*2),
          #axis.title.y = element_text(angle = 0, vjust = 0.5),
          legend.position = 'none',
          legend.key.size = unit(5,"line"))
  fullnumplot
  
  CairoPNG(filename = paste("../plots/full_", my_majstring, ".png", sep = ""), 
           width = 1600, height = 1200)
  print(fullnumplot)
  dev.off()
}

fullplotmulti = ggplot(fulldata, aes(x = v, y = passrate, group = majsharefac, color = majsharefac)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  scale_color_gdocs(name = TeX('Maj. cutoff'), labels = c('65%', '50%', '35%', '20%')) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'right',
        legend.key.size = unit(5,"line"))
fullplotmulti

CairoPNG(filename = paste("../plots/full_multi.png", sep = ""), width = 1600*1.5, height = 1200)
print(fullplotmulti)
dev.off()

#####
# SUBSETS
#####

# Main plot subsets

plotdata = subsetdata[subsetN == 5]
# 
# sub5plot = ggplot(plotdata, aes(x = v, y = passrate)) + 
#   geom_line(alpha = alphaparam, size = linesize) + 
#   scale_x_continuous(name = TeX("$t_j$")) + 
#   scale_y_continuous(name = TeX("Admit probability"), label = percent) +
#   #scale_color_manual(name = '% cutoff', values = colorgrid) + 
#   theme_bw() + 
#   theme(text = element_text(size = textsize*2), 
#         legend.text = element_text(size = legendtextsize*2),
#         axis.text = element_text(size = axistextsize*2),
#         #axis.title.y = element_text(angle = 0, vjust = 0.5),
#         legend.position = 'none',
#         legend.key.size = unit(5,"line"))
# sub5plot
# 
# CairoPNG(filename = paste("../plots/sub_5.png", sep = ""), width = 1600, height = 1200)
# print(sub5plot)
# dev.off()

for(my_subsetN in c(3, 5, 11, 21, 41)) {
  
  d('SUBSET N: ', my_subsetN)
  
  plotdata = subsetdata[subsetN == my_subsetN]
  my_SSNstring = as.character(my_subsetN) 
  
  fullnumplot = ggplot(plotdata, aes(x = v, y = passrate)) + 
    geom_line(alpha = alphaparam, size = linesize) + 
    scale_x_continuous(name = TeX("$t_j$")) + 
    scale_y_continuous(name = TeX("Admit probability"), label = percent) +
    #scale_color_manual(name = '% cutoff', values = colorgrid) + 
    theme_bw() + 
    ggtitle(p('Subset size: ', my_SSNstring)) + 
    theme(text = element_text(size = textsize*2), 
          legend.text = element_text(size = legendtextsize*2),
          axis.text = element_text(size = axistextsize*2),
          #axis.title.y = element_text(angle = 0, vjust = 0.5),
          legend.position = 'none',
          legend.key.size = unit(5,"line"))
  fullnumplot
  
  CairoPNG(filename = paste("../plots/sub_", my_SSNstring, ".png", sep = ""), 
           width = 1600, height = 1200)
  print(fullnumplot)
  dev.off()
}

subsetdata[, subNfac := factor(subsetN, levels = c(41, 21, 11, 5, 3))]

subplotmulti = ggplot(subsetdata, aes(x = v, y = passrate, group = subNfac, color = subNfac)) + 
  geom_line(alpha = alphaparam, size = linesize) + 
  scale_x_continuous(name = TeX("$t_j$")) + 
  scale_y_continuous(name = TeX("Admit probability"), label = percent) +
  scale_color_gdocs(name = TeX('Subset size')) + 
  theme_bw() + 
  theme(text = element_text(size = textsize*2), 
        legend.text = element_text(size = legendtextsize*2),
        axis.text = element_text(size = axistextsize*2),
        #axis.title.y = element_text(angle = 0, vjust = 0.5),
        legend.position = 'right',
        legend.key.size = unit(5,"line"))
subplotmulti

CairoPNG(filename = paste("../plots/sub_multi.png", sep = ""), width = 1600*1.5, height = 1200)
print(subplotmulti)
dev.off()

# Subset numbers

subsetdata[v > 0]
subsetdata[v > 1]
subsetdata[v > 2]
