//Referência : https://neo4j.com/developer/guide-import-csv/

//Apenas lendo um arquivo
LOAD CSV WITH HEADERS
FROM 'file:///subPasta/nomeArquivo.csv' AS row RETURN (row)  //localmente
//FROM 'https://data.neo4j.com/northwind/customers.csv' AS row RETURN (row)   //Internet
//FROM 'https://data.neo4j.com/northwind/customers.csv' AS row RETURN (row) FIELDTERMINATOR ';'  //Definindo o tipo de separador de colunas


//Apenas lendo um arquivo localmente
LOAD CSV WITH HEADERS
FROM 'file:///subPasta//2-movieData.csv' AS row
//Filtra linhas a importar
WITH row WHERE row.Entity = "Movie"
RETURN
row.tmdbId,
row.imdbId,
toFloat(row.imdbRating), //Converte para float
row.released,
row.title,
toInteger(row.year), //Converte para inteiro
row.poster,
toInteger(row.runtime), //Converte para inteiro
split(coalesce(row.countries,""), "|"), //Converte para lista
toInteger(row.imdbVotes), //Converte para inteiro
toInteger(row.revenue), //Converte para inteiro
row.plot,
row.url,
toInteger(row.budget), //Converte para inteiro
split(coalesce(row.languages,""), "|"), //Converte para lista
split(coalesce(row.genres,""), "|") //Converte para lista
LIMIT 10  //Apenas 10 primeiros registros

//Importa os dados se não exisitir pois está usando o MERGE
:auto USING PERIODIC COMMIT  //:auto usado para otimizar memória. Periodic commit, vai gravando os registros na tabela periodicamente
LOAD CSV WITH HEADERS FROM 'file:///Movies//2-movieData.csv' AS row
WITH row WHERE row.Entity = "Movie"
MERGE (c:Movie {Codigo: row.Codigo,Hora:row.Hora,Valor:row.Valor}) 

//Exemplo importanto tudo
//Codigo | Hora     |	Valor
//------ | -------- | ------
//1111   | 15:07:00 | 5.00
//2222   | 15:07:00 | 6.00
//3333   | 14:48:00 | 2.00
//3333   | 14:49:00 | 130.00
//4444   | 14:55:00 | 10.00
//4444   | 14:58:00 | 100.00
//4444   | 15:00:00 | 200.00


//Importa os dados se não exisitir pois está usando o MERGE, e atualiza os demais campos, no comando SET, quando exisitir
:auto USING PERIODIC COMMIT  //:auto usado para otimizar memória. Periodic commit, vai gravando os registros na tabela periodicamente
LOAD CSV WITH HEADERS FROM 'file:///Movies//2-movieData.csv' AS row
WITH row WHERE row.Entity = "Movie"
MERGE (c:Movie {Codigo: row.Codigo}) 
ON CREATE SET
c.Hora=row.Hora,
c.Valor=row.Valor

//Exemplo importanto e atualizando
//Codigo | Hora     |	Valor
//------ | -------- | ------
//1111   | 15:07:00 | 5.00
//2222   | 15:07:00 | 6.00
//3333   | 14:48:00 | 2.00
//4444   | 14:55:00 | 10.00



//Importa os dados e cria as duas tabelas Movie and Genre
:auto USING PERIODIC COMMIT  //:auto usado para otimizar memória. Periodic commit, vai gravando os registros na tabela periodicamente
LOAD CSV WITH HEADERS FROM 'file:///Movies//2-movieData.csv' AS row
WITH row WHERE row.Entity = "Movie"
MERGE (m:Movie {movieId: row.movieId})
ON CREATE SET
m.tmdbId = row.tmdbId,
m.imdbRating = toFloat(row.imdbRating),
m.year = toInteger(row.year),
m.countries = split(coalesce(row.countries,""), "|"),
CASE row.born WHEN "" THEN null ELSE date(row.born) END
WITH m,split(coalesce(row.genres,""), "|") AS genres
UNWIND genres AS genre  //UNWIND, you can transform any list back into individual rows
WITH m, genre
MERGE (g:Genre {name:genre})
MERGE (m)-[:IN_GENRE]->(g)
