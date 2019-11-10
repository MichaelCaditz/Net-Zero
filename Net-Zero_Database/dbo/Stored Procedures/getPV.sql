-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPV]
	-- Add the parameters for the stored procedure here
	
	@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cModel,a.cBrand,a.nPmax,a.nVmp,a.nImp,a.nVoc,a.nIsc,a.nWeight_kg,a.nLength_mm,a.nWidth_mm,
	 a.nHeight_mm,a.cFrame,a.cVendor,a.nPrice,a.nTilt_deg,a.nOrientation_deg,a.cURL,a.nQty,a.bDeleted,a.nProjectsID

	 

	 FROM dbo.PV a  WITH (NOLOCK)
	 
	
	

	 where 

	( a.nProjectsID=@projectsID)
	  
	 and ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtCreateDate asc

	
END
