CREATE VIEW VW_PRODUTOS

AS

SELECT
		0																					AS  COD_PRODUTO
	 ,  'N�o Informada'																		AS	DESCRICAO		
	 ,  'N�o Informada'																		AS	DESCRICAO_REDUZIDA
	 ,  'N�o Informada'																		AS	FAMILIA		
	 ,  'N�o Informada'																		AS	SECAO		
	 ,  'N�o Informado'																		AS	GRUPO		
	 ,  'N�o Informado'																		AS	SUB_GRUPO		
	 ,  'N�o Informada'																		AS	MARCA		

UNION ALL
		
SELECT
		COD_PRODUTO			
	 ,  DBO.FN_PASCAL_CASE            (     DESCRICAO	   )								AS	DESCRICAO		
	 ,  DBO.FN_PASCAL_CASE            ( DESCRICAO_REDUZIDA )								AS	DESCRICAO_REDUZIDA	
	 ,  COALESCE ( DBO.FN_PASCAL_CASE (	     FAMILIA       ) , 'N�o Indentificado' )	    AS	FAMILIA		
	 ,  DBO.FN_PASCAL_CASE			  (       SECAO		   )								AS	SECAO		
	 ,  DBO.FN_PASCAL_CASE			  (       GRUPO		   )								AS	GRUPO		
	 ,  DBO.FN_PASCAL_CASE			  (     SUB_GRUPO	   )								AS	SUB_GRUPO		
	 ,  DBO.FN_PASCAL_CASE			  (       MARCA		   )								AS	MARCA		
  FROM
		ST_PRODUTOS
	