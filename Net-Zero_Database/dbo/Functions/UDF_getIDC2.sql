-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[UDF_getIDC2] 
(

@nIB  decimal(16,6),
@nSkyDiffuseFactor  decimal(16,6),

@nSunAltitude  decimal(16,6)
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	
	--set @nPrelimAnswer1 = @nIB*@nReflectance*(@nSkyDiffuseFactor+sin(radians(@nSunAltitude)))* ((1-  sin(radians(@nSunAltitude))  /  cos(radians(@nIncidenceHNS)) )/2)
	set @nPrelimAnswer1 = @nIB*@nSkyDiffuseFactor*  (( 1 + sin(radians(@nSunAltitude)))/2)
	set @ResultVar = @nPrelimAnswer1
	
	RETURN @ResultVar
	

END
