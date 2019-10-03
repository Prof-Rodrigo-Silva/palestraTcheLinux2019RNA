# 1. RNA
# 1.1. Neural Net

# 1º Exemplo
treinoEntrada =  as.data.frame(runif(50, min=0, max=100))
treinoSaida = sqrt(treinoEntrada)

base_treinamento = cbind(treinoEntrada,treinoSaida)

colnames(base_treinamento) = c("Entrada","Saida")

#install.packages("neuralnet")
library(neuralnet)
classificador = neuralnet(Saida ~ Entrada, base_treinamento, hidden = c(50,50),
                          threshold = 0.001)
print(classificador)

plot(classificador)

base_teste = as.data.frame((1:10)^2)

previsao = compute(classificador, base_teste)

ls(previsao)

print(previsao$net.result)

tabela = cbind(base_teste,sqrt(base_teste),
               as.data.frame(previsao$net.result))

colnames(tabela) = c("Entrada","Saida Esperada","Saida RNA")
print(tabela)

#################################################################################
#2º Exemplo

treinamento = iris[sample(1:nrow(iris), 50),]
base_treinamento = treinamento

# Binarize the categorical output
base_treinamento = cbind(base_treinamento, treinamento$Species == 'setosa')
base_treinamento = cbind(base_treinamento, treinamento$Species == 'versicolor')
base_treinamento = cbind(base_treinamento, treinamento$Species == 'virginica')

head(base_treinamento)

names(base_treinamento)[6] = 'setosa'
names(base_treinamento)[7] = 'versicolor'
names(base_treinamento)[8] = 'virginica'

head(base_treinamento)
library(neuralnet)
classificador = neuralnet(setosa+versicolor+virginica ~ Sepal.Length + Sepal.Width
                          + Petal.Length + Petal.Width, data = base_treinamento, 
                          hidden = c(10,10))

print(classificador)
plot(classificador)

#install.packages("NeuralNetTools")
library(NeuralNetTools)
plotnet(classificador)

previsao = compute(classificador, iris[-5])$net.result
previsao

# Colocar várias saídas binárias na saída categórica
func = function(x) {
  return(which(x == max(x)))
}
x = apply(previsao, c(1), func)

predicao = c('setosa', 'versicolor', 'virginica')[x]
predicao

matriz_confusao = table(iris$Species,predicao)
matriz_confusao
library(caret)
confusionMatrix(matriz_confusao)

##########################################################################################
# 1. RNA
# 1.2. h2o

# Deep Learning                            NaÄ±ve Bayes
# Principal Components Analysis (PCA)      K-means
# Stacked Ensembles                        Generalized Linear Models (GLM)
# Gradient Boosting Machine (GBM)          Generalized Low Rank Model (GLRM)
# Distributed Random Forest (DRF)          Word2vec

# www.h2o.ai

#install.packages("h2o",dependencies = T)
library(h2o)
#help("h2o.init")

dados = read.csv2(file.choose(), header = T, sep = ",")

colnames(dados) = c("id","cred_fornecido","sexo","educacao","estado_civil","idade",
                    "pag_passado1","pag_passado2","pag_passado3","pag_passado4","pag_passado5",
                    "pag_passado6","valor_em_conta1","valor_em_conta2","valor_em_conta3",
                    "valor_em_conta4","valor_em_conta5","valor_em_conta6","valor_pag_anterior1",
                    "valor_pag_anterior2","valor_pag_anterior3","valor_pag_anterior4",
                    "valor_pag_anterior5","valor_pag_anterior6","pagou")

dados
dados$id = NULL

library(caTools)
#dividindo conjunto em treino e teste
set.seed(1)
divisao = sample.split(dados$pagou, SplitRatio = 0.75)
base_treinamento = subset(dados, divisao == TRUE)
base_teste = subset(dados, divisao == FALSE)

h2o.init(nthreads = -1)

base_treinamento = as.h2o(base_treinamento)
base_teste = as.h2o(base_teste)

help("h2o.deeplearning")

classificador = h2o.deeplearning(y = "pagou",
                                 training_frame = base_treinamento,
                                 activation = "Rectifier",
                                 hidden = c(150,150,150),
                                 epochs = 1000)

classificador
plot(classificador)

previsoes = h2o.predict(classificador,base_teste[-24])

previsoes

previsoes  = (previsoes > 0.5)
previsoes = as.vector(previsoes)

base_teste = as.data.frame(base_teste)

matriz_confusao = table(base_teste[,24],previsoes)

matriz_confusao

library(caret)
confusionMatrix(matriz_confusao)
h2o.shutdown()
y