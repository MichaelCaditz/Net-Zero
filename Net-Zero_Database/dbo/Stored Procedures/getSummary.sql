-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSummary]
	-- Add the parameters for the stored procedure here
	
	@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.nID,a.dtCreateDate,a.dtDate,a.nInsolation,a.cNote,a.nProjectsID,a.nInsolationPredicted,a.nInsolationPredictedEmperical,a.nInsolationPredictedEmpericalMonth,a.nDemandTotal,a.nRequiredPV,a.nChosenPV,
	 a.nMPPTFactor,a.nBatteryEfficiency,a.nInverterDerate,a.nDaysRunFullCharge,a.nVoltage,a.nChosenBattery,a.nRunningLoss,a.nLat,a.nLong,a.cChosenTilt,
	 a.nSunAltitude,a.nSunAltitude0800,a.nSunAltitude1600,a.nSunAzimuth,a.nSunAzimuth0800,a.nSunAzimuth1600,a.nDeclination,a.nChosenTiltDeg,a.nChosenBatterykWh,a.nBatteryRemainingkWh,
	 a.nAirMassRatio,a.nDayOfYear,a.nASHRAE_A,a.nASHRAE_k,a.nIB,a.nDNI,a.nDNIDay,a.nIncidence,a.nBeamCollector,a.nBeamCollectorEmperical,a.nSkyDiffuseFactor,a.nDiffuseCollector,a.nDiffuseCollectorEmperical,
	 a.nReflectedCollector,a.nReflectedCollectorEmperical,a.nBeamCollectorHorizontal,a.nDiffuseCollectorHorizontal,a.nDHI,a.nGHI,a.nDHIDay,a.nGHIDay,90-a.nSunAltitude as nOptimumTiltSQL,a.nIncidenceHNS,
	 a.nIBC_HNS,a.nIDC_HNS,a.nIRC_HNS,
	  a.nIBC_HNSEmperical,a.nIDC_HNSEmperical,a.nIRC_HNSEmperical,
	 a.nIncidenceHEW,a.nIBC_HEW,a.nIDC_HEW,a.nIRC_HEW,
	  a.nIncidenceVERT,a.nIBC_VERT,a.nIDC_VERT,a.nIRC_VERT,
	  a.nIncidencePNS,a.nIBC_PNS,a.nIDC_PNS,a.nIRC_PNS,
	  a.nIBC2,a.nIDC2,a.nIRC2,
	   a.nIBC2Emperical,a.nIDC2Emperical,a.nIRC2Emperical,
	  a.nHourAngle,a.nHoursMoreRun,a.dtCT,a.nChosenAzimuth,a.bIsDT,
	  a.nTotalEmpericalDay,a.bUserSpecifiedCoordinates

	 

	 FROM summary a  WITH (NOLOCK)
	 
	
	

	 where 

	( a.nProjectsID=@projectsID)
	  
	 and ((a.bDeleted is null or a.bDeleted=0) )
		
	order by a.dtDate asc

	
END
