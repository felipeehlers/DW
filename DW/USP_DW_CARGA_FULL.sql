CREATE PROCEDURE USP_DW_CARGA_FULL

AS

EXEC DBO.USP_DW_D_VENDEDORES

EXEC DBO.USP_DW_D_CLIENTES

EXEC DBO.USP_DW_D_PRODUTOS

EXEC DBO.USP_DW_D_EMPRESAS

EXEC DBO.USP_DW_F_VENDAS 0