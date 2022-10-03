//Alterar uma propriedade
MATCH (n:Person) where ID(n) = 12
set p.name:'Teste'
RETURN *

//Update tabela, mudando o tipo de campo de string para data
match (p:Person)
set p.born= case p.born when "" then null else date(p.born) end
with p

//Transformando conteúdo do campo em lista
match (m:Movie)
set m.countries = split(coalesce(m.countries,""), "|")

//Adcionando label
MATCH (p:Person)-[:ACTED_IN]->()
WITH DISTINCT p SET p:Actor
