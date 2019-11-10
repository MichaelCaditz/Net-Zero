-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUser]
	-- Add the parameters for the stored procedure here
	
	@cEmail varchar(50),
	@cPassword varchar(50),
	@nID int output,
	@cFirst varchar(50) output,
	@cLast varchar(50) output,
	@cRoleName varchar(50) output,
	@nRoleID int output
AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT @nID = a.nID,@cFirst = a.cFirst,@cLast = a.cLast,@cRoleName = b.cName,@nRoleID = b.nID

	 FROM dbo.users a  WITH (NOLOCK)
	 
	 left join dbo.role b on a.nRoleID = b.nID 

	 where 

	 a.cEmail = @cEmail and a.cPassword = @cPassword and

	
	 ((a.bDeleted is null or a.bDeleted=0) )
		
	
	
	
END
