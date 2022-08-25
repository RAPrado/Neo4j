//Referência : https://neo4j.com/docs/cypher-manual/current/syntax/temporal/

//Converter string no formato yyyy-mm-dd
case when row.campoData = "." then null else date(row.campoData) end

//Converter string no formato hh:mm:ss
case when row.campoHora = "." then null else time(row.campoHora) end

//Converter string no formato yy.mm.dd (22.08.01)
date('20'+replace(row.campoData,".","-")) //Concatena 20 para transformar em 2022.
