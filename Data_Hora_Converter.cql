//Referência : https://neo4j.com/docs/cypher-manual/current/syntax/temporal/

case when row.campoData = "." then null else date(row.campoData) end

case when row.campoHora = "." then null else time(row.campoHora) end
