CREATE PROCEDURE USP_DW_D_CLIENTES

AS

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------

IF OBJECT_ID ( 'PBS_PROCFIT_DW.DBO.DW_CLIENTES' ) IS NULL

BEGIN

CREATE TABLE DW_CLIENTES
			 (
				COD_CLIENTE		NUMERIC ( 038 ) PRIMARY KEY
			 ,  NOME			VARCHAR ( 200 )
			 ,  NOME_FANTASIA	VARCHAR ( 200 )
			 ,  CLASSIFICAO		VARCHAR ( 200 )
			 ,  CIDADE			VARCHAR ( 200 )
			 ,  ESTADO			VARCHAR ( 200 )
			 ,  UF				CHAR	( 002 )
			 )

END

----------------------------------
--       LIMPA AS TABELAS       --
----------------------------------

DELETE FROM DW_CLIENTES

----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

INSERT INTO DW_CLIENTES
				( 
				   COD_CLIENTE
				,  NOME		
				,  NOME_FANTASIA
				,  CLASSIFICAO	
				,  CIDADE		
				,  ESTADO		
				,  UF		
				)
		SELECT
				   ENTIDADE
				,  NOME		
				,  NOME_FANTASIA
				,  CLASSIFICAO	
				,  CIDADE		
				,  ESTADO		
				,  UF	
		  FROM
				PBS_PROCFIT_ST.DBO.VW_CLIENTES