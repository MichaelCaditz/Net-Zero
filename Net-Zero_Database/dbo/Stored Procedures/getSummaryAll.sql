-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSummaryAll]
	-- Add the parameters for the stored procedure here
	
	--@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.dtDate,a.nInsolation,a.cNote,a.nProjectsID
	 
	 

	 FROM summary a  WITH (NOLOCK)
	 
	
	

	 where 

	((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtCreateDate desc

	
END
