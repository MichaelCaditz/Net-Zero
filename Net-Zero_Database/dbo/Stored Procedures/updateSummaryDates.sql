-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateSummaryDates]
	-- Add the parameters for the stored procedure here
	@nProjectsID int,
	
	@dtStartDate datetime,
	@dtEndDate datetime,
		@nMetricsResolution int,
		@nMetricsHour int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update a 
	set 
	a.dtSummaryStartDate = @dtStartDate,
	a.dtSummaryEndDate = @dtEndDate,
	a.nMetricsResolution = @nMetricsResolution,
	a.nMetricsHour = @nMetricsHour
	from dbo.projects a
	

	where a.nID = @nProjectsID
END
