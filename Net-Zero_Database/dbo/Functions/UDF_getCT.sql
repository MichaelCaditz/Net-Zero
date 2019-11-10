-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[UDF_getCT] 
(

	@nGMTPlusMinus decimal(16,6),
	@nDayOfYear decimal(16,6),
	@beginDate datetime,
	@nLong decimal(16,6),
	@bDaylightTime bit,
	@dtDaylightFirst datetime,
	@dtDaylightLast datetime
	
	
)
RETURNS datetime
AS
BEGIN



if datepart(dy,@beginDate)>=datepart(dy,@dtDaylightFirst) and datepart(dy,@beginDate)<=datepart(dy,@dtDaylightLast)
set @nGMTPlusMinus = @nGMTPlusMinus +1


	-- Declare the return variable here
	DECLARE @ResultVar datetime
	declare @B decimal (18,6) =0
	declare @E decimal (18,6) =0
	declare @LTM decimal(16,6) = 0
	
	declare @nMinsToDeduct decimal (18,6) = 0
	declare @nPrelimAnswer2 decimal (18,6) = 0


	set @B= (360/convert(float,364))*(@nDayOfYear-81)


	set @LTM = @nGMTPlusMinus *15

	set @E = 9.87 * sin(radians(2*@B))-7.53*cos(radians(@B)) - 1.5*sin(radians(@B))

	--set @nMinsToDeduct = - 4 * (abs(@LTM)-abs(@nLong))- @E

	set @nMinsToDeduct = -4 * (@nLong-@LTM)- @E


	set @ResultVar = dateadd(mi,@nMinsToDeduct,@beginDate)

	
	--set @nPrelimAnswer1 =  ((datepart(hour,@beginDate)*60) - 4 * (abs(@LTM)-abs(@nLong))- @E)/60

	--set @nPrelimAnswer2 = 60*   (ABS(@nPrelimAnswer1) - FLOOR(ABS(@nPrelimAnswer1)))

	
	--set @ResultVar=DATETIMEFROMPARTS(2000,1,1,floor(@nPrelimAnswer1 )     ,round(@nPrelimAnswer2,0),0,0)
	
	--return @nPrelimAnswer1

	--return @nPrelimAnswer2

	
	
	RETURN @ResultVar
	

END
