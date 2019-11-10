-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UTILITYUPDATECITY
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update a set nStateProvinceID = 

	 (select top 1 nID from dbo.stateProvince b inner join dbo.city_kWh c on c.Province = b.cName where a.cName=c.Municipality )
	from dbo.city a
	
END
