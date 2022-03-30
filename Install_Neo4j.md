# Baixando o Neo4j
1. Baixar a versão Community  https://neo4j.com/download-center/#community
2. Descompactar o arquivo em uma pasta.
3. Testar a versão do Java instalada no computador, indo no prompt e executarm o comando : java -version. Deve aparecer no mínimo versão 11, do contário instalar essa versão do Java sdk ou superior, conforme o próximo tópico.

# Instalação do Java Open JDK
1. Baixar o Java em  https://www.azul.com/downloads/?package=jdk . Escolher a versão que tenha descrito LTS entre parenteses, que indica que é a versão final homologada. 
2. Após instalar, verificar se nas variáves de sistemas aparece a chamada para a nova versão. Digitar VAR no pesquisar do Windows e dar enter.
3. Caso contrário, criar uma chamada com o nome de JAVA_HOME, e definir o caminho com por exemplo : C:\Program Files\Zulu\zulu-11
4. Em path, validar se há a chamada para a pasta onde o Java foi instalda : C:\Program Files\Zulu\zulu-11\bin, e mover isso, para o topo da lista.

# Carregar o Neo4j
1. Carregar a aplicação
C:\Neo4j\bin\neo4j console

2. Ou instalar como servico :
C:\Neo4j\bin\neo4j install-service.

3. Entrar na aplicação web
http://localhost:7474
username 'neo4j' and password 'neo4j'
