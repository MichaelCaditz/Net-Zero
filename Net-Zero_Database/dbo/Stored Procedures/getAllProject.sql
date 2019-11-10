-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllProject]
	-- Add the parameters for the stored procedure here
	
	@nUserID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.cName,a.cDesc,a.cNote1,cNote2,a.nClientsID,a.dtDateDue,
	a.nCityID,a.cChosenTilt,round(a.nMPPTFactor,2)as nMPPTFactor   ,round(a.nBatteryEfficiency,2) as nBatteryEfficiency,
	 round(a.nInverterDerate,2) as nInverterDerate, round(a.nControllerEfficiency,2) as nControllerEfficiency,round(a.nDaysAutonomy,2) as nDaysAutonomy,
	 round(a.nVoltage,2) as nVoltage, round(a.nMDoD,2) as nMDoD, round(a.nTDR,2) as nTDR,round(a.nChosenInsolation,2) as nChosenInsolation,
	 round(a.nDemandTotal,2) as nDemandTotal,
	  iif (a.nCityID>0 and (a.bUserSpecifiedCoordinates  is null or a.bUserSpecifiedCoordinates=0),b.cName + ', '+ c.cName + ', '+ d.cName,'') as cCity,round(a.nChosenPV,2) as nChosenPV,round(a.nChosenBattery,2) as nChosenBattery,
	 a.dtSummaryStartDate,a.dtSummaryEndDate,a.nCityIDDemand,iif(a.nCityIDDemand>0,e.cName + ', '+ f.cName + ', '+ g.cName,'') as cCityDemand,
	iif((a.bUserSpecifiedCoordinates  is null or a.bUserSpecifiedCoordinates=0), b.nLat,a.nManualLat) as nLat,
	 e.nLat as nLatDemand, 
	iif((a.bUserSpecifiedCoordinates  is null or a.bUserSpecifiedCoordinates=0),b.nLong,a.nManualLong) as nLong, 
	e.nLong as nLongDemand,
	 c.nID as nStateProvinceID,d.nID as nCountryID, f.nID as nStateProvinceIDDemand,g.nID as nCountryIDDemand,
	 a.nManualLat,a.nManualLong,a.bUserSpecifiedCoordinates,a.nReflectance
	 
	 

	 FROM dbo.projects a  WITH (NOLOCK)
	 
	 left join dbo.city b on a.nCityID = b.nID left join dbo.stateProvince c on b.nStateProvinceID = c.nID
	 left join dbo.country d on c.nCountryID = d.nID
	 
	left join dbo.city e on a.nCityIDDemand = e.nID left join dbo.stateProvince f on e.nStateProvinceID = f.nID
	 left join dbo.country g on f.nCountryID = g.nID
	

	 where 

	( a.nUsersID=@nUserID or a.bGlobalUsers = 1) and
	  
	  ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtCreateDate desc

	
END
