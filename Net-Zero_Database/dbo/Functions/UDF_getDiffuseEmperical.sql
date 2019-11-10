-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[UDF_getDiffuseEmperical] 
(
	@nDHI decimal (16,6),
	@nSkyDiffuseFactor decimal (16,6),
	@nChosenTiltDeg decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	

	--set @nPrelimAnswer1 = degrees((COS(radians(@nDeclination))*sin(radians(@nHourDegrees)))/cos(radians(@nAltitude)))
	set @nPrelimAnswer1 = @nDHI * (  cast((1+ cos(radians(@nChosenTiltDeg)))as float)   /2   )
	
	
	set @ResultVar = @nPrelimAnswer1
	
	RETURN @ResultVar
	

END
