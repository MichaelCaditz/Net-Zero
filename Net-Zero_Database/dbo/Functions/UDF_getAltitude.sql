-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getAltitude] 
(
	-- Add the parameters for the function here
	@nLatitude decimal(16,6),
	@nDeclination decimal(26,10),
	@nHourDegrees decimal (16,6)
	
)
RETURNS decimal (18,6)
AS
BEGIN


--set @nHourDegrees = -45
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	
	
--set @ResultVar =(asin((cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees))+(sin(radians(@nLatitude))*sin(radians(@nDeclination))))))
				--set @ResultVar = asin((cos(degrees(@nLatitude))*COS(degrees(@nDeclination))*cos(degrees(@nHourDegrees))+(sin(degrees(@nLatitude))*sin(degrees(@nDeclination)))))
		--set @ResultVar = asin(radians((degrees(cos(radians(@nLatitude)))*degrees(COS(radians(@nDeclination)))*degrees(cos(radians(@nHourDegrees)))+(degrees(sin(radians(@nLatitude)))*degrees(sin(radians(@nDeclination)))))))

	--set @ResultVar = (degrees(cos(radians(@nLatitude)))*degrees(COS(radians(@nDeclination)))*degrees(cos(radians(@nHourDegrees))))+(degrees(sin(radians(@nLatitude)))*degrees(sin(radians(@nDeclination))))
	
		--set @ResultVar = (cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination)))
				set @ResultVar = (cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+sin(radians(@nLatitude))*sin(radians(@nDeclination))

				--set @ResultVar = ASIN((cos(radians(@nLatitude))*COS(radians(@nDeclination))*cos(radians(@nHourDegrees)))+(sin(radians(@nLatitude))*sin(radians(@nDeclination))))

--RETURN @ResultVar
	set @ResultVar = degrees(ASIN(@ResultVar))
	
	--set @ResultVar = asin(-1.01)
	--CAN'T GET THIS RIGHT
	--set @ResultVar =asin((RADIANS(sin(RADIANS(-23.44))*COS(RADIANS(360/365.34*(@nDayNumber+10)+RADIANS(360/PI())*0.0167*SIN(RADIANS((360/365.24*(@nDayNumber-2)))))))))


	--set @ResultVar  = cos(radians(@nLatitude))




	-- Return the result of the function
	RETURN @ResultVar

END
