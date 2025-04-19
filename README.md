# Cap 7 - Decolando com ciências de dados

Atividades do grupo 14 para Cap 7 - Decolando com ciências de dados, graduação em IA da FIAP

## DADOS DO AGRO

Utilizamos uma fonte de dados públicos relacionados ao agronegócio provientes do Censo Agropecuário conduzido pelo IBGE no ano de 2017, realizamos uma breve analise estatística dos dados. 

Os dados foram baixados utilizando o sistema de consultas de informações SIDRA do IBGE. Selecionamos dados informações sobre estabelecimentos produtores de cafe, suas características de produção, quantidades produzidas, valores de produção e vendas.  A base está dividida por mesorregiões geograficas do território Brasileiro.

Os dados podem ser acessados neste [link](https://sidra.ibge.gov.br/tabela/6960)

## ANÁLISE ESTATÍSTICA DOS DADOS 

Criamos uma base de dados em Excel contendo 548 linhas e 8 colunas, sendo as colunas:

- codigo_mesorregiao: código das mesorregião territorial (variável qualitativa nominal)
- mesorregiao: nome da mesorregião (variável qualitativa nominal)
- tipo_atividade: tipo de produção adotada no território (variável qualitativa nominal)
- nro_produtores_und_cafe_graos: número de produtores de café na mesorregião para cada tipo de atividade (variável quantitativa discreta)
- qtd_produzida_ton_cafe_graos: quantidade em toneladas de café em grãos produzidos (variável quantitativa contínua)
- qtd_vendida_ton_cafe_graos: quantidade em toneladas de café em grãos vendido (variável quantitativa contínua)
- valor_produzido_curr_x_1000_cafe_graos: valores em reais da quantidade de café em grãos produzida (variável quantitativa contínua)
- valor_vendido_currX1000_cafe_graos: valores em reais da quantidade de café em grãos vendida (variável quantitativa contínua)

Posteriormente, criamos uma variável quantitativa ordinal, a partir dos dados acima. Para tanto, criamos previamente um variavel "flag" onde filtramos na base apenas as regiões produtoras e a partir daí criamos a variavel *"classificacao_produtores_tercis"*, que agrupada as mesorregiões com maior e menor número de produtores. 


## ESCOLHA UMA VARIÁVEL QUANTITATIVA E FAÇA UMA ANÁLISE EXPLORATÓRIA DELA EM R CONTENDO:

- As Medidas de Tendência Central: trabalhamos com a variável qtd_produzida_ton_cafe_graos para média, moda e mediana
- As Medidas de Dispersão: trabalhamos com a variável qtd_produzida_ton_cafe_graos para desvio padrão, variancia, mínimo, máximo e amplitude
- As Medidas Separatrizes; trabalhamos com a variável qtd_produzida_ton_cafe_graos para distribuição em quartis
- Uma análise gráfica: construímos um histograma a partir da variável qtd_produzida_ton_cafe_graos

## ESCOLHA UMA VARIÁVEL QUALITATIVA E FAÇA UMA ANÁLISE GRÁFICA DELA EM R.

- Construímos um gráfico de barras usando a variável *"classificacao_produtores_tercis"*. 


## ARQUIVOS ENTREGÁVEIS

- O arquivo Excel com a base de dados: **bd_graos_VF**
- O arquivo R com os códigos utilizados, contendo na primeira linha do código a # com o seu nome completo, RM, fase e capítulo, exemplo: **Trabalho Cap7 vf**
- Demais arquivos: 
  - Fase 2 R project - ambiente do projeto do R criado
  - bd_graos_VF - banco de dados orginal, construido a partir dos dados do IBGE, preparado previamente em Excel
  - Trabalho Cap7 vf - script de R e transformações

## Grupo

| Nome                          | RM         |
|-------------------------------|------------|
| Jonas T V Fernandes           | RM563027   |
| Ranna Leslie                  | RM562685   |
| Raphael da Silva              | RM561452   |
| Raphael Dinelli Neto          | RM562892   |
| Levi Passos Silveira Marques  | RM565557   |



  - Produtores_bd_vf - base de dados final emm csv, com todas as variáveis solicitadas pelo exercício. 



