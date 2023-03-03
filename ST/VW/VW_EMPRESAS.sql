CREATE VIEW VW_EMPRESAS

AS

SELECT
		0													AS COD_EMPRESA
	 ,  'N�o Informado'										AS NOME				
	 ,  'N�o Informado'										AS NOME_FANTASIA
																																			
UNION ALL

(
SELECT 
		COD_EMPRESA
	 ,  PBS_PROCFIT_ST.DBO.FN_PASCAL_CASE ( NOME )			AS NOME
	 ,  PBS_PROCFIT_ST.DBO.FN_PASCAL_CASE (	NOME_FANTASIA ) AS NOME_FANTASIA
FROM PBS_PROCFIT_ST..ST_EMPRESAS
)