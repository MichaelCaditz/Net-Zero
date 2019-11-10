-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateCity]
	-- Add the parameters for the stored procedure here
	@nProjectsID int,
	@nCityID int,
	@nInsolation decimal (18,6),
	@nManualLat decimal (18,6),
	@nManualLong decimal (18,6),
	@bUserSpecifiedCoordinates bit,
	@nReflectance decimal (18,6),
	@nGMTPlusMinus decimal (18,6),
	@bDaylightTime bit,
	@dtDaylightFirst datetime2,
	@dtDaylightLast datetime2,
	@cTMYFile nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update a 
	set a.nCityID = @nCityID,
	a.nChosenInsolation = @nInsolation,
	a.nManualLat = @nManualLat,
	a.nManualLong = @nManualLong,
	a.bUserSpecifiedCoordinates = @bUserSpecifiedCoordinates,
	a.nReflectance = @nReflectance,
	a.nGMTPlusMinus = @nGMTPlusMinus,
	a.bDaylightTime=@bDaylightTime,
	a.dtDaylightFirst=@dtDaylightFirst,
	a.dtDaylightLast=@dtDaylightLast,
	a.cTMYFile = @cTMYFile
	from dbo.projects a
	

	where a.nID = @nProjectsID
END
