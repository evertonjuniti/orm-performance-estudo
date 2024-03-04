# orm-performance-estudo
Neste repo você encontra um breve estudo do impacto na performance ao usar ORMs

## Proposta de estudo

Uso de diferentes linguagens de programação e diferentes tipos de bancos de dados para avaliar o uso de ORM.

O intuito é indicar possíveis oportunidades de alterações em código-fonte para alcançar um bom nível de performance e entender como utilizar ORMs de uma melhor forma.

Como opção também usar comandos SQL "raw" para a mesma finalidade relacionada à consulta em si.

O ponto de destaque como conclusão deste estudo é você avaliar o que é melhor dentro do seu atual nível de conhecimento, utilizando o que for mais rápido e prático sem impactar negativamente na performance de sua aplicação no uso de banco de dados.

## Tecnologias

### Bancos de dados

* SQL Server
* MySQL
* PostgreSQL

### Linguagens de programação

* .Net Core (Entity Framework | Dapper)
* Java (Spring Data JPA | Hibernate)
* Python (Django)

### Neste repositório

#### scripts

* SQLServer_Script.sql
* MySQL_Script.sql
* PostgreSQL_Script.sql

Instruções de como subir containers no Docker para o SQL Server, MySQL e PostgreSQL e também como executar os respectivos scripts para criação das tabelas de exemplo com valores.

#### dotnetcore

Solução em .Net Core 8 de uma API simples que faz consulta na entidade de Vendas (com joins e tudo mais), fazendo uso de ORM da maneira incorreta e as oportunidades de uso adequado para não impactar performance.

#### java

Solução em Java 21 utilizando Springboot 3.3.0 (projeto Maven) de uma API simples que faz consulta na entidade de Vendas (com joins e tudo mais), fazendo uso de ORM da maneira incorreta e as oportunidades de uso adequado para não impactar performance.

#### python