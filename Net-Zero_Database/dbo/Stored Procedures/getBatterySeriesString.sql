-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBatterySeriesString]
	-- Add the parameters for the stored procedure here
	
	@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cName,a.cNote,a.bDeleted,a.nProjectsID,
	 --(select sum(b.nVolts) from dbo.batterySeriesString a inner join.battery b on b.nBatterySeriesStringID = a.nID where 
	 --((a.bDeleted is null or a.bDeleted=0) and (b.bDeleted is null or b.bDeleted=0)  )) as nTotVolts

	 (select sum(nVolts*nQty) from dbo.battery b where b.nBatterySeriesStringID = a.nID  and (b.bDeleted is null or b.bDeleted=0) ) as nTotVolts,
	 	 (select min(nCapacity_Ah) from dbo.battery b where b.nBatterySeriesStringID = a.nID and (b.bDeleted is null or b.bDeleted=0) ) as nTotCapacity



	 FROM [dbo].[batterySeriesString] a  WITH (NOLOCK)
	 
	
	

	 where 

	( a.nProjectsID=@projectsID)
	  
	 and ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtCreateDate asc

	
END
