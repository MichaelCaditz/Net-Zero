-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDemandItems]
	-- Add the parameters for the stored procedure here
	
	@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cDesc,a.nQty,a.nHours,nPowerW,a.cNote,a.nOnOffFactor,a.nProjectsID,a.bDeleted
	 
	 

	 FROM demandItems a  WITH (NOLOCK)
	 
	
	

	 where 

	( a.nProjectsID=@projectsID)
	  
	 and ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtCreateDate desc

	
END
