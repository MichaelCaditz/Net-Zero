-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getAzimuth] 
(
	-- Add the parameters for the function here
	
	@nDeclination decimal(28,16),
	@nHourDegrees decimal (16,6),
	@nAltitude decimal(16,6),
	@nLatitude decimal(16,6)
	
)
RETURNS decimal (18,6)
AS
BEGIN

--set @nHourDegrees = -45
--set @nDeclination = 23.45
--set @nAltitude =48.8
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	declare @nCosH decimal (18,6) = 0
	declare @nTanDecl decimal (18,6) = 0
	declare @nTanLat decimal (18,6) = 0
	declare @nAnswer1 float =0
	declare @nAnswer2 decimal (18,6) = 0
	declare @nTest decimal (18,6) = 0
	declare @bTestResult bit  =1
	declare @nPrelimAnswer1 decimal (18,6) = 0

	
	--return @nHourDegrees

	--set @nPrelimAnswer1 = degrees((COS(radians(@nDeclination))*sin(radians(@nHourDegrees)))/cos(radians(@nAltitude)))
	set @nPrelimAnswer1 = COS(radians(@nDeclination))*cast(sin(radians(@nHourDegrees))as float)/cos(radians(@nAltitude))
	--set @nPrelimAnswer1 = COS(radians(@nDeclination))*radians(cast(sin(@nHourDegrees)as float)/cos(@nAltitude))
	--return @nPrelimAnswer1
	--return cos(radians(@nAltitude))


	--return @nPrelimAnswer1
	--set @nAnswer1 = degrees(ASIN(@nPrelimAnswer1))
	set @nAnswer1 = degrees(ASIN(@nPrelimAnswer1))
	---return @nAnswer1
	set @nAnswer2 = degrees(radians(180-@nAnswer1))
	--return @nAnswer2
	set @nCosH = cos(radians(@nHourDegrees))
	--return @nCosH
	
	
	
	
	 set @nTest = iif (tan(radians(@nLatitude))!=0,cast(tan(radians(@nDeclination))as float)/tan(radians(@nLatitude)),cast(tan(radians(@nDeclination))as float)/tan(radians(.0001)))
	--return @nTest
	


	set @bTestResult = 

	 case 
	 
	 when cast(@nCosH as float) >= cast(@nTest as float)
	 then 1
	 else 0
	 end

	 set @ResultVar =

	 case
		when @bTestResult = 1
		then

		case when
		ABS(@nAnswer1)<90
		then @nAnswer1
		else @nAnswer2
		end

	else --@bTestResult = 0

		case
		when 
		ABS(@nAnswer1)<90
		then @nAnswer2
		else @nAnswer1
		end
	 end
	 --return ABS(@nAnswer1)

	--return @bTestResult
	RETURN @ResultVar
	

END
