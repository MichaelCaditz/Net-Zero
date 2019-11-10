-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getDeclination] 
(
	-- Add the parameters for the function here
	@nDayNumber int
)
RETURNS decimal (28,16)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0

	--set @ResultVar = DEGREES(23.45*SIN(radians((360.0/365.0)*(@nDayNumber-81))))
	set @ResultVar = 23.45*SIN(radians((360.0/365.0)*(@nDayNumber-81)))

	

	--CAN'T GET THIS RIGHT
	--set @ResultVar =asin((RADIANS(sin(RADIANS(-23.44))*COS(RADIANS(360/365.34*(@nDayNumber+10)+RADIANS(360/PI())*0.0167*SIN(RADIANS((360/365.24*(@nDayNumber-2)))))))))







	-- Return the result of the function
	RETURN @ResultVar

END
