CREATE SCHEMA CASO4;

USE CASO4;

CREATE TABLE IF NOT EXISTS ALUNO(
ALUNO_CPF INT PRIMARY KEY,
ALUNO_NOME VARCHAR(50),
ALUNO_DATANASC DATE,
CONSTRAINT FK_ENDERECO FOREIGN KEY(END_ALUNO)
REFERENCES ENDERECO(ID_END)
);

ALTER TABLE ALUNO ADD EMAIL VARCHAR(30);
ALTER TABLE ALUNO DROP COLUMN ALUNO_DATANASC;

CREATE TABLE IF NOT EXISTS INSTRUTORES(
ID_INSTRUTOR INT PRIMARY KEY,
NOME_INSTRUTOR VARCHAR(45),
ESPEC_INSTRUTOR VARCHAR(20),
CONSTRAINT FK_ENDERECO FOREIGN KEY(END_INSTRUTOR)
REFERENCES ENDERECO(ID_END)
);

ALTER TABLE INSTRUTORES ADD SEXO_INSTRUTOR ENUM('M', 'F');

CREATE TABLE IF NOT EXISTS ENDERECO(
ID_END INT PRIMARY KEY,
RUA_END VARCHAR(50),
BAIRRO_END VARCHAR(30),
NUM_END INT,
CIDADE_END VARCHAR(50),
ESTADO_END VARCHAR(50),
PAIS_END VARCHAR(30)
);

ALTER TABLE ENDERECO MODIFY PAIS_END VARCHAR(50);

CREATE TABLE IF NOT EXISTS MODALIDADES(
ID_MODALIDADE INT PRIMARY KEY,
NOME_MODALIDADE VARCHAR(30),
CONSTRAINT FK_INSTRUTORES FOREIGN KEY (INSTRUTOR_MOD)
REFERENCES INSTRUTORES(ID_INSTRUTOR)
);

ALTER TABLE MODALIDADES MODIGY NOME_MODALIDADE VARCHAR(50);

CREATE TABLE IF NOT EXISTS PLANO_TREINO(
ID_PLANO INT PRIMARY KEY,
CONSTRAINT FK_INSTRUTORES FOREIGN KEY (PLANO_INSTRUTOR)
REFERENCES INSTRUTORES(ID_INSTRUTOR),
CONSTRAINT FK_ALUNO FOREIGN KEY (PLANO_ALUNO)
REFERENCES ALUNO(ALUNO_CPF)
);

ALTER TABLE PLANO_TREINO CHANGE ID_PLANO ID_PLANO_TREINO INT PRIMARY KEY;

CREATE TABLE IF NOT EXISTS AULA(
ID_AULA INT PRIMARY KEY,
CAPACIDADE_AULA INT,
DIA_AULA DATE,
CONSTRAINT FK_INSTRUTORES FOREIGN KEY (INSTRUTOR_AULA)
REFERENCES INSTRUTORES(ID_INSTRUTOR),
CONSTRAINT FK_ALUNO FOREIGN KEY (ALUNO_AULA)
REFERENCES ALUNO(ALUNO_CPF)
);

ALTER TABLE AULA ADD HORARIO_AULA TIME;

CREATE TABLE IF NOT EXISTS PAGAMENTOS(
ID_PAGAMENTO INT PRIMARY KEY,
DATA_PAGAMENTO DATETIME,
VALOR_PAGAMENTO DECIMAL(3,2),
STATUR_PAGAMENTO ENUM('PENDENTE','PAGO'),
CONSTRAINT FK_ALUNO FOREIGN KEY (ALUNO_PAGAMENTO)
REFERENCES ALUNO(ALUNO_CPF)
);

ALTER TABLE PAGAMENTOS MODIFY VALOR_PAGAMENTO INT;





