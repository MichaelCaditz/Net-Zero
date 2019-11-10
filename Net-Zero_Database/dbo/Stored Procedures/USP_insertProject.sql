-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_insertProject]
	-- Add the parameters for the stored procedure here
	@nUserID int,
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	

	@transactIdentity int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	insert into dbo.projects

	(
	nUsersID,
	cName,
	nChosenInsolation,
	cChosenTilt,
	nMPPTFactor,
	nBatteryEfficiency,
	nInverterDerate,
	nColdestAirTempC,
	nMDoD,
	nDaysAutonomy,
	nVoltage,
	nControllerEfficiency,
	nTDR,
	nReflectance
	
	)

	values (
	@nUserID,
	'New Project',
	2,
	'Latitude',
	1,
	.80,
	.75,
	0,
	.60,
	4,
	48,
	.98,
	.80,
	.1

	)

	select @transactIdentity  = SCOPE_IDENTITY();

	

end

