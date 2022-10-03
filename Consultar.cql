//Consulta todos relacionamentos entre nós
match(c:Tabela_A)<-[]->(t)<-[]->(o)
return *


//Consulta com uso de IN no where
with ['BRASIL','FRANCA' ] as lista
match(f:Tabela_A)-[:VIAJOU_PARA]->(c:Tabela_B) 
where f.Local in lista
return f,c

//ou

match(f:Tabela_A)-[:VIAJOU_PARA]->(c:Tabela_b) 
where f.Local in ['BRASIL','FRANCA']
return f,c

//Consulta com like
https://stackoverflow.com/questions/13828953/like-clause-in-cypher-query

MATCH (n) where n.Name =~ '.*SUBSTRING.*' return n.Name, n;

start n = node(*) where n.Name contains "substring" return n.Name, n;

start n = node(*) where lower(n.Name) contains lower("substring") return n.Name, n; /*Want case-insensitive? Convert to lower case*/

MATCH (n) WHERE n.name =~ '(?i).*SUBSTRING.*' RETURN n; /*Want case-insensitive? Convert to lower case*/
