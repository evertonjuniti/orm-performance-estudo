# scripts
Nesta pasta você encontra o necessário para subir um banco de dados SQL Server, MySQL e PostgreSQL usando Docker, além de dados de exemplo

## Pré-requisitos

* Docker instalado
* DBeaver para rodar os scripts e comandos

## Criação dos containers

Utilize os comandos abaixo para criar os containers no Docker para os bancos de dados:

### SQL Server

`docker run --name SQLServer -p 1433:1433 --hostname sql1 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Minha@senha" -d mcr.microsoft.com/mssql/server:latest`

A porta configurada é a default para o SQL Server: 1433. Você pode mudar caso veja necessidade.

### MySQL

`docker run --name MySQL -p 3306:3306 -e MYSQL_ROOT_PASSWORD=Minha@senha -d mysql:latest`

A porta configurada é a default para o MySQL: 3306. Você pode mudar caso veja necessidade.

### PostgreSQL

`docker run --name PostgreSQL -p 5432:5432 -e POSTGRES_PASSWORD=Minha@senha -d postgres`

A porta configurada é a default para o PostgreSQL: 5432. Você pode mudar caso veja necessidade.

### DBeaver

Configure as conexões para os três bancos de dados. A vantagem do DBeaver é essa, você consegue utilizar vários bancos de dados distintos.

Abaixo um exemplo de como configurar (com SQL Server):

1) Clique no botão de `Nova conexão` (destacado em vermelho)

[imagens/imagem1.png](imagens/imagem1.png)

2) Clique na opção SQL Server e depois clique em avançar

[imagens/imagem2.png](imagens/imagem2.png)

3) Pode manter todas as configurações padrão, somente na parte de autenticação indique o usuário `sa` e a senha `Minha@senha`, depois clique no botão `Concluir`

[imagens/imagem3.png](imagens/imagem3.png)

