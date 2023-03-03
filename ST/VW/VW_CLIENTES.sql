CREATE VIEW VW_CLIENTES

AS

SELECT
		0																					AS  ENTIDADE
	 ,  'Não Informado'																		AS	NOME
	 ,  'Não Informado'																		AS	NOME_FANTASIA
	 ,  'Não Informada'																		AS	CLASSIFICAO
	 ,  'Não Informada'																		AS	CIDADE
	 ,  'Não Informado'																		AS	ESTADO
	 ,  'ND'																				AS	UF	
		
UNION ALL

(SELECT
		A.ENTIDADE
	 ,  A.NOME
	 ,  A.NOME_FANTASIA
	 ,  COALESCE ( DBO.FN_PASCAL_CASE  ( B.NOME_CLASSIFICAO ) , 'Não Indentificado' )	AS	CLASSIFICAO
	 ,  COALESCE ( DBO.FN_PASCAL_CASE  ( C.CIDADE			) , 'Não Indentificado' )	AS	CIDADE
	 ,  COALESCE ( DBO.FN_PASCAL_CASE  ( D.NOME_ESTADO      ) , 'Não Indentificado' )	AS	ESTADO
	 ,  COALESCE ( C.ESTADO                                   ,        'ND'         )	AS	UF
FROM 
		ST_CLIENTES								A
		LEFT JOIN ST_CLASSIFICACOES_CLIENTES	B	ON	A.CLASSIFICACAO_CLIENTE	 =  B.CLASSIFICACAO_CLIENTE
		LEFT JOIN ST_ENDERECOS					C	ON	A.ENTIDADE			     =  C.CLIENTE
		LEFT JOIN ST_ESTADOS					D   ON	C.ESTADO				 =  D.ESTADO
)



