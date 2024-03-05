-- ***************************************************************
-- ***************************************************************
-- ***************************************************************
-- ***************************************************************

DROP PROCEDURE IF EXISTS LoopTest;
DROP PROCEDURE IF EXISTS PopularVendas;
DROP TABLE IF EXISTS Vendas;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS CadastroCliente;
DROP TABLE IF EXISTS Cidade;
DROP TABLE IF EXISTS Estado;

/*
Tabela de dominio que representa os estados brasileiros
*/

CREATE TABLE Estado 
(
	Id TINYINT NOT NULL AUTO_INCREMENT, 
	Descricao VARCHAR(150) NOT NULL, 
	PRIMARY KEY (Id) 
);

INSERT INTO Estado (Descricao) 
VALUES ('Sao Paulo'), 
       ('Rio de Janeiro'), 
	   ('Minas Gerais');

/*
Tabela de dominio que representa as cidades brasileiras
Utiliza-se o codigo da tabela de domonio de Estado para identificar a qual estado pertence cada cidade
*/

CREATE TABLE Cidade 
(
	Id SMALLINT NOT NULL AUTO_INCREMENT, 
	Id_Estado TINYINT NOT NULL, 
	Descricao VARCHAR(250) NOT NULL, 
	PRIMARY KEY (Id), 
	FOREIGN KEY (Id_Estado) REFERENCES Estado (Id) 
);

INSERT INTO Cidade (Id_Estado, Descricao) 
VALUES (1, 'Santo Andre'), 
       (1, 'Sao Bernardo do Campo'), 
	   (1, 'Sao Caetano do Sul'), 
	   (2, 'Duque de Caxias'), 
	   (2, 'Niteroi'), 
	   (2, 'Petropolis'), 
	   (3, 'Uberlandia'), 
	   (3, 'Contagem'), 
	   (3, 'Juiz de Fora');

/*
Representacao da tabela de cadastro de clientes
Ha vinculo do cliente com a tabela de dominio Cidade
Como a tabela de dominio Cidade ja possui vinculo com a tabela Estado, nao e necessario criar vinculo forte entre a tabela CadastroCliente e a tabela Estado
*/

CREATE TABLE CadastroCliente 
(
	Id INTEGER NOT NULL AUTO_INCREMENT, 
	Nome VARCHAR(150) NOT NULL, 
	Endereco VARCHAR(250) NOT NULL, 
	Id_Cidade SMALLINT NOT NULL, 
	Email VARCHAR(250) NOT NULL, 
	Telefone1 VARCHAR(20) NOT NULL, 
	Telefone2 VARCHAR(20) NULL, 
	Telefone3 VARCHAR(20) NULL, 
	PRIMARY KEY (Id), 
	FOREIGN KEY (Id_Cidade) REFERENCES Cidade (Id) 
);

INSERT INTO CadastroCliente (Nome, Endereco, Id_Cidade, Email, Telefone1, Telefone2, Telefone3) 
VALUES ('Cliente 1',  'Rua 1',  1, 'cliente_1@email.com',  '(11) 0000-0000', NULL, NULL), 
       ('Cliente 2',  'Rua 2',  1, 'cliente_2@email.com',  '(11) 0000-0000', '(11) 1111-1111', '(11) 2222-2222'), 
	   ('Cliente 3',  'Rua 3',  1, 'cliente_3@email.com',  '(11) 0000-0000', '(11) 1111-1111', '(11) 2222-2222'), 
	   ('Cliente 4',  'Rua 4',  2, 'cliente_4@email.com',  '(11) 0000-0000', '(11) 1111-1111', NULL), 
	   ('Cliente 5',  'Rua 5',  2, 'cliente_5@email.com',  '(11) 0000-0000', '(11) 1111-1111', '(11) 2222-2222'), 
	   ('Cliente 6',  'Rua 6',  2, 'cliente_6@email.com',  '(11) 0000-0000', '(11) 1111-1111', NULL), 
	   ('Cliente 7',  'Rua 7',  3, 'cliente_7@email.com',  '(11) 0000-0000', NULL,             NULL), 
	   ('Cliente 8',  'Rua 8',  3, 'cliente_8@email.com',  '(11) 0000-0000', '(11) 1111-1111', '(11) 2222-2222'), 
	   ('Cliente 9',  'Rua 9',  3, 'cliente_9@email.com',  '(11) 0000-0000', '(11) 1111-1111', '(11) 2222-2222'), 
	   ('Cliente 10', 'Rua 10', 4, 'cliente_10@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 11', 'Rua 11', 4, 'cliente_11@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 12', 'Rua 12', 4, 'cliente_12@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 13', 'Rua 13', 5, 'cliente_13@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 14', 'Rua 14', 5, 'cliente_14@email.com', '(21) 0000-0000', '(21) 1111-1111', NULL), 
	   ('Cliente 15', 'Rua 15', 5, 'cliente_15@email.com', '(21) 0000-0000', '(21) 1111-1111', NULL), 
	   ('Cliente 16', 'Rua 16', 6, 'cliente_16@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 17', 'Rua 17', 6, 'cliente_17@email.com', '(21) 0000-0000', NULL,             NULL), 
	   ('Cliente 18', 'Rua 18', 6, 'cliente_18@email.com', '(21) 0000-0000', '(21) 1111-1111', '(21) 2222-2222'), 
	   ('Cliente 19', 'Rua 19', 7, 'cliente_19@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 20', 'Rua 20', 7, 'cliente_20@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 21', 'Rua 21', 7, 'cliente_21@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 22', 'Rua 22', 8, 'cliente_22@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 23', 'Rua 23', 8, 'cliente_23@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 24', 'Rua 24', 8, 'cliente_24@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 25', 'Rua 25', 9, 'cliente_25@email.com', '(31) 0000-0000', NULL,             NULL), 
	   ('Cliente 26', 'Rua 26', 9, 'cliente_26@email.com', '(31) 0000-0000', '(31) 1111-1111', '(31) 2222-2222'), 
	   ('Cliente 27', 'Rua 27', 9, 'cliente_27@email.com', '(31) 0000-0000', '(31) 1111-1111', NULL); 

/*
Criacao de uma tabela para cadastro simples de produtos
*/

CREATE TABLE Produto 
(
	Id SMALLINT NOT NULL AUTO_INCREMENT, 
	Descricao VARCHAR(250) NOT NULL, 
	PRIMARY KEY (Id) 
);

/*
Criacao de um indice auxiliar, para filtragem a partir da coluna Descricao da tabela Produto
*/

CREATE INDEX IDX_Produto_Descricao ON Produto (Descricao ASC);

INSERT INTO Produto (Descricao) 
VALUES ('Produto A'), 
       ('Produto B'), 
       ('Produto C');

/*
Criacao de uma tabela de vendas que ira unir informacoes de clientes e produtos
*/

CREATE TABLE Vendas 
(
	Id BIGINT NOT NULL AUTO_INCREMENT, 
	Pedido CHAR(38) NOT NULL, 
	Id_Cliente INTEGER NOT NULL, 
	Id_Produto SMALLINT NOT NULL, 
	Quantidade SMALLINT NOT NULL, 
	Valor_Unitario NUMERIC(9, 2) NOT NULL, 
	Data_Venda TIMESTAMP NOT NULL, 
	Observacao NVARCHAR(100) NULL, 
	PRIMARY KEY (Id, Id_Cliente, Id_Produto), 
	UNIQUE (Pedido, Id_Cliente, Id_Produto), 
	FOREIGN KEY (Id_Cliente) REFERENCES CadastroCliente (Id), 
	FOREIGN KEY (Id_Produto) REFERENCES Produto (Id) 
);

/*
Criacao de um indice auxiliar, para uso no JOIN atraves das colunas Id_Cliente (com a tabela CadastroCliente) e Id_Produto (com a tabela Produto) 
*/

CREATE INDEX IDX_Vendas_Id_Cliente ON Vendas (Id_Cliente ASC);
CREATE INDEX IDX_Vendas_Id_Produto ON Vendas (Id_Produto ASC);

/*
Criacao de um indice auxiliar, para filtragem a partir da coluna Data_Venda da tabela Vendas
*/

CREATE INDEX IDX_Vendas_DataVenda ON Vendas(Data_Venda ASC); 

/*
Populando a tabela de vendas, parte dos dados estaticos mas com datas distintas
*/

DELIMITER $$

CREATE PROCEDURE PopularVendas()
BEGIN
	DECLARE DataInicial TIMESTAMP;
    DECLARE DataFinal TIMESTAMP;
    DECLARE DataAtual TIMESTAMP;
    DECLARE Bloco INT;
    DECLARE BlocoAtual INT;
    DECLARE Pedido CHAR(36);

	SET @DataInicial = STR_TO_DATE('1990-01-01', '%Y-%m-%d');
	SET @DataFinal = STR_TO_DATE('2024-03-01', '%Y-%m-%d');
	SET @DataAtual = @DataInicial;
	SET @Bloco = 5000;
	SET @BlocoAtual = 0;

	START TRANSACTION;

	WHILE (@DataFinal > @DataAtual) DO
		IF (@BlocoAtual >= @Bloco) THEN
			COMMIT;
			START TRANSACTION;
			SET @BlocoAtual = 0;
		END IF;

		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 1, 1, 10, 5.65, @DataAtual), 
				(@Pedido, 1, 2, 10, 7.65, @DataAtual);
				
		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 2, 1, 20, 5.65, @DataAtual), 
				(@Pedido, 2, 2, 20, 7.65, @DataAtual);
		
		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 3, 1, 30, 5.65, @DataAtual);

		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 4, 2, 40, 7.65, @DataAtual);

		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 5, 1, 50, 5.65, @DataAtual), 
				(@Pedido, 5, 2, 50, 7.65, @DataAtual);

		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 6, 2, 60, 7.65, @DataAtual);

		SET @Pedido = UUID();

		INSERT INTO Vendas (Pedido, Id_Cliente, Id_Produto, Quantidade, Valor_Unitario, Data_Venda) 
		VALUES (@Pedido, 7, 1, 70, 5.65, @DataAtual);

		SET @DataAtual = DATE_ADD(@DataAtual, INTERVAL 1 DAY);
		SET @BlocoAtual = @BlocoAtual + 10;
	END WHILE;

	IF (@BlocoAtual > 0) THEN
		COMMIT;
	END IF;
END$$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE LoopTest()
BEGIN
    DECLARE EXECUCAO INT;

    SET @EXECUCAO = 1;
    WHILE @EXECUCAO <= 100 DO
        CALL PopularVendas();
        SET @EXECUCAO = @EXECUCAO + 1;
    END WHILE;
END; //

DELIMITER ;

CALL LoopTest();

-- ***************************************************************
-- ***************************************************************
-- ***************************************************************
-- ***************************************************************