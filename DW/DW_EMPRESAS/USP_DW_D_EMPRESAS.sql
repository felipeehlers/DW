CREATE PROCEDURE USP_DW_D_EMPRESAS

AS

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------


IF OBJECT_ID ( 'PBS_PROCFIT_DW.DBO.DW_EMPRESAS' ) IS NULL

BEGIN

CREATE TABLE DW_EMPRESAS
		(
			COD_EMPRESA		NUMERIC ( 038 ) PRIMARY KEY
		,	NOME			VARCHAR	( 200 )
		,	NOME_FANTASIA	VARCHAR	( 200 )
		)

END

----------------------------------
--       LIMPA AS TABELAS       --
----------------------------------

DELETE FROM DW_EMPRESAS

----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

INSERT INTO DW_EMPRESAS 
		 (
			COD_EMPRESA		
		 ,	NOME		
		 ,	NOME_FANTASIA
		 )

		 (
	SELECT
		 	COD_EMPRESA	
		 ,	NOME		
		 ,	NOME_FANTASIA
	  FROM
			PBS_PROCFIT_ST.DBO.VW_EMPRESAS
		 )