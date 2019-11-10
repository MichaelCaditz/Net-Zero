-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSummaryDailyTotals]
	-- Add the parameters for the stored procedure here
	@projectsID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT convert(date,a.dtDate),sum(a.nBeamCollector) 

	 

	 FROM summary a  WITH (NOLOCK)

	 group by convert(date,a.dtDate)

	 order by convert(date,a.dtDate)
END
