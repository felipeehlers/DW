CREATE PROCEDURE USP_ST_CLIENTES

AS

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------
IF OBJECT_ID ( 'ST_ENDERECOS' ) IS NULL

BEGIN

CREATE TABLE ST_ENDERECOS 
			 (	
				CLIENTE NUMERIC ( 15 )
			 ,	CIDADE VARCHAR ( 60 )
			 ,  ESTADO CHAR ( 2 )
			 )

END

------------------------------------------------------

IF OBJECT_ID ( 'ST_CLIENTES' ) IS NULL

BEGIN

CREATE TABLE ST_CLIENTES
			 (	
				ENTIDADE NUMERIC ( 12 )
			 ,  NOME VARCHAR ( 50 )
			 ,  NOME_FANTASIA VARCHAR ( 50 )
			 ,  CLASSIFICACAO_CLIENTE NUMERIC ( 15 )
			 )

END

------------------------------------------------------

IF OBJECT_ID ('ST_CLASSIFICACOES_CLIENTES' ) IS NULL 

BEGIN

CREATE TABLE ST_CLASSIFICACOES_CLIENTES 
			 (	
				NOME_CLASSIFICAO VARCHAR ( 60 )
			 ,  CLASSIFICACAO_CLIENTE NUMERIC ( 15 )
			 )

END

------------------------------------------------------

IF OBJECT_ID ( 'ST_ESTADOS' ) IS NULL

BEGIN

CREATE TABLE ST_ESTADOS 
			 (	
				ESTADO CHAR ( 2 )
			 ,  NOME_ESTADO VARCHAR ( 60 )
			 )

END


----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

TRUNCATE TABLE ST_CLIENTES

INSERT INTO ST_CLIENTES
			 (	
				ENTIDADE				
			 ,  NOME					
			 ,  NOME_FANTASIA			
			 ,  CLASSIFICACAO_CLIENTE	
			 )

	    SELECT
				A.ENTIDADE				
			 ,  A.NOME					
			 ,  A.NOME_FANTASIA			
			 ,  A.CLASSIFICACAO_CLIENTE	
		  FROM
				PBS_PROCFIT_DADOS.DBO.ENTIDADES A

------------------------------------------------------
	   
TRUNCATE TABLE ST_CLASSIFICACOES_CLIENTES

INSERT INTO ST_CLASSIFICACOES_CLIENTES
			 (	
				NOME_CLASSIFICAO	
			 ,  CLASSIFICACAO_CLIENTE		
			 )

	    SELECT
				B.DESCRICAO	
			 ,  B.CLASSIFICACAO_CLIENTE	
		  FROM
				PBS_PROCFIT_DADOS.DBO.CLASSIFICACOES_CLIENTES B

------------------------------------------------------

TRUNCATE TABLE ST_ENDERECOS 

INSERT INTO ST_ENDERECOS 
			 (	
				CLIENTE
			 ,	CIDADE
			 ,  ESTADO		
			 )

	    SELECT
				C.ENTIDADE
			 ,	C.CIDADE
			 ,  C.ESTADO	
		  FROM
				PBS_PROCFIT_DADOS.DBO.ENDERECOS  C

------------------------------------------------------

TRUNCATE TABLE ST_ESTADOS

INSERT INTO ST_ESTADOS 
			 (	
				ESTADO
			 ,  NOME_ESTADO
			 )

	    SELECT
				D.ESTADO
			 ,  D.NOME
		  FROM
				PBS_PROCFIT_DADOS.DBO.ESTADOS  D