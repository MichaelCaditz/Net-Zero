-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getReflected] 
(
	 @nSkyDiffuseFactor decimal(16,6),
	 @nSunAltitude decimal(16,6),
	 @nIB decimal (16,6),
	@nReflectance decimal (16,6),
	@nBeamCollectorHorizontal decimal (16,6),
	@nDiffuseCollectorHorizontal decimal(16,6),
	@nChosenTiltDeg decimal(16,6)
	
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	--set @nPrelimAnswer1 = degrees((COS(radians(@nDeclination))*sin(radians(@nHourDegrees)))/cos(radians(@nAltitude)))
	--this works also ---set @nPrelimAnswer1 = @nReflectance*(@nBeamCollectorHorizontal+@nDiffuseCollectorHorizontal)*(   (1-cos(radians(@nChosenTiltDeg))) /2    )
	set @nPrelimAnswer1 = @nIB*@nReflectance*(@nSkyDiffuseFactor+sin(radians(@nSunAltitude)))*(   (1-cos(radians(@nChosenTiltDeg))) /2)
	
	set @ResultVar = @nPrelimAnswer1
	--return 888
	
	RETURN @ResultVar
	

END
