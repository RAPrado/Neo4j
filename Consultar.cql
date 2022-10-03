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
