![piemonte-data-scraper](https://github.com/marcosegato/covid-19-piemonte-data-scraper/workflows/piemonte-data-scraper/badge.svg)
[![GitHub commit](https://img.shields.io/github/last-commit/marcosegato/covid-19-piemonte-data-scraper)](https://github.com/marcosegato/covid-19-piemonte-data-scraper/commits/master)

# Scopo del repository

Lo scopo del repository è di raccogliere informazione sulla pandemia del Coronavirus in Piemonte, utilizzando di preferenza i dati resi disponibili dagli enti pubblici regionali.

## Nota

Questo repository diventerebbe in parte o in toto superfluo qualora gli enti pubblici piemontesi rilasciassero i dati relativi alla pandemia in formato aperto, cioè: in formato ***machine readable***, con **licenza aperta**, certificati, **completi**, il più possibile **disaggregati**, **aggiornati** e con lo **storico** dei dati nel tempo.

# Programmi disponibili

## Scaricamento dei dati dal sito della Regione Piemonte in formato aperto CSV

Dal 10 aprile (o anche da qualche giorno prima, non sono certo di questa data) la Regione Piemonte pubblica alla pagina

[https://www.regione.piemonte.it/web/covid-19-mappa-dei-contagi-piemonte](https://www.regione.piemonte.it/web/covid-19-mappa-dei-contagi-piemonte)

una mappa coropletica con il numero dei positivi per comune. Muovendo il mouse sulla mappa, è visualizzato il numero di positivi per il comune corrispondente alla data di aggiornamento della mappa.

Visto che è impensabile portare il mouse su ognuno dei 1180 circa comuni piemontesi per ottenere il dato dei positivi in tutti i comuni della regione, il programma `scarica_dati_da_regione_piemonte.py` utilizza il pacchetto Selenium per richiedere la pagina contenente la mappa al sito della Regione Piemonte come un qualsiasi web browser e per accedere alla struttura javascript che conserva i dati dei positivi per comune. Questi dati sono salvati in un file CSV nella sottocartella `data` con il nome `dati_aaaa_mm_gg_da_regione_piemonte.csv`.

## Aggregazione di tutti i dati in unico file

A partire dal giorno 10 maggio 2020 è caricato nella cartella `data` un file in formato CSV con nome `dati_per_tutto_il_periodo_ultimo.csv` con tutti i dati disponibili dal 25 marzo 2020 fino alla data di ultimo aggiornamento del file.

Sono inoltre presenti i dati aggregati per provincia, intera regione e ASL.

La tabella seguente elenca le colonne del file con la loro descrizione:

| Nome colonna             | Descrizione |
|--------------------------|-------------|
| Ente | Nome comune, ASL, provincia, regione |
| Tipo	 | Tipo ente, ASL o COM o PRO o REG |
| Provincia	 | Provincia, non significativo per ASL |
| ASL	 | ASL, non significativo per provincia e regione |
| Codice ISTAT	 | codice ISTAT o codice azienda ASL (*) |
| Abitanti	 | numero abitanti |
| Positivi	 | numero positivi al Covid-19 |
| Positivi 1000 abitanti	 | numero positivi al Covid-19 per 1000 abitanti |
| Delta positivi	 | differenza positivi rispetto al giorno precedente |
| Delta positivi 1000 abitanti	 | differenza positivi per 1000 abitanti rispetto al giorno precedente |
| Data | data in formato aaaa/mm/gg |

(\*) Per evitare possibili collisioni tra i codici ISTAT di comuni, province e regione e i codici azienda della ASL,
a questi ultimi è stato aggiunto il prefisso 'A'

# Dati

I programmi sopra illustrati leggono e scrivono file nella sottocartella `data`

| Contenuto | Nome file |
| --- | --- |
| Positivi per comune da Regione Piemonte | dati_aaaa_mm_gg_da_regione_piemonte.csv (1)|
| Aggregazione di tutti i dati in un unico file | dati_per_tutto_il_periodo_ultimo.csv |

_(1) Il file `dati_2020_04_09_da_regione_piemonte.csv` contiene i dati dal 25 marzo al 9 aprile 2020 compresi. Non è stato possibile acquisire i dati relativi alle seguenti giornate: 10-11 aprile 2020, 15-16 maggio 2020, 26-27 luglio 2020, 4 agosto 2020, 13 agosto 2020, 29-31 agosto 2020, 9 settembre 2020, 3 dicembre 2020, 11-12 dicembre 2020, 1-2 gennaio 2021, 21 febbraio 2021, 1 maggio 2021._

## Altre risorse

Elenco dei comuni italiani (ISTAT): [https://www.istat.it/storage/codici-unita-amministrative/Elenco-comuni-italiani.csv](https://www.istat.it/storage/codici-unita-amministrative/Elenco-comuni-italiani.csv)

Corrispondenze ASL-Comuni e popolazione residente (Ministero della Salute): [http://www.dati.salute.gov.it/dati/dettaglioDataset.jsp?menu=dati&idPag=3](http://www.dati.salute.gov.it/dati/dettaglioDataset.jsp?menu=dati&idPag=3)

# Licenza

I programmi sono disponibili secondo i criteri della licenza MIT

I dati originali sono forniti dalla Regione Piemonte e da altri enti pubblici piemontesi e pubblicati sui rispettivi siti istituzionali.
Qualora la Regione Piemonte o un altro ente ritenga che la pubblicazione di questi dati in formato aperto costituisca una violazione di qualche Copyright detenuto dall'ente stesso, i dati verranno rimossi da questo repository su richiesta del detentore di tali diritti.
