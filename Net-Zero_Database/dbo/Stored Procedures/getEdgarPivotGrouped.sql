-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getEdgarPivotGrouped]
	-- Add the parameters for the stored procedure here
	
	--@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT b.cISO_Name,a.dtYear,

	 sum(a.nCO2) as nCO2 
	 

	 FROM [dbo].edgarPivot a inner join dbo.EDGAR_to_SQL b on a.nEdgarID = b.nID
	 
	 
	 
	 
	group by b.cISO_Name,a.dtYear
	

	order by b.cISO_Name,a.dtYear

	
END
