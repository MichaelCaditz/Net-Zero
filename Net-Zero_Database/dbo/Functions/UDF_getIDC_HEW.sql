-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
create FUNCTION [dbo].[UDF_getIDC_HEW] 
(

	@nAltitude decimal(16,6),
	@nIncidenceHEW decimal(16,6),
	@nDiffuseCollectorHorizontal decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	
	--set @nPrelimAnswer1 =1-(cos(radians(@nAltitude))*cos(radians(@nSunAzimuth)))
	--set @nPrelimAnswer1 = degrees((COS(radians(@nDeclination))*sin(radians(@nHourDegrees)))/cos(radians(@nAltitude)))
	--set @nPrelimAnswer1 = COS(radians(@nAltitude))*    cos(radians(@nSunAzimuth)-radians(0)) * SIN(radians(@nChosenTiltDeg))   + SIN(radians(@nAltitude))    * COS(radians(@nChosenTiltDeg)) 
	set @nPrelimAnswer1 = @nDiffuseCollectorHorizontal*((1+(sin(radians(@nAltitude))/cos(radians(@nIncidenceHEW))))/2)
	--return @nPrelimAnswer1
	--set @nAnswer1 = degrees(ASIN(@nPrelimAnswer1))
	--set @ResultVar = degrees(ACOS(@nPrelimAnswer1))--WE WANT COSINE OF
	set @ResultVar = @nPrelimAnswer1
	--return 888
	--return @nPrelimAnswer1
	RETURN @ResultVar
	

END
