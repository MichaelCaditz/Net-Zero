-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_insertBattery]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	@nBatterySeriesStringID  int = 0,
	@nQty  int = 0,
	@nPrice  decimal(16,4) = 0,
	@nVolts  decimal(16,4) = 0,
	@nCapacity_Ah  decimal(16,4) = 0,
	@cNote  varchar(max),
	@cBrand  varchar(max),
	@cModel  varchar(max),
	@cVendor  varchar(max),
	@cURL  varchar(max),

	@transactIdentity int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	insert into dbo.battery

	(
	cModel,
	cNote,
	nQty,
	nBatterySeriesStringID,
	bDeleted,
	nPrice,
	
	cURL,
	cVendor,
	cBrand,
	nVolts,
	nCapacity_Ah
	
	
	)

	values (
	@cModel,
	@cNote,
	@nQty,
	@nBatterySeriesStringID,
	0,
	@nPrice,
	@cURL,
	@cVendor,
	@cBrand,
	@nVolts,
	@nCapacity_Ah

	)

	select @transactIdentity  = SCOPE_IDENTITY();

	

end

