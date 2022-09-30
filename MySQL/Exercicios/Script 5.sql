DROP DATABASE COMERCIO;
DROP DATABASE EXEMPLO;
DROP DATABASE PROJETO;
DROP DATABASE EXERCICIO;
DROP DATABASE LIVRARIA;

+--------------------+
| Database           |
+--------------------+
| comercio           |
| exemplo            |
| exercicio          |
| information_schema |
| livraria           |
| mysql              |
| performance_schema |
| projeto            |
| sakila             |
| sys                |
| world              |
+--------------------+



/* PROCEDURES */


CREATE DATABASE PROJETO;

USE PROJETO

CREATE TABLE CURSO(
	IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	HORAS INT(3) NOT NULL,
	VALOR FLOAT(10,2) NOT NULL
);


INSERT INTO CURSO VALUES(NULL,'JAVA',30,500.00);
INSERT INTO CURSO VALUES(NULL,'FUNDAMENTOS DE BANCO DE DADOS',40,700.00);

SELECT * FROM CURSO;

+---------+-------------------------------+-------+--------+
| IDCURSO | NOME                          | HORAS | VALOR  |
+---------+-------------------------------+-------+--------+
|       1 | JAVA                          |    30 | 500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |    40 | 700.00 |
+---------+-------------------------------+-------+--------+


DELIMITER #

STATUS

C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe  Ver 8.0.30 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          8
Current database:       projeto
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_256_GCM_SHA384
Using delimiter:        #
Server version:         8.0.30 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Insert id:              2
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    utf8mb4
Conn.  characterset:    utf8mb4
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 23 min 17 sec


CREATE PROCEDURE CAD_CURSO(P_NOME VARCHAR(30),
						   P_HORAS INT(3),
						   P_PRECO FLOAT(10,2))
BEGIN

	INSERT INTO CURSO VALUES(NULL,P_NOME,P_HORAS,P_PRECO);

END
#

DELIMITER ;

CALL CAD_CURSO('BI SQL SERVER',35,3000.00);
CALL CAD_CURSO('POWER BI',20,1000.00);
CALL CAD_CURSO('TABLEAU',30,1200.00);

SELECT * FROM CURSO;

+---------+-------------------------------+-------+---------+
| IDCURSO | NOME                          | HORAS | VALOR   |
+---------+-------------------------------+-------+---------+
|       1 | JAVA                          |    30 |  500.00 |
|       2 | FUNDAMENTOS DE BANCO DE DADOS |    40 |  700.00 |
|       3 | BI SQL SERVER                 |    35 | 3000.00 |
|       4 | POWER BI                      |    20 | 1000.00 |
|       5 | TABLEAU                       |    30 | 1200.00 |
+---------+-------------------------------+-------+---------+

CALL CAD_CURSO ('EXCEL VBA',25,500.00);
CALL CAD_CURSO ('EXCEL BASICO',10,250.00);
CALL CAD_CURSO ('EXCEL INTERMEDIARIO',20,300.00);
CALL CAD_CURSO ('EXCEL AVANCADO',15,300.00);
CALL CAD_CURSO ('PYTHON',40,950.00);


/*PROCEDURE PARA CONSULTAR CURSOS */

DELIMITER #

CREATE PROCEDURE CON_CURSO(P_NOME VARCHAR(30))
BEGIN
	SELECT IDCURSO,NOME,HORAS,VALOR 
	FROM CURSO
	WHERE NOME = P_NOME;

END
#

DELIMITER ;

CALL CON_CURSO ('PYTHON');

+---------+--------+-------+--------+
| IDCURSO | NOME   | HORAS | VALOR  |
+---------+--------+-------+--------+
|      10 | PYTHON |    40 | 950.00 |
+---------+--------+-------+--------+

