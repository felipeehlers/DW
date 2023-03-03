CREATE PROCEDURE USP_ST_VENDEDORES

AS

BEGIN

----------------------------------
--TESTA A EXISTENCIA DAS TABELAS--
----------------------------------


IF OBJECT_ID ( 'PBS_PROCFIT_ST..ST_VENDEDORES' ) IS NULL

BEGIN 

	CREATE TABLE ST_VENDEDORES
	( 
		VENDEDOR VARCHAR ( 60 )
	,   COD_VENDEDOR NUMERIC ( 15 )
	)

END


----------------------------------
--       POPULA AS TABELAS      --
----------------------------------

TRUNCATE TABLE ST_VENDEDORES

INSERT INTO ST_VENDEDORES
	(
		VENDEDOR
	,   COD_VENDEDOR
	)

SELECT 
		NOME
	 ,  VENDEDOR
FROM
		PBS_PROCFIT_DADOS..VENDEDORES

END