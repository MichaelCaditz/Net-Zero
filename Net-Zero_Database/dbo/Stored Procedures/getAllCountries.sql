﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllCountries]
	-- Add the parameters for the stored procedure here
	
	

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cName,a.cAlpha2,a.cAlpha3,a.nCountryID,a.cNote
	 
	 

	 FROM country a  WITH (NOLOCK)
	 
	
	

	 where 

	
	  
	  ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.cName asc

	
END
