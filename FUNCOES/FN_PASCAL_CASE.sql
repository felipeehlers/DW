
--------------------------------------------------
--		       Função PascalCase				--
--------------------------------------------------

CREATE FUNCTION FN_PASCAL_CASE ( @Texto VARCHAR ( 4000 ) )

RETURNS VARCHAR ( 4000 )

BEGIN

DECLARE @Posicao			INT = 1
DECLARE @Char				CHAR (1)
DECLARE @Char_Anterior		CHAR (1)
DECLARE @Texto_Pascal_Case	VARCHAR ( 4000 ) = LOWER ( @Texto )


WHILE @Posicao <= LEN ( @Texto )

BEGIN

SET @Char		   = SUBSTRING ( @Texto_Pascal_Case , @Posicao , 1 )	  
SET @Char_Anterior = CASE 
						WHEN @Posicao = 1
						THEN ' '
						ELSE SUBSTRING ( @Texto_Pascal_Case , @Posicao - 1 , 1 )	
					  END

IF @Char_Anterior IN ( ' ' )

BEGIN

SET @Texto_Pascal_Case = STUFF ( @Texto_Pascal_Case , @Posicao , 1 , UPPER ( @Char ) )

END

SET @Posicao = @Posicao + 1

END

RETURN @Texto_Pascal_Case

END