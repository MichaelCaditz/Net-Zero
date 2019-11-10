-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getSkyDiffuseFactor] 
(
	-- Add the parameters for the function here
	@nDayOfYear decimal(16,6)
	
	
)
RETURNS decimal (18,6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar decimal (18,6) =0
	

	--set @ResultVar  = 0.095 + 0.04 * SIN((radians(360.0000)/radians(365.0000)*(@nDayOfYear-100)))
	
	
	set @ResultVar = 0.095 + 0.04 *sin(radians(cast(360 as float)/365)*(@nDayOfYear-100))
	
	RETURN @ResultVar

END
