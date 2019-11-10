-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllInsolation]
	-- Add the parameters for the stored procedure here
	
	

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.nCityID,a.nMonth,a.nTilt90,a.nTiltLat,a.nTiltLatMinus15,a.nTiltLatPlus15,a.nTilt0,a.n2Axis,a.cNote,


	 case a.nMonth
	 when 0 then 'Annual'
	 when 1 then 'Jan'
	 when 2 then 'Feb'
	 when 3 then 'Mar'
	 when 4 then 'Apr'
	 when 5 then 'May'
	 when 6 then 'Jun'
	 when 7 then 'Jul'
	 when 8 then 'Aug'
	 when 9 then 'Sep'
	 when 10 then 'Oct'
	 when 11 then 'Nov'
	 when 12 then 'Dec'


	 end
	 as cMonthText
	 
	 

	 FROM dbo.insolation a  WITH (NOLOCK)
	 
	
	

	 where 

	
	  
	  ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.nMonth asc

	
END
