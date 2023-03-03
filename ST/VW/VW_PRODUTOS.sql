CREATE VIEW VW_PRODUTOS

AS

SELECT
		0																					AS  COD_PRODUTO
	 ,  'Não Informada'																		AS	DESCRICAO		
	 ,  'Não Informada'																		AS	DESCRICAO_REDUZIDA
	 ,  'Não Informada'																		AS	FAMILIA		
	 ,  'Não Informada'																		AS	SECAO		
	 ,  'Não Informado'																		AS	GRUPO		
	 ,  'Não Informado'																		AS	SUB_GRUPO		
	 ,  'Não Informada'																		AS	MARCA		

UNION ALL
		
SELECT
		COD_PRODUTO			
	 ,  DBO.FN_PASCAL_CASE            (     DESCRICAO	   )								AS	DESCRICAO		
	 ,  DBO.FN_PASCAL_CASE            ( DESCRICAO_REDUZIDA )								AS	DESCRICAO_REDUZIDA	
	 ,  COALESCE ( DBO.FN_PASCAL_CASE (	     FAMILIA       ) , 'Não Indentificado' )	    AS	FAMILIA		
	 ,  DBO.FN_PASCAL_CASE			  (       SECAO		   )								AS	SECAO		
	 ,  DBO.FN_PASCAL_CASE			  (       GRUPO		   )								AS	GRUPO		
	 ,  DBO.FN_PASCAL_CASE			  (     SUB_GRUPO	   )								AS	SUB_GRUPO		
	 ,  DBO.FN_PASCAL_CASE			  (       MARCA		   )								AS	MARCA		
  FROM
		ST_PRODUTOS
	