-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_get@ASHRAE_k] 
(
	-- Add the parameters for the function here
	@nDayOfYear decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0


	set @ResultVar  = 0.174+0.035 * sin(radians(cast(360 as float)/365)*(@nDayOfYear-100))
	

		--set @ResultVar = (cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination)))
		--		set @ResultVar = (round(cos(radians(@nLatitude)),3)*round(COS(radians(@nDeclination)),3)*round(cos(radians(@nHourDegrees)),3))+(round(sin(radians(@nLatitude)),3)*round(sin(radians(@nDeclination)),3))

		--		--set @ResultVar = ASIN((cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination))))


	--set @ResultVar = degrees(ASIN(@ResultVar))
	
	


	-- Return the result of the function
	RETURN @ResultVar

END
