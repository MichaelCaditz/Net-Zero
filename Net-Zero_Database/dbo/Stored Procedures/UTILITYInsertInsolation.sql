-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UTILITYInsertInsolation
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into dbo.insolation

(nCityID,nMonth,nTilt90,nTiltLat,nTiltLatPlus15,nTiltLatMinus15,nTilt0,n2Axis)


     select (select nID from dbo.city c where c.cName= b.Municipality) , 
	 
	 case b.month
	 when 'January' then 1
	 when 'February' then 2
	  when 'March' then 3
	 when 'April' then 4
	 when 'May' then 5
	 when 'June' then 6
	 when 'July' then 7
	 when 'August' then 8
	 when 'September' then 9
	 when 'October' then 10
	 when 'November' then 11
	 when 'December' then 12
	else 0
	 end,
	 
	 b.[90deg],

	 
	 b.lat,
	  b.latPlus15,
	 b.latMinus15,
	 b.[0deg],
	 b.[2Axis]
	 
	 
	 
	 from dbo.city_kWh b
END
