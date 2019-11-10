-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateDerates]
	-- Add the parameters for the stored procedure here
	@nProjectsID int,
	
	@nMPPTFactor decimal (18,6),
	@nBatteryEfficiency decimal (18,6),
	@nChosenAzimuth decimal (18,6),
	@nControllerEfficiency decimal (18,6),
	@nDaysAutonomy decimal (18,6),
	@nVoltage decimal (18,6),
	@nMDoD decimal (18,6),
	@nTDR decimal (18,6),
	@nInverterDerate decimal (18,6),
	@nCustomTilt decimal (18,6),

	@nChosenInsolation decimal (18,6),
	@nChosenBattery decimal (18,6),
	@nChosenPV decimal (18,6),

	
	@nDemandTotal decimal (18,6),
	@cName varchar(max),
	@cDesc varchar(max),
	@cNote1 varchar(max),
	@cNote2 varchar(max),
	@cChosenTilt varchar(max),
	@dtDateDue datetime,

	@nMetricsResolution int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update a 
	set nMPPTFactor= @nMPPTFactor,
	nBatteryEfficiency =@nBatteryEfficiency,
	nChosenAzimuth =@nChosenAzimuth,
	nControllerEfficiency =@nControllerEfficiency,
	nInverterDerate =@nInverterDerate,
	nDaysAutonomy =@nDaysAutonomy,
	nMDoD =@nMDoD,
	nTDR =@nTDR,
	nVoltage = @nVoltage,
	nCustomTilt=@nCustomTilt,
	nChosenInsolation=@nChosenInsolation,
	nChosenBattery=@nChosenBattery,
	nChosenPV=@nChosenPV,
	nDemandTotal=@nDemandTotal ,
	cName=@cName ,
	cDesc=@cDesc ,
	cNote1=@cNote1 ,
	cNote2=@cNote2 ,
	cChosenTilt=@cChosenTilt,
	dtDateDue=@dtDateDue

	--nMetricsResolution=@nMetricsResolution

	from dbo.projects a
	

	where a.nID = @nProjectsID
END
