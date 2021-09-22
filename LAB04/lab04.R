# install.packages("rvest")
# install.packages("xml")
# install.packages("XML")

library("rvest")
library("xml")
library("XML")
# caso UPC
upc_url <- 'https://pregrado.upc.edu.pe/carrera-de-ciencias-de-la-computacion/malla-curricular//'
upc_read <- readLines(upc_url, encoding = "UTF-8", warn = FALSE)
parsed_upc <- htmlParse(upc_read, encoding = "UTF-8")
upc_enter_text <- parsed_upc["//p"]
length(upc_enter_text)
upc_enter_text [[10]]

length(getHTMLLinks(upc_read))
length((readHTMLTable(upc_read)))

# caso wikipedia

wiki_url <- 'https://es.wikipedia.org/wiki/Ayuda:Tablas'
wiki_read <- readLines(wiki_url, encoding = "UTF-8", warn = FALSE)
parsed_wiki <- htmlParse(wiki_read, encoding = "UTF-8")
wiki_intro_text <- parsed_wiki["//p"]
length(wiki_intro_text)
length(getHTMLLinks(wiki_read))
length((readHTMLTable(wiki_read)))
names(readHTMLTable(wiki_read))
readHTMLTable(wiki_read)$"Una tabla ejemplo\n"

# caso IMBd
library(xml2)
library(rvest)

pelis <- read_html("https://www.imdb.com/search/title/?count=100&release_date=2020,2020&title_type=feature")

rank_data_html <- html_nodes(pelis,'.text-primary')


rank_data <- html_text(rank_data_html)
head(rank_data)
rank_data<-as.numeric(rank_data)
head(rank_data)


tit_data_html <- html_nodes(pelis,'.lister-item-header a')
tit_data <- html_text(tit_data_html)
head(tit_data)


desc_data_html <- html_nodes(pelis,'.ratings-bar+ .text-muted')
desc_data <- html_text(desc_data_html)
head(desc_data)

desc_data <- gsub("\n","",desc_data)
head(desc_data)


runtime_data_html <- html_nodes(pelis,'.text-muted .runtime')
runtime_data <- html_text(runtime_data_html)
head(runtime_data)

runtime_data<-gsub(" min","",runtime_data)
runtime_data<-as.numeric(runtime_data)
head(runtime_data)


genre_data_html <- html_nodes(pelis,'.genre')
genre_data <- html_text(genre_data_html)
head(genre_data)

genre_data<-gsub("\n","",genre_data)
head(genre_data)

genre_data<-gsub(" ","",genre_data)
head(genre_data)

metascore_data_html <- html_nodes(pelis,'.metascore')
metascore_data <- html_text(metascore_data_html)
head(metascore_data)


metascore_data<-gsub(" ","",metascore_data)
head(metascore_data)

length(metascore_data)

metascore_data<-as.numeric(metascore_data)
head(metascore_data)


genre_data<-gsub(",.*","",genre_data)
head(genre_data)

genre_data<-as.factor(genre_data)
head(genre_data)

rating_data_html <- html_nodes(pelis,'.ratings-imdb-rating strong')
rating_data <- html_text(rating_data_html)
head(rating_data)


rating_data<-as.numeric(rating_data)
head(rating_data)

votos_data_html <- html_nodes(pelis,'.sort-num_votes-visible span:nth-child(2)')
votos_data <- html_text(votos_data_html)
head(votos_data)


votos_data<-gsub(",","",votos_data)
votos_data<-gsub(",","",votos_data)
head(votos_data)


gross_data_html <- html_nodes(pelis,'.ghost~ .text-muted+ span')
gross_data <- html_text(gross_data_html)
head(gross_data)

gross_data<-gsub("M","",gross_data)
gross_data<-substring(gross_data,2,6)
head(gross_data)

length(gross_data)
gross_data<-as.numeric(gross_data)
head(gross_data)

director_data_html <- html_nodes(pelis,'.text-muted+ p a:nth-child(1)')
director_data <- html_text(director_data_html)
head(director_data)


director_data<-as.factor(director_data)
head(director_data)


actor_data_html <- html_nodes(pelis,'.lister-item-content .ghost+ a')
actor_data <- html_text(actor_data_html)
head(actor_data)

actor_data<-as.factor(actor_data)
head(actor_data)

pelis_df<-data.frame(Rank = rank_data, Titulo = tit_data, Runtime = runtime_data, Genero = genre_data, Director = director_data, Actor = actor_data)
str(pelis_df)

write.csv(pelis_df,'pelis_df.csv', row.names = TRUE)


library('ggplot2')
qplot(data = pelis_df,Runtime,fill = Genero,bins = 30, main="Pelicula: Duracion vs Genero")
tot_pelis <- table(pelis_df$Genero)
tot_pelis

head(tot_pelis)

barplot(tot_pelis,main="Distribucion de Peliculas segun Genero",xlab="Genero",ylab="Total Peliculas")

print("¿Qué genero de película fue la que tuvo mayores estrenos? ¿Cuál genero fue el menos
producido?")
print(names(tot_pelis)[which.max(tot_pelis)])

