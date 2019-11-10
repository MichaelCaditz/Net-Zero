-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_insertPVMaster]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	
	
	
	@cModel nvarchar(max),
	@cBrand nvarchar(max),
	@nPmax decimal(20,6),
	@nVmp decimal(20,6),
	@nImp decimal(20,6),
	@nVoc decimal(20,6),
	@nIsc decimal(20,6),
	@nWeight_kg decimal(20,6),
	@nLength_mm decimal(20,6),
	@nHeight_mm decimal(20,6),
	@nWidth_mm decimal(20,6),
	@cFrame nvarchar(max),
	@cVendor nvarchar(max),
	@nPrice decimal(20,6),
	@nPriority decimal(20,6),
	@cURL nvarchar(max),
	

	@transactIdentity int output
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	

	


	insert into [Net-Zero].dbo.PVMaster

	(
	
	cModel,
	cBrand,
	nPmax,
	nVmp,
	nImp,
	nVoc,
	nIsc,
	nWeight_kg,
	nLength_mm,
	nHeight_mm,
	nWidth_mm,
	cFrame,
	cVendor,
	nPrice,
	
	cURL,
	
	bDeleted,
	nPriority

	
	)
	
	
	

	values (
	
	@cModel,
	@cBrand,
	@nPmax,
	@nVmp,
	@nImp,
	@nVoc,
	@nIsc,
	@nWeight_kg,
	@nLength_mm,
	@nHeight_mm,
	@nWidth_mm,
	@cFrame,
	@cVendor,
	@nPrice,

	@cURL,
	
	0,
	@nPriority
	

	)

	select @transactIdentity  = SCOPE_IDENTITY();

	

end
