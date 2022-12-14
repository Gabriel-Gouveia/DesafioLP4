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
    PONTOS_FORTES_MARKDOWN BIT,
    PONTOS_FRACOS_MARKDOWN BIT,
    ACOES_MARKDOWN BIT,
    METAS_MARKDOWN BIT,
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
	'Finan??as',
	'Cristiano Dias',
	1123,
	1
);


INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Desenvolvimento',
	'Eduardo Rosal??m',
	1124,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - QA',
	'Vit??ria Santos Lemos',
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
	'TI - Neg??cios',
	'Gabriel Baptista',
	1127,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Suporte',
	'F??bio Janones',
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
	'Produ????o',
	'Claudinei Roberto',
	1133,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Log??stica',
	'Isadora Pereira',
	1134,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Meio ambiente e sustentabilidade',
	'Helo??sa Martins',
	1135,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Gest??o de processos',
	'Paulo Roberto Costa',
	1136,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Qualidade',
	'Yolanda Ab??lio',
	1137,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Pesquisa e desenvolvimento',
	'M??rcio Rodrigues da Silva',
	1138,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Planejamento de produ????o',
	'Lucas Castro',
	1139,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Manuten????o',
	'Wendel ??ngelo',
	1140,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Automa????o',
	'Fl??vio Gutierrez',
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
	'Engenharia de produ????o',
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
	'Constru????o',
	NULL,
	NULL,
	0
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Prot??tipos',
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
	'Jur??dico',
	'T??mia Maria',
	1142,
	1
);

INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'TI - Seguran??a da informa????o',
	'Tiago Rodrigues',
	1143,
	1
);



INSERT INTO DEPARTAMENTO 
VALUES
(
	NULL,
	'Seguran??a no trabalho',
	'Jo??o Silva Ferreira',
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
  'S??o Caetano do Sul, Barcelona, Rua Bell Alliance, 4001',
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
    'INTERM??DICA',
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
 'Diretor de Finan??as',
  2,
  '2017-04-12 00:00:00',
  '5678-1234',
  5,
  'S??o Caetano do Sul, Vila Gerty, Rua das Tulipas, 40',
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
 'Eduardo Rosal??m',
 '1979-02-21 00:32:02',
 '12121212121',
 '09138788',
  'Coordenador de TI e Engenharia de Software',
  3,
  '2010-09-13 00:00:00',
  '7070-7070',
  12,
  'S??o Bernardo do Campo, Baeta Neves, Avenida das Na????es, 56',
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
 'Vit??ria Santos Lemos',
 '1988-03-21 00:30:02',
 '55500077709',
 '333265',
  'Coordenadora de QA',
  4,
  '2020-01-15 00:00:00',
  '9999-9998',
  2,
  'S??o Bernardo do Campo, Baeta Neves, Rua Jos??, 6',
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
  'S??o Bernardo do Campo, Baeta Neves, Rua Louren??o, 33',
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
 'F??bio Janones',
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
  'S??o Paulo, Rua Brasil, 77',
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
  'Diadema, Rua S??vio Borges, 15',
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
  'Gerente de Produ????o',
  12,
  '2003-02-07 00:00:00',
  '3577-0891',
  19,
  'Santo Andr??, Rua das Limeiras, 1100',
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
  'Gerente de Log??stica',
  13,
  '2019-02-07 00:00:00',
  '3400-1821',
  3,
  'Santo Andr??, Rua das Palmeiras, 121',
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
 'Helo??sa Martins',
 '1993-09-21 00:00:00',
 '9999999901',
 '3332245',
  'Coordenadora de Meio Ambiente',
  14,
  '2018-02-07 00:00:00',
  '4560-9021',
  4,
  'Santo Andr??, Avenida P??ssego, 308',
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
  'Santo Andr??, Avenida P??ssego, 192',
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
 'Yolanda Ab??lio',
 '1990-04-01 00:00:00',
 '22345678909',
 '5554301',
  'Gerente de Qualidade',
  16,
  '2016-10-07 00:00:00',
  '9933-3321',
  6,
  'Santo Andr??, Avenida da Liberdade, 82',
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
 'M??rcio Rodrigues da Silva',
 '1977-06-15 00:00:00',
 '201998103',
 '7674321',
 'Coordenador de Pesquisa e Desenvolvimento',
  17,
  '2003-03-09 00:00:00',
  '2233-4521',
  19,
  'Santo Andr??, Bairro Jardim, Avenida Industrial, 1',
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
 'Gerente de Planejamento de Produ????o',
  18,
  '2019-03-09 00:00:00',
  '5577-4021',
  3,
  'S??o Paulo, Vila Mariana, Avenida Senador Carvalho, 10',
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
 'Wendel ??ngelo',
 '1989-10-30 00:00:00',
 '78911345',
 '1212156',
 'Coordenador de Manuten????o',
  19,
  '2018-03-09 00:00:00',
  '5878-4821',
  4,
  'S??o Paulo, S??o Matheus, Avenida Ruy Barbosa, 32',
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
 'Fl??vio Gutierrez',
 '1987-10-30 00:00:00',
 '00911345',
 '0012156',
 'Coordenador de Automa????o',
  20,
  '2012-09-09 00:00:00',
  '5008-1315',
  10,
  'S??o Paulo, Moema, Rua Bittencourt, 40',
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
  'S??o Paulo, Jardim Para??so, Rua das Laranjas, 44',
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
 'T??mia Maria',
 '1985-05-25 00:00:00',
 '10120230304',
 '7878990',
 'Diretora do Jur??dico',
  28,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'S??o Paulo, Morumbi, Rua Bastos Leitte, 202',
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
 'Chefe de Seguran??a da Informa????o',
  29,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'S??o Paulo, Morumbi, Rua Bastos Leitte, 19',
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
 'Jo??o Silva Ferreira',
 '1985-05-25 00:00:00',
 '11122233304',
 '78888',
 'Chefe de Seguran??a no Trabalho',
  30,
  '2013-05-09 00:00:00',
  '9800-5515',
  9,
  'S??o Paulo, Morumbi, Rua Belmiro Fontes, 80',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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
    'INTERM??DICA',
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

INSERT INTO TREINAMENTO VALUES
(
1, 
'Engenharia de Software', 
'Aprenda DDD, TDD, ATDD e DDD. Aprenda diagrama de robustez e diagrama de usu??rios, al??m do diagrama de classes. Aprenda Scrum, Kanban, XP e modelo Spotfy',
'Desenvolvimento de software',
'2019-08-22 00:00:00',
50,
1,
127,
'2021-07-09',
8
);

INSERT INTO TREINAMENTO VALUES
(
2, 
'Qualidade de software', 
'Conte??dos: Modelo 4+1, RM-ODP, ISO 20000, ISO 9001, requisitos n??o funcionais, testes unit??rios, de carga, de aceita????o e integra????o.',
'Desenvolvimento de software e QA',
'2018-10-07 00:00:00',
20,
1,
53,
'2021-04-05',
7
);

INSERT INTO TREINAMENTO VALUES
(
3, 
'DevOps', 
'Entenda a cultura DevOps, hist??ria, origem, CI e CD, pipelines, formas de deploy, boas pr??ticas no Git...',
'Desenvolvimento de software',
'2020-04-11',
17,
1,
205,
'2021-03-10',
6
);

INSERT INTO TREINAMENTO VALUES
(
4, 
'ASP.NET CORE MVC', 
'Aprenda: HTTP, HTTPS, Cliente-Servidor, padr??o MVC, razor pages, tag helpers, selectList, armazenamento de imagens, CRUD com ASP.NET, acesso ao banco com ADO.NET, generics',
'Desenvolvimento de software',
'2021-02-04',
63,
1,
507,
'2022-10-09',
10
);

INSERT INTO TREINAMENTO VALUES
(
5, 
'Java Spring Boot', 
'Aprenda: HTTP, HTTPS, Cliente-Servidor, padr??o MVC, JPA, Hibernate, Spring MVC, Spring Security, Maven, Autentica????o e Autoriza????o (Filter)',
'Desenvolvimento de software',
'2022-02-05',
58,
1,
425,
'2022-10-09',
9
);

INSERT INTO TREINAMENTO VALUES
(
6, 
'MEAN Stack', 
'Aprenda: HTTP, HTTPS, Cliente-Servidor, padr??o MVC, Node.js, Express, Angular, MongoDB, Socket.io, Mongoose, MySQL, Knexjs, Sequelize, TinyMCE, CORS, Two way data binding',
'Desenvolvimento de software',
'2020-10-14',
135,
1,
223,
'2022-01-25',
7
);

INSERT INTO TREINAMENTO VALUES
(
7, 
'Curso completo de Front-End', 
'Aprenda: HTML5, CSS3, Javascript, ECMAScript 6, ES7, ES8, Async/Await, Call-backs, Promises, Fetch API, Axios, SASS, LESS, Bootstrap, Bulma, Tailwind, Flex, Material Design',
'Desenvolvimento de software',
'2022-05-12',
100,
1,
721,
'2022-10-22',
9
);

INSERT INTO TREINAMENTO VALUES
(
8, 
'Curso de Angular', 
'Aprenda: Como funciona o Angular, Hist??ria do Angular, vers??es do Angular, data-binding, componentes, anima????es, formul??rios, diretivas, routing',
'Desenvolvimento de software',
'2022-05-17',
38,
1,
303,
'2022-10-22',
8
);

INSERT INTO TREINAMENTO VALUES
(
9, 
'Curso de React', 
'Aprenda: Como funciona o React, NPM, Yarn, Boilerplate, Snowpack, Vite, Create React app, TypeScript, Componentes, Axios, React Hooks, SPA, Stale-While-Revalidate SWR, React Query, Redux, Nextjs',
'Desenvolvimento de software',
'2021-07-29',
23,
1,
404,
'2022-10-22',
8
);

INSERT INTO TREINAMENTO VALUES
(
10, 
'Python completo', 
'Aprenda: Hist??ria do Python, interpretadores, tipagem fraca e din??mica, l??gica de programa????o, orienta????o a objetos, pip, Python 3, NumPy, Pandas, Matplotlib, Flask',
'Desenvolvimento de software',
'2020-04-29',
25,
1,
900,
'2022-10-22',
10
);

INSERT INTO TREINAMENTO VALUES
(
11, 
'Intelig??ncia artificial', 
'Aprenda: Python 3, pip, NumPy, Pandas, Matplotlib, sistemas especialistas, heur??sticas, busca gulosa, busca a estrela, l??gica fuzzy, Machine Learning, Orange, Tensorflow, Deep Learning, Redes Neurais, Vis??o Computacional, OpenCV',
'Desenvolvimento de software',
'2019-03-19',
39,
1,
43,
'2021-01-02',
7
);

INSERT INTO TREINAMENTO VALUES
(
12, 
'Programa????o Mobile', 
'Aprenda: React Native, Flutter, Dart, Android Studio, Xamarin.Forms e IONIC',
'Desenvolvimento de software',
'2020-06-11',
120,
1,
87,
'2022-05-04',
8
);

INSERT INTO TREINAMENTO VALUES
(
13, 
'Sistemas operacionais', 
'Aprenda: Gerenciadores de processos, mem??ria, arquivo e dispositivos. Deadlocks, Sem??foros, FCFS, Round Robin, prioc, priop, swapping, pagina????o, mem??ria virtual, bootstrap, assembly, C',
'TI em geral',
'2018-09-01',
50,
1,
15,
'2019-03-23',
7
);

INSERT INTO TREINAMENTO VALUES
(
14, 
'Mensageria', 
'Aprenda: Apache Kafka, RabbitMQ, implementa????o com Java, consumidor, produtor, exchange, configura????es, Mosquitto',
'Desenvolvimento de software',
'2017-05-03',
15,
1,
92,
'2020-01-30',
8
);

INSERT INTO TREINAMENTO VALUES
(
15, 
'Curso avan??ado em banco de dados', 
'Aprenda: Dados, informa????es, conhecimento, modelagem de dados, relacionamento, MER, DER, 1FN, 2FN, 3FN, cardinalidade, entidades, SGBD, SQL Server, MySQL, Oracle, Postgre, MariaDB, DynamoDB, CosmosDB, DB2, SQL, DDL, DML, DQL, DTL, DCL, T-SQL, stored procedures, functions, triggers, views, joins, grant e revoke, transactions, cursores, PK, FK, chave candidata, index, tabela tempor??ria, NOSQL, MongoDB, CouchDB, Redis',
'Desenvolvimento de software e DBA',
'2021-11-14',
32,
1,
200,
'2022-10-09',
10
);

INSERT INTO TREINAMENTO VALUES
(
16, 
'Curso complet??o de hardware', 
'Aprenda: Eletrodin??mica, eletr??nica anal??gica, eletr??nica digital, microcontroladores, arduino, prototipagem de hardware, linguagem C, arquitetura de computadores, RISC e CISC, hierarquia de mem??rias, taxonomia de flynn, arquitetura de Harvard, arquitetura de Von Neumann, ULA, unidade de controle, funcionamento do processador gen??rico, n??cleos, threads, clock, pipelines, assembly x86, ARM, Sparc, 8086, IEEE 754, ISA, PLD, FPGA, VHDL, Verilog, CMOS',
'Engenharia',
'2020-08-22',
200,
1,
19,
'2022-05-11',
9
);

INSERT INTO TREINAMENTO VALUES
(
17, 
'Curso de C', 
'Aprenda: L??gica de programa????o, compiladores, ponteiros, funcionamento de mem??rias',
'Desenvolvimento de software',
'2021-12-02',
93,
1,
15,
'2022-05-11',
7
);

INSERT INTO TREINAMENTO VALUES
(
18, 
'Curso de Java', 
'Aprenda: L??gica de programa????o, orienta????o a objetos, compiladores, JVM, JRE, JDK, Eclipse, IntelliJ, NetBeans, linguagem h??brida, bytecode, JEE, JBoss, Apache Tomcat, Servlet, threads, socket, acesso ao banco, CRUD, JPA, Hibernate, Spring Boot, Spark, Micronaut, Java Swing, JavaFX, JSP, Thymeleaf, EJB',
'Desenvolvimento de software',
'2017-12-03',
670,
1,
70,
'2022-08-16',
10
);

INSERT INTO TREINAMENTO VALUES
(
19, 
'Curso de C#', 
'Aprenda: Gera????es de linguagens de programa????o, l??gica booleana, compiladores, tipagem forte e est??tica, tipagem fraca e din??mica, l??gica de programa????o, la??os de repeti????o, condicionais, structs, entrada e sa??da, vetores, random, vari??veis, tipos de dados, plataforma .NET, hist??ria do .NET, .NET Framework, .NET Core, .NET, .NET Standard, Visual Studio, Rider, Windows Forms, WPF, UWP, XAML, Mono, MAUI, Xamarin, orienta????o a objetos, ADO.NET, Entity Framework, Dapper, ASP.NET MVC, ASP.NET WEB API, Minimal APIs, JSON, XML, REST, SOAP, Razor pages, Blazor, SignalR, Serilog, Threads, Cole????es, Generics, LINQ',
'Desenvolvimento de software',
'2022-10-03',
1204,
1,
210,
'2022-10-03',
10
);

INSERT INTO TREINAMENTO VALUES
(
20, 
'Redes de computadores', 
'Aprenda: Modelo OSI, TCP IP, UDP, Protocolos ICMP, DHCP, HTTP, HTTP 1, HTTP 1.1, HTTP 2, HTTP 3, HTTPS, FTP, SFTP, Frame Ethernet, IEEE 802, Aloha, IEEE 802.3, IEEE 802.15.1, PAN, LAN, MAN, WAN, WPAN, WLAN, WMAN, WWAN, Wireless Fidelity, CSMA CA, CSMA CD, fibra ??tica, crossover, switch, gateway, IPV4, IPV6, ARP, NETID, HOSTID, Classes de IPs, DNS, pacote, frame, sequ??ncia de bits, VLAN, STP, RIP, sub-redes, topologias, fragmenta????o, colis??o',
'TI em geral',
'2018-07-07',
1500,
1,
60,
'2022-05-18',
10
);

INSERT INTO TREINAMENTO VALUES
(
21, 
'Seguran??a da informa????o', 
'Aprenda: Redes de computadores, Man in the Middle, DDOS, Malwares, Phishing, criptografias, SHA-1, SHA-256, SHA-512, engenharia social, SSL, TLS, sniffers, keylogger, rob??s, Ransomwares, for??a bruta, dicion??rios',
'TI em geral',
'2018-07-07',
500,
1,
30,
'2022-05-18',
10
);

INSERT INTO TREINAMENTO VALUES
(
22, 
'Compliance', 
'Aprenda: Valores, vis??o e miss??o da empresa, c??digo de conduta, guia anticorrup????o',
'Compliance',
'2014-05-05',
10,
1,
5000,
'2018-12-18',
4
);

INSERT INTO TREINAMENTO VALUES
(
23, 
'Comportamento do consumidor', 
'O curso apresentar?? como diversos fatores influenciam no comportamento do consumidor',
'Marketing',
'2016-06-05',
10,
1,
35,
'2018-12-13',
7
);

INSERT INTO TREINAMENTO VALUES
(
24, 
'Gest??o de processos', 
'O curso apresentar?? como o mapeamento e planejamento de processos ?? crucial em uma empresa',
'Processos, administra????o',
'2016-10-05',
10,
1,
22,
'2017-10-13',
5
);

INSERT INTO TREINAMENTO VALUES
(
25, 
'Comunica????o', 
'Aprenda a falar melhor em uma apresenta????o e falar melhor com o cliente.',
'Todas',
'2015-10-05',
7,
1,
105,
'2017-10-13',
8
);

INSERT INTO TREINAMENTO VALUES
(
26, 
'Programa????o CNC', 
'Aprenda a usinar pe??as por meio de m??quinas CNC, conhecendo os comandos e seus respectivos significados.',
'Produ????o',
'2016-02-05',
15,
1,
105,
'2017-10-13',
8
);

INSERT INTO TREINAMENTO VALUES
(
27, 
'Curso de qualidade', 
'Aprenda as principais ferramentas da qualidade: FMEA, 10 princ??pios TQC, ISO 9001, DFMEA, 6 sigmas, Diagrama de Ishikawa, PDCA, controle estat??stico do processo, poka-yoke',
'Qualidade',
'2017-09-15',
15,
1,
100,
'2019-03-16',
7
);

INSERT INTO TREINAMENTO VALUES
(
28, 
'Curso de controladores, sensores e atuadores', 
'Aprenda: CLP, sensores, funcionamentos de sensores, encoders, controlador PID, sensor indutivo, sensor capacitivo, sensor ??tico, sensor de ultrassom, linguagem ladder',
'Manuten????o, automa????o e produ????o',
'2021-09-15',
20,
1,
150,
'2022-08-26',
9
);

INSERT INTO TREINAMENTO VALUES
(
29, 
'Alguns conceitos te??ricos de soldagem', 
'Aprenda: AWS American Welding Society, interpreta????o de desenhos de solda, s??mbolos de soldagem, solda em campo, solda em chanfro, solda em filete, MIG, MAG, TIG, tipos de gotejamento de solda, solda por press??o, solda por curto-circuito, eletrodo revestido, solda globular, solda por spray',
'Manuten????o, automa????o e produ????o',
'2018-11-15',
20,
1,
45,
'2022-08-26',
10
);

INSERT INTO TREINAMENTO VALUES
(
30, 
'Seguran??a no trabalho', 
'Aprenda: Normas Regulamentadoras, EPIs, EPCs, meio ambiente, CETESB',
'Manuten????o, automa????o e produ????o',
'2016-03-05',
5,
1,
25,
'2018-08-21',
6
);

INSERT INTO TREINAMENTO VALUES
(
31, 
'Resist??ncia dos materiais', 
'Aprenda: Tipos de solicita????o, tra????o, compress??o, cisalhamento, tor????o, flex??o, f??sica est??tica, fis??ca din??mica, treli??a, diagrama tens??o-deforma????o, coeficiente de seguran??a, estamparia, ensaio de torso-flex??o, momento torsor, momento fletor, varignon, crit??rio de Tresca, crit??rio de Von Mises, ductilidade, dureza, resili??ncia, tens??o',
'Manuten????o, automa????o e pesquisa',
'2016-03-05',
30,
1,
38,
'2018-08-21',
8
);

INSERT INTO TREINAMENTO VALUES
(
32, 
'LGPD', 
'Entenda a Lei Geral de Prote????o de Dados do Brasil e GRPD.',
'TI em Geral e Jur??dico',
'2022-03-05',
5,
1,
300,
'2022-08-21',
9
);

INSERT INTO TREINAMENTO VALUES
(
33, 
'Leis trabalhistas', 
'Tenha uma no????o dos direitos e leis trabalhistas',
'Todos',
'2022-03-05',
5,
1,
700,
'2022-08-21',
6
);

INSERT INTO Colaborador 
VALUES
(
	1,
    'Diogo Andrade',
    '1990-08-15',
    '33344455566',
    '909090',
    'Desenvolvedor j??nior',
    3,
    '2018-07-12',
    '8117-1301',
    4,
    'S??o Paulo, Bras, Rua dos Lim??es, 907',
    32,
    3500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

 INSERT INTO Beneficio
 VALUES
 (
	 NULL,
     1,
     1,
     1,
     1,
     'SULAM??RICA',
     NULL,
     0,
     0,
     NULL
 );

UPDATE Colaborador SET ID_BENEFICIO = 25 WHERE RE = 1;

INSERT INTO FEEDBACK VALUES
(
	NULL,
    1,
    1124,
    'O Diogo apresenta bom trabalho em equipe, boa comunica????o e foco. Essas s??o as suas soft skills. Sobre as hard skills, o Diogo ?? bom com orienta????o a objetos, programa????o ass??ncrona e entende de alguns conceitos de redes.',
    'O Diogo n??o possui muito conhecimento em seguran??a, arquitetura e metodologias. Ele precisa aprimorar-se principalmente em conceitos de planejamento de software.',
    'Espera-se que o Diogo aprenda sobre os conceitos abordados nos pontos fracos atrav??s de treinamentos fornecidos e viv??ncia no dia a dia.',
    'A meta ?? que o Diogo apresente uma evolu????o em suas habilidades de planejamento para poder integrar ao time de arquitetura de software',
    '2022-01-20 00:00:00',
    12,
    0,
    0,
    0,
    0
);

INSERT INTO PLANO_EVOLUCAO
VALUES
(
NULL,
1,
'2022-01-20',
'2023-01-20',
'Sobre o plano de evolu????o, a meta ?? que o Diogo acompanhe os treinamentos atribuidos e os ponha em pr??tica no dia a dia.',
1
);

INSERT INTO GRUPO_TREINAMENTOS
VALUES
(
NULL,
1,
1,
1,
3,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
1,
0,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL,
NULL
);

INSERT INTO HISTORICO
VALUES
(
1,
1,
7,
'TI - Suporte',
'Analista de suporte I',
'2018-09-09',
'2021-08-12',
35
);

INSERT INTO HISTORICO
VALUES
(
2,
1,
3,
'TI - Desenvolvimento',
'Desenvolvedor j??nior',
'2021-08-13',
NULL,
14
);

UPDATE Colaborador SET ID_FEEDBACK = 1 WHERE RE = 1;

INSERT INTO Colaborador 
VALUES
(
	2,
    '??ngela Neves',
    '1990-08-10',
    '333453566',
    '9001',
    'Desenvolvedora pleno',
    3,
    '2018-07-12',
    '8117-1301',
    4,
    'S??o Paulo, Bras, Rua dos Lim??es, 808',
    32,
    5500,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
);

 -- select * from Colaborador;

 -- select * from Departamento;

 -- select * from beneficio;
 
 -- select * from TREINAMENTO;
 
 -- select * from FEEDBACK;









