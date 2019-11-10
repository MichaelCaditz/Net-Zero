-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[USP_updateBatterySeriesString]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	@nProjectsID  int = 0,
	@nID int = 0,
	
	@cName nvarchar(max) = '',
	
	@bDeleted bit,
	@cNote nvarchar(max) = ''
	


	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	update dbo.batterySeriesString

	set
	cName = @cName,
	cNote = @cNote,
	
	nProjectsID = @nProjectsID,
	bDeleted=@bDeleted
	


	
	
	

	where nID = @nID

end

