//forma 1
//Cria relacionamento Tabela A x Tabela B
:auto USING PERIODIC COMMIT
LOAD CSV WITH HEADERS
FROM 'file:///Arquivo.csv'
AS row FIELDTERMINATOR '|'
WITH row WHERE row.campo = "abc"
MATCH (a:Tabela_A {Campo_1:toInteger(row.Campo1)})
MATCH (b:Tabela_B {Campo_A:row.CampoA})
MERGE (a)-[:Trabalhou_Em]->(b)
//MERGE (a)-[:Trabalhou_Em{Data Entrada:row.Data}]->(b) //Opção com label no relacionamento.
RETURN *;

//forma 2
CREATE
      (Keanu)-[:ACTED_IN {roles:['Neo']}]->(TheMatrix),
      (Carrie)-[:ACTED_IN {roles:['Trinity']}]->(TheMatrix),
      (LillyW)-[:DIRECTED]->(TheMatrix),
      (JoelS)-[:PRODUCED]->(TheMatrix)
MERGE (tom)-[:ACTED_IN {role: 'Sam Baldwin'}]->(sleep)

//Forma 3
MATCH (sandy:User {name: 'Sandy Jones'})
MATCH (clinton:User {name: 'Clinton Spencer'})
MATCH (apollo:Movie {title: 'Apollo 13'})
MATCH (sleep:Movie {title: 'Sleepless in Seattle'})
MATCH (hoffa:Movie {title: 'Hoffa'})
MERGE (sandy)-[:RATED {rating:5}]->(apollo)
MERGE (sandy)-[:RATED {rating:4}]->(sleep)
MERGE (clinton)-[:RATED {rating:3}]->(apollo)
MERGE (clinton)-[:RATED {rating:3}]->(sleep)
MERGE (clinton)-[:RATED {rating:3}]->(hoffa)
