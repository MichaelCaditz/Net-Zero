-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[getEDGAR_to_SQL]
	-- Add the parameters for the stored procedure here
	
	--@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT *

	 

	 FROM [dbo].EDGAR_to_SQL  WITH (NOLOCK) 
	 
	
	

	

	
END
