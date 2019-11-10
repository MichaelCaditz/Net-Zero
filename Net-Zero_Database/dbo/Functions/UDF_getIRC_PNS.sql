-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getIRC_PNS] 
(

@nReflectance  decimal(16,6),
@nIB  decimal(16,6),
@nSkyDiffuseFactor  decimal(16,6),
@nDeclination  decimal(16,6),
@nSunAltitude  decimal(16,6)
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	
	--set @nPrelimAnswer1 = @nIB*@nReflectance*(@nSkyDiffuseFactor+sin(radians(@nSunAltitude)))* ((1-  sin(radians(@nSunAltitude))  /  cos(radians(@nIncidenceHNS)) )/2)
	set @nPrelimAnswer1 = @nIB*@nReflectance*  ( @nSkyDiffuseFactor+sin(radians(@nSunAltitude))) * (( 1- sin(radians(@nSunAltitude)-radians(@nDeclination)))/2)
	set @ResultVar = @nPrelimAnswer1
	
	RETURN @ResultVar
	

END
