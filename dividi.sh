# 
# comando per creare i file
#
# ASL.csv con i dati relativi alle ASL
# comuni.csv con i dati relativi ai comuni
# province.csv con i dati relativi alle province
# regione.csv con i dati relativi alla regione
#
# a partire dal file dati_per_tutto_il_periodo_ultimo.csv
#
awk -F\; '$2=="ASL" {print > "ASL.csv"} $2=="COM" {print > "comuni.csv"} $2=="PROV" {print > "province.csv"} $2=="REG" {print > "regione.csv"}' dati_per_tutto_il_periodo_ultimo.csv
