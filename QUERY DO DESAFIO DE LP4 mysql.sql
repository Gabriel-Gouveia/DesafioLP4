CREATE DATABASE DesafioLP4;

USE DesafioLP4;

CREATE TABLE Colaborador
(
	RE INT AUTO_INCREMENT PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	NASCIMENTO DATETIME NOT NULL,
	CPF VARCHAR(11) NULL,
	RG VARCHAR(9) NOT NULL,
	CARGO VARCHAR(90) NOT NULL,
	ID_DEPARTAMENTO INT NOT NULL,
	DATA_ENTRADA DATETIME,
	TELEFONE VARCHAR(20),
	ANOS_EMPRESA TINYINT,
	ENDERECO VARCHAR(400),
	IDADE INT,
	SALARIO DECIMAL(10,2),
	ID_BENEFICIO INT,
    ID_TREINAMENTO INT,
    ID_FEEDBACK INT,
    ID_HISTORICO INT,
    ID_PLANOEVOLUCAO INT
);


CREATE TABLE BENEFICIO
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	RE_COLABORADOR INT,
	VR BIT,
	VA BIT,
	VT BIT,
	CONVENIO_MEDICO VARCHAR(30),
	CONVENIO_ODONTO VARCHAR(30),
	GYMPASS BIT,
	AUXILIO_CRECHE BIT,
	PREVIDENCIA_PRIVADA VARCHAR(30),
	 CONSTRAINT fk_RE_COLABORADOR FOREIGN KEY (RE_COLABORADOR)
		REFERENCES COLABORADOR(RE)
		ON DELETE CASCADE
);


CREATE TABLE TREINAMENTO
(
	ID INT PRIMARY KEY,
	NOME VARCHAR(100),
	DESCRICAO VARCHAR (5000),
	AREA VARCHAR (40),
	DATA_CADASTRO DATETIME,
	CARGA_HORARIA INT,
	STATUS BIT,
	INSCRITOS INT,
	ULTIMA_MODIFICACAO DATETIME,
	NOTA TINYINT
);


CREATE TABLE COLABORADOR_GRUPO_TREINAMENTO
(
	RE_COLABORADOR INT,
	ID_GRUPO_TREINO INT
);



CREATE TABLE PLANO_EVOLUCAO
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	RE_COLABORADOR INT NOT NULL,
	DATA_INICIO_PLANO DATETIME NOT NULL,
	DATA_FIM_PLANO DATETIME,
	METAS VARCHAR(5000) NOT NULL,
	ID_GRUPO_TREINAMENTO INT,
	CONSTRAINT fk_RE_COLABORADOR_EVOLUCAO FOREIGN KEY (RE_COLABORADOR)
		REFERENCES COLABORADOR(RE)
		ON DELETE CASCADE
);


CREATE TABLE GRUPO_TREINAMENTOS
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	ID_PLANO_EVOLUCAO INT,
	RE_COLABORADOR INT,
	TREINAMENTO_1 INT,
	TREINAMENTO_2 INT,
	TREINAMENTO_3 INT,
	TREINAMENTO_4 INT,
	TREINAMENTO_5 INT,
	TREINAMENTO_6 INT,
	TREINAMENTO_7 INT,
	TREINAMENTO_8 INT,
	TREINAMENTO_9 INT,
	TREINAMENTO_10 INT,
	TREINAMENTO_11 INT,
	TREINAMENTO_12 INT,
	TREINAMENTO_13 INT,
	TREINAMENTO_14 INT,
	TREINAMENTO_15 INT,
	FEZ_TREINAMENTO_1 BIT,
	FEZ_TREINAMENTO_2 BIT,
	FEZ_TREINAMENTO_3 BIT,
	FEZ_TREINAMENTO_4 BIT,
	FEZ_TREINAMENTO_5 BIT,
	FEZ_TREINAMENTO_6 BIT,
	FEZ_TREINAMENTO_7 BIT,
	FEZ_TREINAMENTO_8 BIT,
	FEZ_TREINAMENTO_9 BIT,
	FEZ_TREINAMENTO_10 BIT,
	FEZ_TREINAMENTO_11 BIT,
	FEZ_TREINAMENTO_12 BIT,
	FEZ_TREINAMENTO_13 BIT,
	FEZ_TREINAMENTO_14 BIT,
	FEZ_TREINAMENTO_15 BIT,
	CONSTRAINT fk_RE_COLABORADOR_GRUPO FOREIGN KEY (RE_COLABORADOR)
		REFERENCES COLABORADOR(RE)
		ON DELETE CASCADE
--	CONSTRAINT fk_PLANO_GRUPO FOREIGN KEY (ID_PLANO_EVOLUCAO)
	--	REFERENCES PLANO_EVOLUCAO(ID)
	--	ON DELETE CASCADE
);


CREATE TABLE HISTORICO
(
	ID INT PRIMARY KEY,
	RE_COLABORADOR INT NOT NULL,
	ID_DEPARTAMENTO INT NOT NULL,
	NOME_DEPARTAMENTO VARCHAR(100),
	CARGO VARCHAR(100),
	DATA_INICIO DATETIME,
	DATA_FIM DATETIME,
	TEMPO_TOTAL INT,
	CONSTRAINT fk_RE_COLABORADOR_HISTORICO FOREIGN KEY (RE_COLABORADOR)
		REFERENCES COLABORADOR(RE)
		ON DELETE CASCADE
);


CREATE TABLE DEPARTAMENTO 
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	NOME VARCHAR(50),
	RESPONSAVEL VARCHAR(100),
	RE_RESPONSAVEL INT,
	EXISTE BIT
);


CREATE TABLE FEEDBACK
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	RE_COLABORADOR INT,
	RE_GESTOR INT,
	PONTOS_FORTES VARCHAR(1000),
	PONTOS_FRACOS VARCHAR(1000),
	ACOES_ESPERADAS VARCHAR(1000),
	METAS VARCHAR(2000),
	DATA_FEEDBACK DATETIME,
	PRAZO_CUMPRIMENTO INT,
	CONSTRAINT fk_RE_COLABORADOR_FEEDBACK FOREIGN KEY (RE_COLABORADOR)
		REFERENCES COLABORADOR(RE)
		ON DELETE CASCADE
);


CREATE TABLE USUARIOS
(
	RE INT PRIMARY KEY,
	SENHA VARCHAR(100),
	ROLE VARCHAR(50),
    ID_DEPARTAMENTO INT
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'RH',
	'Pietro Guedes',
	1122,
	1
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Finanças',
	'Cristiano Dias',
	1123,
	1
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Desenvolvimento',
	'Eduardo Rosalém',
	1124,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - QA',
	'Vitória Santos Lemos',
	1125,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Infra',
	'Cleiton Alberto',
	1126,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Negócios',
	'Gabriel Baptista',
	1127,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Suporte',
	'Fábio Janones',
	1128,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Suporte de produtos',
	'Henrique Silva',
	1129,
	1
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Suporte - Garantia',
	'Everton Dirceu',
	1130,
	1
);



INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Compliance',
	'Augusto Ribeiro Prestes',
	1131,
	1
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Marketing',
	'Melissa Silva',
	1132,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Produção',
	'Claudinei Roberto',
	1133,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Logística',
	'Isadora Pereira',
	1134,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Meio ambiente e sustentabilidade',
	'Heloísa Martins',
	1135,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Gestão de processos',
	'Paulo Roberto Costa',
	1136,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Qualidade',
	'Yolanda Abílio',
	1137,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Pesquisa e desenvolvimento',
	'Márcio Rodrigues da Silva',
	1138,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Planejamento de produção',
	'Lucas Castro',
	1139,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Manutenção',
	'Wendel Ângelo',
	1140,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Automação',
	'Flávio Gutierrez',
	1141,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Compras',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Engenharia de produção',
	NULL,
	NULL,
	0
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Almoxarifado',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Construção',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Protótipos',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Usinagem',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Power BI',
	'Isabella Santos',
	1145,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Jurídico',
	'Tâmia Maria',
	1142,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Segurança da informação',
	'Tiago Rodrigues',
	1143,
	1
);



INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Segurança no trabalho',
	'João Silva Ferreira',
	1144,
	1
);

 INSERT INTO Colaborador 
 VALUES
 (
  1122,
 'Pietro Guedes',
 '1983-12-19 17:40:12',
 '12345678901',
 '123',
 'Diretor de RH',
  1,
  '2009-05-18 00:00:00',
  '1234-5678',
  13,
  'São Caetano do Sul, Barcelona, Rua Bell Alliance, 4001',
  39,
  20000,
  1,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1122,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO Colaborador 
 VALUES
 (
  1123,
 'Cristiano Dias',
 '1985-06-18 01:32:02',
 '11111111101',
 '09138777',
 'Diretor de Finanças',
  2,
  '2017-04-12 00:00:00',
  '5678-1234',
  5,
  'São Caetano do Sul, Vila Gerty, Rua das Tulipas, 40',
  37,
  37000,
  2,
  NULL,
  NULL,
  NULL,
  NULL
 );

INSERT INTO Colaborador 
 VALUES
 (
  1124,
 'Eduardo Rosalém',
 '1979-02-21 00:32:02',
 '12121212121',
 '09138788',
  'Coordenador de TI e Engenharia de Software',
  3,
  '2010-09-13 00:00:00',
  '7070-7070',
  12,
  'São Bernardo do Campo, Baeta Neves, Avenida das Nações, 56',
  43,
  12000,
  3,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1125,
 'Vitória Santos Lemos',
 '1988-03-21 00:30:02',
 '55500077709',
 '333265',
  'Coordenadora de QA',
  4,
  '2020-01-15 00:00:00',
  '9999-9998',
  2,
  'São Bernardo do Campo, Baeta Neves, Rua José, 6',
  34,
  12000,
  4,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
INSERT INTO Colaborador 
 VALUES
 (
  1126,
 'Cleiton Alberto',
 '1984-10-22 00:00:00',
 '44355578809',
 '321265',
  'Coordenador de Infraestrutura de TI',
  5,
  '2015-07-17 00:00:00',
  '9779-7998',
  7,
  'São Bernardo do Campo, Baeta Neves, Rua Lourenço, 33',
  38,
  9000,
  5,
  NULL,
  NULL,
  NULL,
  NULL
 );

INSERT INTO Colaborador 
 VALUES
 (
  1127,
 'Gabriel Baptista',
 '1986-03-16 00:00:00',
 '10245678901',
 '111111119',
  'Tech Leader',
  6,
  '2012-06-08 00:00:00',
  '4002-8922',
  10,
  'Barueri, , Alameda Equador, 21',
  36,
  27500,
  6,
  NULL,
  NULL,
  NULL,
  NULL
 );

INSERT INTO Colaborador 
 VALUES
 (
  1128,
 'Fábio Janones',
 '1990-02-02 00:00:00',
 '10110110101',
 '334889091',
  'Coordenador de Suporte de TI',
  7,
  '2007-04-07 00:00:00',
  '4001-8911',
  15,
  'Suzano, Rua Brasil, 27',
  32,
  7500,
  7,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1129,
 'Henrique Silva',
 '1990-02-02 00:00:00',
 '10110110101',
 '334889091',
  'Coordenador de Suporte de Produtos',
  8,
  '2007-04-07 00:00:00',
  '4001-8911',
  15,
  'São Paulo, Rua Brasil, 77',
  32,
  7500,
  8,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1130,
 'Everton Dirceu',
 '1978-05-15 00:00:00',
 '10111322',
 '335089881',
  'Coordenador de Suporte de Garantia',
  9,
  '2013-11-08 00:00:00',
  '4000-8901',
  8,
  'Suzano, Rua das Rosas, 20',
  44,
  6000,
  9,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1131,
 'Augusto Ribeiro Prestes',
 '1995-07-07 00:00:00',
 '10110507',
 '335080707',
  'Diretor de Compliance',
  10,
  '2013-11-03 00:00:00',
  '4232-8991',
  9,
  'Diadema, Rua Sávio Borges, 15',
  27,
  13000,
  10,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
INSERT INTO Colaborador 
 VALUES
 (
  1132,
 'Melissa Silva',
 '1996-07-07 00:00:00',
 '10113145',
 '33501305',
  'Gerente de Marketing',
  11,
  '2017-02-07 00:00:00',
  '3556-6991',
  5,
  'Diadema, Rua dos Casas, 113',
  26,
  9725,
  11,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1133,
 'Claudinei Roberto',
 '1975-08-23 00:00:00',
 '101131',
 '33505',
  'Gerente de Produção',
  12,
  '2003-02-07 00:00:00',
  '3577-0891',
  19,
  'Santo André, Rua das Limeiras, 1100',
  47,
  8700,
  12,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1134,
 'Isadora Pereira',
 '1995-09-21 00:00:00',
 '10113122',
 '3350556',
  'Gerente de Logística',
  13,
  '2019-02-07 00:00:00',
  '3400-1821',
  3,
  'Santo André, Rua das Palmeiras, 121',
  27,
  9800,
  13,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1135,
 'Heloísa Martins',
 '1993-09-21 00:00:00',
 '9999999901',
 '3332245',
  'Coordenadora de Meio Ambiente',
  14,
  '2018-02-07 00:00:00',
  '4560-9021',
  4,
  'Santo André, Avenida Pêssego, 308',
  29,
  6200,
  14,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
INSERT INTO Colaborador 
 VALUES
 (
  1136,
 'Paulo Roberto Costa',
 '1969-04-16 00:00:00',
 '09129346',
 '473829',
  'Gerente de Processos',
  15,
  '2008-02-07 00:00:00',
  '9920-9021',
  14,
  'Santo André, Avenida Pêssego, 192',
  53,
  6200,
  15,
  NULL,
  NULL,
  NULL,
  NULL
 );

INSERT INTO Colaborador 
 VALUES
 (
  1137,
 'Yolanda Abílio',
 '1990-04-01 00:00:00',
 '22345678909',
 '5554301',
  'Gerente de Qualidade',
  16,
  '2016-10-07 00:00:00',
  '9933-3321',
  6,
  'Santo André, Avenida da Liberdade, 82',
  32,
  7600,
  16,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1138,
 'Márcio Rodrigues da Silva',
 '1977-06-15 00:00:00',
 '201998103',
 '7674321',
 'Coordenador de Pesquisa e Desenvolvimento',
  17,
  '2003-03-09 00:00:00',
  '2233-4521',
  19,
  'Santo André, Bairro Jardim, Avenida Industrial, 1',
  45,
  15000,
  17,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1139,
 'Lucas Castro',
 '1989-11-25 00:00:00',
 '78900345',
 '123456',
 'Gerente de Planejamento de Produção',
  18,
  '2019-03-09 00:00:00',
  '5577-4021',
  3,
  'São Paulo, Vila Mariana, Avenida Senador Carvalho, 10',
  33,
  7000,
  18,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1140,
 'Wendel Ângelo',
 '1989-10-30 00:00:00',
 '78911345',
 '1212156',
 'Coordenador de Manutenção',
  19,
  '2018-03-09 00:00:00',
  '5878-4821',
  4,
  'São Paulo, São Matheus, Avenida Ruy Barbosa, 32',
  33,
  6300,
  19,
  NULL,
  NULL,
  NULL,
  NULL
 );
 
 INSERT INTO Colaborador 
 VALUES
 (
  1141,
 'Flávio Gutierrez',
 '1987-10-30 00:00:00',
 '00911345',
 '0012156',
 'Coordenador de Automação',
  20,
  '2012-09-09 00:00:00',
  '5008-1315',
  10,
  'São Paulo, Moema, Rua Bittencourt, 40',
  35,
  8000,
  20,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1145,
 'Isabella Santos',
 '1994-10-30 00:00:00',
 '20911885',
 '2012177',
 'Coordenadora de BI',
  27,
  '2020-05-09 00:00:00',
  '5008-1315',
  2,
  'São Paulo, Jardim Paraíso, Rua das Laranjas, 44',
  28,
  8500,
  21,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1142,
 'Tâmia Maria',
 '1985-05-25 00:00:00',
 '10120230304',
 '7878990',
 'Diretora do Jurídico',
  28,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'São Paulo, Morumbi, Rua Bastos Leitte, 202',
  34,
  22000,
  24,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1143,
 'Tiago Rodrigues',
 '1988-05-25 00:00:00',
 '10120230304',
 '7878990',
 'Chefe de Segurança da Informação',
  29,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'São Paulo, Morumbi, Rua Bastos Leitte, 19',
  34,
  22000,
  22,
  NULL,
  NULL,
  NULL,
  NULL
 );

 INSERT INTO Colaborador 
 VALUES
 (
  1144,
 'João Silva Ferreira',
 '1985-05-25 00:00:00',
 '11122233304',
 '78888',
 'Chefe de Segurança no Trabalho',
  30,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'São Paulo, Morumbi, Rua Belmiro Fontes, 80',
  37,
  10000,
  23,
  NULL,
  NULL,
  NULL,
  NULL
 );

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1123,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1124,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1125,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1126,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1127,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1128,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1129,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1130,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1131,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1132,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1133,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1134,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1135,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1136,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1137,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1138,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1139,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1140,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1141,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1142,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1143,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1144,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

INSERT INTO BENEFICIO
VALUES
(
	NULL,
    1145,
    1,
    1,
    0,
    'INTERMÉDICA',
    'INTERODONTO',
    1,
    1,
    'BRADESCO'
);

ALTER TABLE Colaborador AUTO_INCREMENT = 1;

INSERT INTO USUARIOS VALUES(7, 'teste1234', 'adm', null);
INSERT INTO USUARIOS VALUES(1122, '1234', 'gestor', 1);
INSERT INTO USUARIOS VALUES(1123, '1234', 'gestor', 2);
INSERT INTO USUARIOS VALUES(1124, '1234', 'gestor', 3);
INSERT INTO USUARIOS VALUES(1125, '1234', 'gestor', 4);
INSERT INTO USUARIOS VALUES(1126, '1234', 'gestor', 5);
INSERT INTO USUARIOS VALUES(1127, '1234', 'gestor', 6);
INSERT INTO USUARIOS VALUES(1128, '1234', 'gestor', 7);
INSERT INTO USUARIOS VALUES(1129, '1234', 'gestor', 8);
INSERT INTO USUARIOS VALUES(1130, '1234', 'gestor', 9);
INSERT INTO USUARIOS VALUES(1131, '1234', 'gestor', 10);
INSERT INTO USUARIOS VALUES(1132, '1234', 'gestor', 11);
INSERT INTO USUARIOS VALUES(1133, '1234', 'gestor', 12);
INSERT INTO USUARIOS VALUES(1134, '1234', 'gestor', 13);
INSERT INTO USUARIOS VALUES(1135, '1234', 'gestor', 14);
INSERT INTO USUARIOS VALUES(1136, '1234', 'gestor', 15);
INSERT INTO USUARIOS VALUES(1137, '1234', 'gestor', 16);
INSERT INTO USUARIOS VALUES(1138, '1234', 'gestor', 17);
INSERT INTO USUARIOS VALUES(1139, '1234', 'gestor', 18);
INSERT INTO USUARIOS VALUES(1140, '1234', 'gestor', 19);
INSERT INTO USUARIOS VALUES(1141, '1234', 'gestor', 20);
INSERT INTO USUARIOS VALUES(1142, '1234', 'gestor', 27);
INSERT INTO USUARIOS VALUES(1143, '1234', 'gestor', 28);
INSERT INTO USUARIOS VALUES(1144, '1234', 'gestor', 29);
INSERT INTO USUARIOS VALUES(1145, '1234', 'gestor', 30);



INSERT INTO Colaborador 
VALUES
(
	1,
    'Diogo Andrade',
    '1990-08-15',
    '33344455566',
    '909090',
    'Desenvolvedor júnior',
    3,
    '2018-07-12',
    '8117-1301',
    4,
    'São Paulo, Bras, Rua dos Limões, 907',
    32,
    3500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

-- INSERT INTO Beneficio
-- VALUES
-- (
	-- NULL,
    
-- );

-- select * from Colaborador;

-- select * from Departamento;

-- select * from beneficio;









