//Deletar uma propriedade
MATCH (n:Person) where ID(n) = 12
delete n
RETURN *

//Deletar um nó e seu relacionamento
MATCH (n:Person) where ID(n) = 12
detach delete n
RETURN *

//Deletar um relacionamenteo
MATCH ()-[r:NOME RELACIONAMENTO]->()
DELETE r

//Deleta tudo dentro do graph
MATCH (n) DETACH DELETE n
