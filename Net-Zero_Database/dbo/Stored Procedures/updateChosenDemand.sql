﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[updateChosenDemand]
	-- Add the parameters for the stored procedure here
	@nProjectsID int,
	
	
	@nDemandTotal decimal (18,6)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update a 
	
	set nDemandTotal=@nDemandTotal 
	

	from dbo.projects a
	

	where a.nID = @nProjectsID
END
