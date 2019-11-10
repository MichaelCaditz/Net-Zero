-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBatteryMaster]
	-- Add the parameters for the stored procedure here
	


AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cModel,a.cNote,a.bDeleted,a.dtDateDeleted,a.cBrand,
	 a.nCapacity_Ah,a.cVendor,a.nPrice,a.cURL,a.nVolts,a.nPriority

	 

	 FROM [dbo].[batteryMaster] a  WITH (NOLOCK) 
	 
	
	

	 where 

	
	(a.bDeleted is null or a.bDeleted=0) 

	order by a.nPriority desc

	
END
