-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UTILITY_latlong]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update z set nLat = 

	 (select top 1 b.latitude from dbo.ca_cities b where z.cName = b.name and x.cName like '%'+b.province+'%' ),
	

	nLong =  (select top 1 b.longitude from dbo.ca_cities b where z.cName = b.name and x.cName like '%'+b.province+'%' ),
	

	nCa_citiesID = (select top 1 b.id from dbo.ca_cities b where z.cName = b.name and x.cName like '%'+b.province+'%' )
	
	


	from dbo.city z inner join dbo.stateProvince x on z.nStateProvinceID = x.nID
	
END
