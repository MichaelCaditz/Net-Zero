-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBattery]
	-- Add the parameters for the stored procedure here
	
	@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cModel,a.cNote,a.bDeleted,b.nProjectsID,a.dtDateDeleted,a.cBrand,
	 a.nCapacity_Ah,a.cVendor,a.nPrice,a.nQty,a.cURL,a.nVolts,a.nBatterySeriesStringID

	 

	 FROM [dbo].[battery] a  WITH (NOLOCK) inner join batterySeriesString b on a.nBatterySeriesStringID=b.nID
	 
	
	

	 where 

	( b.nProjectsID=@projectsID)
	  
	 and ((a.bDeleted is null or a.bDeleted=0) and (b.bDeleted is null or b.bDeleted=0) )
		
	order by a.dtCreateDate asc

	
END
