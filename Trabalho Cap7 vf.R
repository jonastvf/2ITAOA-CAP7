# FASE 2 - Capitulo 7: Decolando com ciências de dados
# Jonas Tadeu Viccari Fernandes	RM563027
# Ranna Leslie	RM562685
# Raphael da Silva	RM561452
# Raphael Dinelli Neto	RM562892
# Levi Passos Silveira Marques	RM565557

#Sobre:

#   A base de dados contem informações sobre estabelecimentos produtores de cafe,
# suas características de produção, quantidades produzidas, valores de produção e vendas. 
#   A base está dividida por mesorregiões geograficas.
# Fonte: Censo Agropecuario 2017, ibge, 
# https://sidra.ibge.gov.br/tabela/6960

    # Quantitativa Discreta: qtd_produtores_cafe_graos
    # Quantitativa Contínua: qtd_produzida_ton_cafe_graos
    # Qualitativa Nominal: tipo_atividade
    # Qualitativa Ordinal: classificacao_produtores_tercis (criada neste código)


# 1 - Importando os dados

setwd("C:/Users/Userv/OneDrive/Documentos/Fiap/Fase 2")

### Garantindo a tipagem
bd_graos_VF <- read_delim("bd_graos_VF.csv", 
                          +     delim = ";", escape_double = FALSE, col_types = cols(codigo_mesorregiao = col_integer(), 
                                                                                     +         mesorregiao = col_character()), trim_ws = TRUE)
# definindo variavel global do dataset
dados <- bd_graos_VF 

#verificando os dados importados
head(dados)
str(dados)
summary(dados)

#criando as variáveis de filtro do dataset, para considerar apenas as regiões produtoras de café 

### base de dados de produtores de cafe, desconsidera mesorregiões sem produtores da analise

dados$produtor_cafe <- ifelse(dados$nro_produtores_und_cafe_graos > 0, "Região Produtora", "Região Não Produtora")
str(dados$produtor_cafe)

###criando variavel qualitativa ordinal a partir de tercis, e agrupando em regiões de maior e menor número de produtores

produtores <- dados[dados$produtor_cafe == "Região Produtora", ]

str(produtores)

tercis_produtores <- quantile(produtores$nro_produtores_und_cafe_graos, probs = c(0, 1/3, 2/3, 1)) #divisão em tercis

tercis_produtores_unicos <- unique(tercis_produtores)

num_intervalos_produtores <- length(tercis_produtores_unicos) - 1
if (num_intervalos_produtores > 0) {
  produtores$classificacao_produtores_tercis <- cut(produtores$nro_produtores_und_cafe_graos,
                                                    breaks = tercis_produtores_unicos,
                                                    labels = paste0("Nível_", 1:num_intervalos_produtores),
                                                    include.lowest = TRUE,
                                                    ordered_result = TRUE) 
} else {
  produtores$classificacao_produtores_tercis <- factor(rep("Único", nrow(produtores)), ordered = TRUE)
}


####Melhorando os rotulos

levels_atuais <- levels(produtores$classificacao_produtores_tercis)

print(levels_atuais)

novos_rotulos <- c("Número Menor de Produtores", "Número Maior de Produtores")

levels(produtores$classificacao_produtores_tercis) <- novos_rotulos

levels_novos <- levels(produtores$classificacao_produtores_tercis)

print(levels_novos)

View(produtores)


#<qtd_produzida_und_cafe_graos>: analise da variável quantitativa


#### medidas de tendência central

media_producao_2017 <- mean(produtores$qtd_produzida_ton_cafe_graos)

mediana_producao_2017 <- median(produtores$qtd_produzida_ton_cafe_graos)

moda_producao_2017 <- mode(produtores$qtd_produzida_ton_cafe_graos)

print(media_producao_2017)
print(mediana_producao_2017)
print(moda_producao_2017)

#### medidas de dispersão 

desviop_producao_2017 <- sd(produtores$qtd_produzida_ton_cafe_graos)

variancia_producao_2017 <- var(produtores$qtd_produzida_ton_cafe_graos)

max_producao_2017 <- max(produtores$qtd_produzida_ton_cafe_graos)

min_producao_2017 <- min(produtores$qtd_produzida_ton_cafe_graos)

amplitude_producao_2017 <- max_producao_2017 - min_producao_2017

print(desviop_producao_2017)
print(variancia_producao_2017)
print(max_producao_2017)
print(min_producao_2017)
print(amplitude_producao_2017)

# medidas separatrizes
quartis_producao_und <- quantile(produtores$qtd_produzida_ton_cafe_graos, probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)
cat("Quartis da Produção por Unidade:\n")

print(quartis_producao_und)


# analise grafica de <qtd_produzida_und_cafe_graos> para analise da variável quantitativa

hist(produtores$qtd_produzida_ton_cafe_graos, 
     main = "Histograma da Quantidade produzida de café em grãos",
     xlab = "Quantidade produzida em toneladas",
     ylab = "Frequencia",
     col = "lightgreen"
      )

boxplot(produtores$qtd_produzida_ton_cafe_graos, 
     main = "Boxplot da produção de café em grãos",
     xlab = "Quantidade produzida em toneladas",
     col = "lightblue"
)

# analise grafica de <classificacao_produtores_tercis> para analise da variável qualitativa 

barplot(table (produtores$classificacao_produtores_tercis), 
        main = "Qtd de Mesorregiões por Grupo de Número de Produtores",
        xlab = "Grupo de nro de produtores", 
        ylab = "Nro de Mesorregiões", 
        col = c("lightcoral","skyblue"), 
        names.arg = levels(produtores$classificacao_produtores_tercis))

# exportando base final

produtores_vf <- "produtores_bd_vf.csv"

write.csv(produtores, file = produtores_vf, row.names = FALSE)

cat(paste("O arquivo", produtores_vf, "foi exportado com sucessso para seu diretorio de trabalho.\n"))


