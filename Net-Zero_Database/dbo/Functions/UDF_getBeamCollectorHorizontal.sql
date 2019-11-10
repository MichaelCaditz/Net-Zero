-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getBeamCollectorHorizontal] 
(
	@nIB decimal (16,6),
	
	@nSunAltitude decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	

	--set @nPrelimAnswer1 = degrees((COS(radians(@nDeclination))*sin(radians(@nHourDegrees)))/cos(radians(@nAltitude)))
	set @nPrelimAnswer1 = @nIB * sin(radians(@nSunAltitude))

	--return @nIB
	set @ResultVar = @nPrelimAnswer1
	--return 888
	--return 66
	RETURN @ResultVar
	

END
