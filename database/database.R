### Tabalho com bancos - SQLite e duckdb

### 20/04/2025
### 


library(plumber)
library(lubridate)
library(DBI)
library(RSQLite)
library(dplyr)


df <- iris


# para criar, nao deve ter o diretorio no parametro de texto da funcao
# entao, crie no wd e então mova o arquivo para o dir de interesse

con <- dbConnect(drv = RSQLite::SQLite(), "database/data/test.sqlite")

DBI::dbDisconnect(con)


# ingestao de dados no banco, criar e popular tabela

dbWriteTable(conn = con, name = "df_iris", value = df)


tables <- dbListTables(con)
tables



## Coleta de dados
iris_to_collect <- tbl(con, "df_iris")

iris_to_collect %>%
  filter(Sepal.Length> 7.4) %>% 
  collect()



# ingestao de dados no banco, nova linha na tabela
new_iris <- data.frame(
  Sepal.Length = 6.0,
  Sepal.Width = 4.0,
  Petal.Length = 1.8,
  Petal.Width = 0.3,
  Species = "setosa"
)

dbWriteTable(conn = con, name = "df_iris", value = new_iris, append = TRUE)


# OBSERVAR INFORMAÇÕES DA NOVA TABELA
tbl(con, "df_iris") %>% filter(Sepal.Length> 7.4) %>% collect()
glimpse(iris)
tbl(con, "df_iris") %>% collect() %>% summary()


tbl(con, "df_iris") %>%
  arrange(desc(Sepal.Length)) %>% 
  head(6) %>%
  collect()


### TRAZER FORMAS DO DUCKDB




