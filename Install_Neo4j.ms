# ****************************************************************************************************
# **********                               Instalação do Java                               **********
# ****************************************************************************************************
1)Testar a versão do java no DOS com o comando : java -version.
Deve aparecer no mínimo versão 11, do contário instalar essa versão do Java sdk ou superior.
2)Instalar no mínimo versao 11 do Java sdk.
3)Verificar se nas variáves de sistemas aparece a chamada para a nova versão.
3.1)Caso contrário, criar uma chamada com o nome de JAVA_HOME, e definir o caminho como por exemplo : C:\Program Files\Zulu\zulu-11
3.2)Em path, validar se há a chamada para a pasta acima/bin, e mover isso, para o topo da lista.

****************************************************************************************************
**********                                Carregar o Neo4j                                **********
****************************************************************************************************
1)Carregar a aplicação
C:\Neo4j\bin\neo4j console

1.1)Ou instalar como servico :
C:\Neo4j\bin\neo4j install-service.

2)Entrar na aplicação web
http://localhost:7474
username 'neo4j' and password 'neo4j'

Versao do Neo4j na maquina : 4.4.5 
Data : 25/03/2022
