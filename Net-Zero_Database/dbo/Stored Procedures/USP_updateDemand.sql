-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[USP_updateDemand]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	@nProjectsID  int = 0,
	@nID int = 0,
	@nOnOffFactor decimal(16,4) = 0,
	@nQty int = 0,
	@cDesc varchar(max) = '',
	
	@bDeleted bit,
	
	@nHours decimal(16,4)=0,
	@nPowerW decimal(16,4)=0,
	@cNote varchar(max) = ''


	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	update dbo.demandItems

	set
	nProjectsID=@nProjectsID,  
	
	nOnOffFactor=@nOnOffFactor, 
	nQty=@nQty ,
	cDesc=@cDesc ,
	
bDeleted=@bDeleted ,
	
	nHours=@nHours ,
	nPowerW=@nPowerW ,
	cNote=@cNote


	
	
	

	where nID = @nID

end

