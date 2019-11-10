-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getIncidenceHNS] 
(

	@nAltitude decimal(16,6),
	@nSunAzimuth decimal (16,6)
	
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	set @nPrelimAnswer1 = SQRT(1-      power((cos(radians(@nAltitude))*cos(radians(@nSunAzimuth))),2)     )
	
	set @ResultVar = @nPrelimAnswer1
	--return 888
	--return @nPrelimAnswer1
	RETURN @ResultVar
	

END
