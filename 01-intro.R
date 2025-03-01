#An�lise geral da base de dados (sumariza��o, histogramas, correla��es, etc)

#instala pacotes necessarios (psych para usar funcao describe)
install.packages("psych")
install.packages("ggplot")

#pacotes necessarios
library(readr)
library(psych)
#library(tidyverse)
library(ggplot2)

#leitura da base
spotify <- read.csv("data/Spotify 2010 - 2019 Top 100.csv",stringsAsFactors=TRUE)

#exploracao da base
View(spotify)
str(spotify)

#sumarizacao das vari�veis num�ricas
#summary(spotify)
#mean | standard deviation | min | max | range | standard error
describe(spotify[ , c('dnce', 'nrgy', 'dB', 'spch', 'acous', 'live', 'bpm', 'dur', 'pop')], fast=TRUE)


#Histogramas das vari�veis num�ricas
ggplot(data = spotify, aes(x = dnce)) + geom_histogram() + ggtitle('Dan�abilidade - Qu�o f�cil � dan�ar a m�sica')
ggplot(data = spotify, aes(x = nrgy)) + geom_histogram() + ggtitle('Energia - Qu�o energ�tica � a m�sica')
ggplot(data = spotify, aes(x = dB)) + geom_histogram() + ggtitle('Decibel - Qu�o alta � a m�sica')
ggplot(data = spotify, aes(x = spch)) + geom_histogram() + ggtitle('Cantado - Qu�o a m�sica � focada na palavra falada')
ggplot(data = spotify, aes(x = acous)) + geom_histogram() + ggtitle('Ac�stica - Qu�o ac�stica � a m�sica')
ggplot(data = spotify, aes(x = live)) + geom_histogram() + ggtitle('Ao Vivo - O quanto se parece com uma grava��o ao vivo')
ggplot(data = spotify, aes(x = bpm)) + geom_histogram() + ggtitle('Beats Per Minute - Ritmo da m�sica')
ggplot(data = spotify, aes(x = dur)) + geom_histogram() + ggtitle('Dura��o da m�sica em segundos')
ggplot(data = spotify, aes(x = pop)) + geom_histogram() + ggtitle('Popularidade da m�sica (n�o � um ranking)')

# EXEMPLO DE  MULTIPLOS MINI HISTOGRAM COM BASE EM UMA VARI�VEL CATEG�RICA
#ggplot(data = txhousing, aes(x = median)) + geom_histogram() + ggtitle('Pre�o Mediano das Vendas')+facet_wrap(~city)

spotify1 <- spotify[, c('dnce', 'nrgy', 'dB', 'spch', 'acous', 'live', 'bpm', 'dur', 'pop')]

#grafico de pairs
pairs(spotify1)

#gr?fico de correla??o
source("https://raw.githubusercontent.com/briatte/ggcorr/master/ggcorr.R")
ggcorr(spotify1)
ggcorr(spotify1, nbreaks = 4, palette = "RdGy", label = TRUE, label_size = 3, label_color = "white")


