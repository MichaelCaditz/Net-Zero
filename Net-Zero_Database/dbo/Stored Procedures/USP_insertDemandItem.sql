-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_insertDemandItem]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	
	@nProjectsID int = 0,
	@cDesc nvarchar(max),
	
	@nQty int,
	@nHours decimal (20,6),
	@nPowerW decimal (20,6),
	@cNote nvarchar(max),
	@nOnOffFactor decimal (20,6),
	


	@transactIdentity int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	insert into dbo.demandItems

	(
	nProjectsID,
	cDesc,
	nQty,
	nHours,
	nPowerW,
	cNote,
	nOnOffFactor,
	
	bDeleted

	
	)
	
	
	

	values (
	@nProjectsID,
	@cDesc,
	@nQty,
	@nHours,
	@nPowerW,
	@cNote,
	@nOnOffFactor,
	0
	

	)

	select @transactIdentity  = SCOPE_IDENTITY();

	

end
