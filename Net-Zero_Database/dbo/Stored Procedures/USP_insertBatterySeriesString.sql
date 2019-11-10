-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_insertBatterySeriesString]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	
	@nProjectsID int = 0,
	@cName nvarchar(max),
	

	@transactIdentity int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	insert into dbo.batterySeriesString

	(
	nProjectsID,
	cName,
	bDeleted

	
	)
	
	
	

	values (
	@nProjectsID,
	@cName,
	0
	
	

	)

	select @transactIdentity  = SCOPE_IDENTITY();

	

end
