#--------------------------------------------------#
#### SCRIPT - GR�FICOS DESCRITIVOS ARTIGO REBEP ####
#--------------------------------------------------#
## Educa��o e outros determinantes da participa��o laboral
## de adultos mais velhos no Brasil

## Script para cria��o dos gr�ficos descritivos
## para as vari�veis de n�vel individual dos Censos e da
## PNAD.

cat("\014") # limpa a tela Console (CTRL+L)
rm(list = ls(all = T)) # limpa environment
options(scipen = 999) # desabilita numera��o cient�fica
graphics.off() # apaga gr�ficos

#### I) Pacotes ####
library(lattice)
library(dplyr)

#### Dados ####
setwd('C:/Users/Anderson Rocha/Desktop/Anderson Rocha/1 UFMG/7 Estudos para publica��o/1_em_desenvolvimento/3educ_trab/dados')
load('graph_descr_data.RData')

### Objetos:
## educ: proporcao de individuos por escolaridade e por ano.
## clswkr: proporcao de individuos por classe do emprego e por ano.
## socsec: proporcao de individuos por status de contribuicao previdenciaria e por ano.
## retired: proporcao de individuos por status de aposentadoria e por ano.

#### Organiza��o dos dados ####
agegrp <- c('45-49','50-54','55-59','60-64','65-69','70-74','75-79','80+')

educ$age <- as.factor(educ$age); levels(educ$age) <- agegrp
clswrk$age <- as.factor(clswrk$age); levels(clswrk$age) <- agegrp
socsec$age <- as.factor(socsec$age); levels(socsec$age) <- agegrp
retired$age <- as.factor(retired$age); levels(retired$age) <- agegrp

#### Gr�ficos ####
### Idade-Educa��o
xcex <- 1.2
(geduc <- 
    barchart(prop ~ age | as.factor(year), data = educ, groups = educ, layout = c(5,1),
             horizontal = F, col = gray.colors(4,.3,.95, rev = T), index.cond = list(c(1,2,3,4,5)),
             xlab = 'Idade', ylab = '%', box.ratio = 1, stack = T,
             scales = list(x = list(alternating = F, rot = 45, cex = 1)),
             par.strip.text = list(fontfamily = "serif", cex = xcex),
             par.settings = list(axis.text = list(fontfamily = 'serif',cex = xcex),
                                 par.xlab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.ylab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.main.text = list(fontfamily = 'serif',cex = xcex),
                                 par.sub.text = list(fontfamily = 'serif',cex = xcex),
                                 strip.background = list(col = 'white'),
                                 superpose.polygon = list(col = gray.colors(4,.3,.95, rev = T))),
             auto.key = list(space = 'bottom', corner = c(.95,.85), cex = xcex,
                             columns = 2, fontfamily = 'serif',
                             text = c('Menor que o prim�rio','Prim�rio',
                                      'Secund�rio','Terci�rio'))))

### Idade-Posi��o_emprego
xcex <- 1.2
(gposemp <- 
    barchart(prop ~ age | as.factor(year), data = clswrk, groups = clswrk, layout = c(5,1),
             horizontal = F, col = gray.colors(5,.2,.95, rev = F), index.cond = list(c(1,2,3,4,5)),
             xlab = 'Idade', ylab = '%', box.ratio = 1,stack = T,
             scales = list(x = list(alternating = F, rot = 45, cex = 1)),
             par.strip.text = list(fontfamily = "serif", cex = xcex),
             par.settings = list(axis.text = list(fontfamily = 'serif',cex = xcex),
                                 par.xlab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.ylab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.main.text = list(fontfamily = 'serif',cex = xcex),
                                 par.sub.text = list(fontfamily = 'serif',cex = xcex),
                                 strip.background = list(col = 'white'),
                                 superpose.polygon = list(col = gray.colors(5,.2,.95, rev = F))),
             auto.key = list(space = 'bottom', corner = c(.95,.85), cex = xcex,
                             columns = 3, fontfamily = 'serif')))

### Idade-Contribui��o_previd�ncia
xcex <- 1.2
(gsocsec <- 
    barchart(prop ~ age | as.factor(year), data = socsec, groups = socsec, layout = c(5,1),
             horizontal = F, col = gray.colors(2,.3,.95, rev = T), index.cond = list(c(1,2,3,4,5)),
             xlab = 'Idade', ylab = '%', box.ratio = 1, stack = T,
             scales = list(x = list(alternating = F, rot = 45, cex = 1)),
             par.strip.text = list(fontfamily = "serif", cex = xcex),
             par.settings = list(axis.text = list(fontfamily = 'serif',cex = xcex),
                                 par.xlab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.ylab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.main.text = list(fontfamily = 'serif',cex = xcex),
                                 par.sub.text = list(fontfamily = 'serif',cex = xcex),
                                 strip.background = list(col = 'white'),
                                 superpose.polygon = list(col = gray.colors(2,.3,.95, rev = T))),
             auto.key = list(space = 'bottom', corner = c(.95,.85), cex = xcex,
                             columns = 2, fontfamily = 'serif',
                             text = c('N�o contribuintes','Contribuintes'))))

### Idade-Aposentadoria_pens�o
xcex <- 1.2
(gaposent <- 
    barchart(prop ~ age | as.factor(year), data = retired, groups = retired, layout = c(5,1),
             horizontal = F, col = gray.colors(2,.3,.95, rev = T), index.cond = list(c(1,2,3,4,5)),
             xlab = 'Idade', ylab = '%', box.ratio = 1, stack = T,
             scales = list(x = list(alternating = F, rot = 45, cex = 1)),
             par.strip.text = list(fontfamily = "serif", cex = xcex),
             par.settings = list(axis.text = list(fontfamily = 'serif',cex = xcex),
                                 par.xlab.text = list(fontfamily = 'serif',cex = xcex),
                                 par.ylab.text = list(fontfamily = 'serif',cex = xcex),
                                 #layout.widths = list(xlab.axis.padding = .1),
                                 par.main.text = list(fontfamily = 'serif',cex = xcex),
                                 par.sub.text = list(fontfamily = 'serif',cex = xcex),
                                 strip.background = list(col = 'white'),
                                 superpose.polygon = list(col = gray.colors(2,.3,.95, rev = T))),
             auto.key = list(space = 'bottom', corner = c(.95,.85), cex = xcex,
                             columns = 3, fontfamily = 'serif',
                             text = c('N�o aposentados','Aposentados'))))