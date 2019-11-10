-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_get@ASHRAE_A] 
(
	-- Add the parameters for the function here
	@nDayOfYear decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0


	set @ResultVar  = 1160+(75 * SIN(radians(360/365*(@nDayOfYear-275))))
	

		--set @ResultVar = (cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination)))
		--		set @ResultVar = (round(cos(radians(@nLatitude)),3)*round(COS(radians(@nDeclination)),3)*round(cos(radians(@nHourDegrees)),3))+(round(sin(radians(@nLatitude)),3)*round(sin(radians(@nDeclination)),3))

		--		--set @ResultVar = ASIN((cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination))))


	--set @ResultVar = degrees(ASIN(@ResultVar))
	
	--set @ResultVar = 1160+75 * SIN((radians(360)/radians(365)*(radians((@nDayOfYear)-275))))
	set @ResultVar = 1160+75 * sin(radians(cast(360 as float)/365)*(@nDayOfYear-275))

	-- Return the result of the function
	RETURN @ResultVar

END
