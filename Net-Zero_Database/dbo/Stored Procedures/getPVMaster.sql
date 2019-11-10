-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getPVMaster]
	-- Add the parameters for the stored procedure here
	
	

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cModel,a.cBrand,a.nPmax,a.nVmp,a.nImp,a.nVoc,a.nIsc,a.nWeight_kg,a.nLength_mm,a.nWidth_mm,
	 a.nHeight_mm,a.cFrame,a.cVendor,a.nPrice,a.cURL,a.bDeleted,a.nPriority

	 

	 FROM dbo.PVMaster a  WITH (NOLOCK)
	 
	
	

	 where 

	
	  
	 (a.bDeleted is null or a.bDeleted=0) 
		
	order by a.nPriority desc

	
END
