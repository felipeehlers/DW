CREATE PROCEDURE USP_DW_D_PRODUTOS

AS

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------


IF OBJECT_ID ( 'PBS_PROCFIT_DW.DBO.DW_PRODUTOS' ) IS NULL

BEGIN

CREATE TABLE DW_PRODUTOS

	(
		COD_PRODUTO			 NUMERIC ( 010 ) PRIMARY KEY
	 ,  DESCRICAO			 VARCHAR ( 100 )
	 ,  DESCRICAO_REDUZIDA	 VARCHAR ( 060 )
	 ,  FAMILIA				 VARCHAR ( 060 )
	 ,  SECAO				 VARCHAR ( 060 )
	 ,  GRUPO				 VARCHAR ( 060 )
	 ,  SUB_GRUPO			 VARCHAR ( 060 )
	 ,  MARCA				 VARCHAR ( 060 )
	)

END

----------------------------------
--       LIMPA AS TABELAS       --
----------------------------------

DELETE FROM DW_PRODUTOS

----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

INSERT INTO DW_PRODUTOS

SELECT
		COD_PRODUTO			
	 ,	DESCRICAO			
	 ,	DESCRICAO_REDUZIDA	
	 ,	FAMILIA				
	 ,	SECAO				
	 ,	GRUPO				
	 ,	SUB_GRUPO			
	 ,	MARCA				
  FROM	
		PBS_PROCFIT_ST.DBO.VW_PRODUTOS