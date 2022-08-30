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
