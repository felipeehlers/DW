TRUNCATE TABLE SEQUENCIA

DECLARE @INICIO INT = ( 1 )
DECLARE @FIM INT = ( 99999 )


WHILE @FIM >= @INICIO

BEGIN

	INSERT INTO SEQUENCIA
		(
		SEQUENCIA
		)
	VALUES
		(
		@INICIO
		)

	SET @INICIO = @INICIO + 1
	
END