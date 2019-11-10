-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_updateBattery]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	@nBatterySeriesStringID  int = 0,
	@nID int = 0,
	@nPrice decimal(16,4) = 0,
	@nQty int = 0,
	@cNote varchar(max) = '',
	@cBrand varchar(max) = '',
	@bDeleted bit,
	@cModel varchar(max) = '',
	@nVolts decimal(16,4)=0,
	@nCapacity_Ah decimal(16,4)=0,
	@cVendor varchar(max) = '',
	@cURL varchar(max) = ''



	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	update dbo.battery

	set
	cModel = @cModel,
	cNote = @cNote,
	nQty = @nQty,
	nBatterySeriesStringID = @nBatterySeriesStringID,
	bDeleted=@bDeleted,
	nPrice=@nPrice,
	cBrand=@cBrand,
	nVolts=@nVolts,
	nCapacity_Ah=@nCapacity_Ah,
	cVendor=@cVendor,
	cURL=@cURL


	
	
	

	where nID = @nID

end

