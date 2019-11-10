-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_autoBattery]
	-- Add the parameters for the stored procedure here
	@nProjectsID int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	declare 
	@transactIdentity int,
	@cSeriesName varchar(max),
	@nChosenBattery decimal(16,4),
	@nSeriesNeeded decimal (16,4),
	@nUnitsNeeded decimal(16,4),
	@nVoltage decimal(16,4),

	@cModel nvarchar(max),
	@cBrand nvarchar(max),
	@nCapacity_Ah decimal(20,6),
	
	@cNote nvarchar(max),
	@cVendor nvarchar(max),
	@nPrice decimal(20,6),
	@nVolts decimal(16,4),
	@cURL nvarchar(max),
	@nQty int,
	@nQtySeries int,
	@nQtyBatteryInSeries decimal(16,4)

	select top(1)
	@cModel=a.cModel,
	
	@cBrand =a.cBrand,
	@nVolts=nVolts,
	@nCapacity_Ah=nCapacity_Ah,
	@cVendor =a.cVendor,
	@nPrice =a.nPrice,
	
	@cURL =a.cURL
	

	
	 from  dbo.batteryMaster a order by a.nPriority desc 


	select @nChosenBattery =nChosenBattery, @nVoltage=nVoltage from dbo.projects a where a.nID = @nProjectsID
	

	--select @nTilt_deg=0
	--fill in code to get tilt degrees from latitude

	select @nSeriesNeeded =
	
	case
	when @nCapacity_Ah>0
	then @nChosenBattery/@nCapacity_Ah
	else 0
	end


	select @nQtyBatteryInSeries =
	
	case
	when @nVolts>0
	then @nVoltage/@nVolts
	else 0
	end
	select @nQtySeries=CEILING(@nQtyBatteryInSeries)


	declare @i int=0
	while @i < @nSeriesNeeded
	begin
	set @cSeriesName='Series '+convert(varchar(10),@i)
	insert into dbo.batterySeriesString

	(
	nProjectsID,
	cName,
	bDeleted

	
	)
	
	
	

	values (
	@nProjectsID,
	@cSeriesName,
	0
	
	

	)

	select @transactIdentity  = SCOPE_IDENTITY();



	declare @j int=0
	while @j < @nQtySeries
	begin


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
	@nQtySeries,
	@transactIdentity,
	0,
	@nPrice,
	@cURL,
	@cVendor,
	@cBrand,
	@nVolts,
	@nCapacity_Ah

	)


	SET @j = @j + 1
	end



	SET @i = @i + 1
	end



	
END
