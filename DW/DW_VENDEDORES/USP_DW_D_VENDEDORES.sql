CREATE PROCEDURE USP_DW_D_VENDEDORES

AS

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------


IF OBJECT_ID ( 'PBS_PROCFIT_DW.DBO.DW_VENDEDORES' ) IS NULL

BEGIN

CREATE TABLE DW_VENDEDORES
			( 
				COD_VENDEDOR   NUMERIC ( 32 ) PRIMARY KEY
			,	VENDEDOR       VARCHAR ( 60 )
			)

END

----------------------------------
--       LIMPA AS TABELAS       --
----------------------------------

DELETE FROM DW_VENDEDORES

----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

INSERT INTO DW_VENDEDORES

SELECT
		COD_VENDEDOR		
	 ,	VENDEDOR		
  FROM	
		PBS_PROCFIT_ST.DBO.VW_VENDEDORES