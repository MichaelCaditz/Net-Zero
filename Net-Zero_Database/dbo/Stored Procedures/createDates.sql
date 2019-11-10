-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[createDates]
	-- Add the parameters for the stored procedure here
	
	@projectsID int,
	@originalbeginDate datetime,
	@endDate datetime,
	@nMetricsResolution int,
	@nMetricsHour int,
	@TMYFilename varchar(5000)
	

AS
BEGIN
 
declare @nCityID int
declare @nInsolation decimal (18,6)
declare @nLat decimal (18,6)
declare @nLong decimal (18,6)
declare @nVoltage decimal (18,6)
declare @nDemandTotal decimal (18,6)
declare @nDemandQty decimal (18,6)
--declare @nRequiredPV decimal (18,6)
declare @pvrequired decimal (18,6) =0
declare @nBatteryEfficiency decimal (18,6)
declare @nChosenAzimuth decimal (18,6)
declare @nInverterDerate decimal (18,6)
declare @nInsolationPredicted decimal (18,6)
declare @nInsolationPredictedEmperical decimal (18,6) =0
declare @nInsolationPredictedEmpericalMonth decimal (18,6) =0
declare @nMPPTFactor decimal (18,6)
declare @nChosenPV decimal (18,6)
declare @nChosenBattery decimal (18,6)
declare @cChosenTilt nvarchar(100) = ''
declare @nRunningLoss decimal (18,6) =0
declare @nMaxRunningLoss decimal (18,6) =0
declare @nDeclination decimal (28,16) =0
declare @nSunAltitude decimal (18,6) =0
declare @nSunAltitude0800 decimal (18,6) =0
declare @nSunAltitude1600 decimal (18,6) =0
declare @nSunAzimuth decimal (18,6) =0
declare @nSunAzimuth0800 decimal (18,6) =0
declare @nSunAzimuth1600 decimal (18,6) =0
declare @nDayNum int = 0
declare @nChosenTiltDeg decimal(18,6) = 0
declare @nChosenBatterykWh decimal(18,6) = 0
declare @nBatteryRemainingkWh decimal(18,6) = 0
declare @bUserSpecifiedCoordinates bit = 0
declare @nAirMassRatio decimal(18,6) = 0
declare @nDayOfYear int
declare @nASHRAE_A decimal(18,6) = 0
declare @nASHRAE_k decimal(18,6) = 0
declare @nIB decimal(18,6) = 0
declare @nDNI decimal(18,6) = 0
declare @nDHI decimal(18,6) = 0
declare @nGHI decimal(18,6) = 0
declare @nDNIDay decimal(18,6) = 0
declare @nDHIDay decimal(18,6) = 0
declare @nGHIDay decimal(18,6) = 0
declare @nTotalEmpericalDay decimal(18,6) = 0
declare @nCOS_Incidence decimal(18,6) = 0
declare @nIncidence decimal(18,6) = 0
declare @nCOS_IncidenceHNS decimal(18,6) = 0
declare @nIncidenceHNS decimal(18,6) = 0

declare @nCOS_IncidenceHEW decimal(18,6) = 0
declare @nIncidenceHEW decimal(18,6) = 0

declare @nCOS_IncidenceVERT decimal(18,6) = 0
declare @nIncidenceVERT decimal(18,6) = 0

declare @nCOS_IncidencePNS decimal(18,6) = 0
declare @nIncidencePNS decimal(18,6) = 0

declare @nBeamCollector decimal(18,6) = 0
declare @nBeamCollectorEmperical decimal(18,6) = 0
declare @nBeamCollectorHorizontal decimal(18,6) = 0
declare @nDiffuseCollectorHorizontal decimal(18,6) = 0
declare @nSkyDiffuseFactor decimal(18,6) = 0
declare @nDiffuseCollector decimal(18,6) = 0
declare @nDiffuseCollectorEmperical decimal(18,6) = 0
declare @nReflectance decimal(18,6) = 0
declare @nReflectedCollector decimal(18,6) = 0
declare @nReflectedCollectorEmperical decimal(18,6) = 0
declare @nIBC_HNS decimal(18,6) = 0
declare @nIDC_HNS decimal(18,6) = 0
declare @nIRC_HNS decimal(18,6) = 0
declare @nIBC_HNSEmperical decimal(18,6) = 0
declare @nIDC_HNSEmperical decimal(18,6) = 0
declare @nIRC_HNSEmperical decimal(18,6) = 0
declare @nIBC_HEW decimal(18,6) = 0
declare @nIDC_HEW decimal(18,6) = 0
declare @nIRC_HEW decimal(18,6) = 0
declare @nIBC_VERT decimal(18,6) = 0
declare @nIDC_VERT decimal(18,6) = 0
declare @nIRC_VERT decimal(18,6) = 0
declare @nIBC_PNS decimal(18,6) = 0
declare @nIDC_PNS decimal(18,6) = 0
declare @nIRC_PNS decimal(18,6) = 0
declare @nIBC2 decimal(18,6) = 0
declare @nIDC2 decimal(18,6) = 0
declare @nIRC2 decimal(18,6) = 0
declare @nIBC2Emperical decimal(18,6) = 0
declare @nIDC2Emperical decimal(18,6) = 0
declare @nIRC2Emperical decimal(18,6) = 0

declare @nHourAngle decimal(18,6) = 0
declare @nGMTPlusMinus decimal(18,6) = 0
declare @dtCT datetime
declare @nCustomTilt decimal(18,6) = 0
declare @bDaylightTime bit
declare @dtDaylightFirst datetime
declare @dtDaylightLast datetime

declare @isDT bit =0
declare @nUseThisInsolation decimal (18,6)
declare @nHoursMoreRun decimal (18,6)
declare @nDaysRunFullCharge decimal (18,6)
declare @beginDate datetime=@originalbeginDate
 --declare @newDay bit = 0 
	--declare @oldDate datetime 
 
  select @nCityID=a.nCityID,
@nInsolation=a.nChosenInsolation,
@bUserSpecifiedCoordinates=a.bUserSpecifiedCoordinates,
@nReflectance=a.nReflectance,
@nVoltage=a.nVoltage,
@cChosenTilt=a.cChosenTilt,
@nChosenBattery=a.nChosenBattery,
@nDemandTotal=a.nDemandTotal,
@nDemandQty=a.nDemandQty,
@nBatteryEfficiency=a.nBatteryEfficiency,
@nChosenAzimuth=a.nChosenAzimuth,
@nInverterDerate=a.nInverterDerate,
@nMPPTFactor = a.nMPPTFactor,
@nChosenPV=a.nChosenPV,
@nGMTPlusMinus=a.nGMTPlusMinus,
@nCustomTilt=a.nCustomTilt,
@bDaylightTime =a.bDaylightTime,
@dtDaylightFirst =a.dtDaylightFirst,
@dtDaylightLast = a.dtDaylightLast

from dbo.projects a
where a.nID=@projectsID

if @bUserSpecifiedCoordinates is null or @bUserSpecifiedCoordinates=0
begin
select @nLat=b.nLat, @nLong=b.nLong from dbo.projects a inner join dbo.city b on a.nCityID = b.nID where a.nID=@projectsID
end
else
begin
select @nLat=a.nManualLat, @nLong= a.nManualLong from dbo.projects a where a.nID=@projectsID
end


select @nMaxRunningLoss=(@nChosenBattery*@nVoltage)/1000

select @nChosenBatterykWh=(@nChosenBattery*@nVoltage)/1000


SET NOCOUNT ON;

	 --update a
	-- set bDeleted =1
	 
	-- from dbo.summary a

	-- where a.nProjectsID=@projectsID
	 
	--and ((a.bDeleted is null or a.bDeleted=0) )

	delete  dbo.summary 
	where nProjectsID=@projectsID

	

	if @nMetricsResolution=0
	begin
	set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),@nMetricsHour,0,0,0)
	set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),@nMetricsHour,0,0,0)
	end

	if @nMetricsResolution=1
	begin
	set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),0,0,0,0)
	set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),23,0,0,0)
	end

	
	
	
	if @nMetricsResolution=2
	begin
	set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),0,0,0,0)
	set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),23,0,0,0)
	end
	--set @oldDate = @beginDate
	--set @nInsolationPredictedEmperical=0
	while @beginDate <= @endDate
	begin

	set @nHourAngle = 15*(datediff(hour,@beginDate,datetimefromparts (datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),12,00,0,0)))

	select @nBatteryRemainingkWh=
	case when @nChosenBatterykWh-@nRunningLoss > @nChosenBatterykWh
	then @nChosenBatterykWh
	else @nChosenBatterykWh-@nRunningLoss
	end

	
	

	set @nDayNum = datepart(dayofyear, @beginDate)
	set @nDayOfYear = @nDayNum
	set @nDeclination = [dbo].[UDF_getDeclination](@nDayOfYear)

	set @nSunAltitude = [dbo].[UDF_getAltitude](@nLat,@nDeclination,@nHourAngle)
	

	set @nSunAzimuth = [dbo].[UDF_getAzimuth](@nDeclination,@nHourAngle,@nSunAltitude,@nLat)

	set @dtCT= [dbo].[UDF_getCT] (@nGMTPlusMinus,@nDayOfYear,@beginDate,@nLong,@bDaylightTime,@dtDaylightFirst,@dtDaylightLast)
	
	select @nChosenTiltDeg = 
	 case
	when @cChosenTilt ='90 Deg' then 90
	when @cChosenTilt = 'Latitude' then @nLat
	when @cChosenTilt = 'Latitude Plus 15 Deg' then @nLat+15
	when @cChosenTilt = 'Latitude Minus 15 Deg' then @nLat-15
	when @cChosenTilt = 'No Tilt' then 0
	when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then 90-@nSunAltitude--HNS tracks altitude correctly like 2 axis
	
	when @cChosenTilt = '1 Axis Track HNS' then 90
	when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then 90-@nSunAltitude--HEW we are not sure of altitude
	when @cChosenTilt = '1 Axis Track HEW' then 0
	when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then 90-@nSunAltitude--PNS we are not sure of altitude
	when @cChosenTilt = '1 Axis Track PNS' then 0
	when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then @nCustomTilt--VERT altitude set by custom tilt
	when @cChosenTilt = '1 Axis Track VERT' then @nCustomTilt
	when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then 90-@nSunAltitude
	when @cChosenTilt = '2 Axis Track'  then 90

	when @cChosenTilt = 'Custom' then @nCustomTilt
	
	else 500000
	end
	
	select @nChosenAzimuth = 
	 case
	when @cChosenTilt ='90 Deg' then @nChosenAzimuth
	when @cChosenTilt = 'Latitude' then @nChosenAzimuth
	when @cChosenTilt = 'Latitude Plus 15 Deg' then @nChosenAzimuth
	when @cChosenTilt = 'Latitude Minus 15 Deg' then @nChosenAzimuth
	when @cChosenTilt = 'No Tilt' then @nChosenAzimuth
	when @cChosenTilt = '1 Axis Track HNS' then 0
	when @cChosenTilt = '1 Axis Track HEW' then 0
	when @cChosenTilt = '1 Axis Track PNS' then 0
	when @cChosenTilt = '1 Axis Track VERT' then 0
	when @cChosenTilt = '2 Axis Track'  then @nSunAzimuth

	--when @cChosenTilt = 'Custom' then @nCustomTilt
	
	else @nChosenAzimuth
	end

	DECLARE @roundedDtCT datetime= 
	
	DATEADD(hour, DATEDIFF(hour, 0,
			 DATEADD(minute, 30 - DATEPART(minute, @dtCT + '00:30:00.000'),
			 @dtCT)), 0)

	
	
	if @TMYFilename <>''

		begin

				declare @strippedFileName varchar(4000) = trim('.csv' from right(@TMYFilename,CHARINDEX('\',REVERSE(@TMYFilename)) -1))
				DECLARE @tableName sysname = '[dbo].['+@strippedFileName+']'

					if @nMetricsResolution=0
					begin

					DECLARE @ParmDefinition0 nvarchar(500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT'
					
					declare @sql0 NVARCHAR(4000) =

					N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
					where month(a.dtDate)=month(@bDate)
					and day(a.dtDate)=day(@bDate)
					and datepart(hour,a.dtDate)=datepart(hour,@bDate)'

					----exec sp_executesql @sql2, @ParmDefinition2, @bDate=@beginDate,@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT--solar time

					




					end


				if @nMetricsResolution=1
				begin

				DECLARE @ParmDefinition1 nvarchar(500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT';

				declare @sql1 NVARCHAR(4000) =

				N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)
				and datepart(hour,a.dtDate)=datepart(hour,@bDate)'


				--exec sp_executesql @sql1, @ParmDefinition1, @bDate=@beginDate,@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--solar time
				exec sp_executesql @sql1, @ParmDefinition1,@bDate= @roundedDtCT,
				@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--civil time

				exec sp_executesql @sql0, @ParmDefinition0, @bDate=@roundedDtCT,
				@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--civil time



				DECLARE @ParmDefinition10 nvarchar(500) = N'@bDate datetime2, @nDNIOUTDay decimal OUTPUT, @nDHIOUTDay decimal OUTPUT,@nGHIOUTDay decimal OUTPUT'

				declare @sql10 NVARCHAR(4000) =

				N'select @nDNIOUTDay=sum(a.nDNI), @nDHIOUTDay = sum(a.nDHI), @nGHIOUTDay = sum(a.nGHI) from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)'

				----exec sp_executesql @sql2, @ParmDefinition2, @bDate=@beginDate,@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT--solar time

				exec sp_executesql @sql10, @ParmDefinition10, @bDate=@roundedDtCT,
				@nDNIOUTDay = @nDNIDay OUTPUT, @nDHIOUTDay = @nDHIDay OUTPUT, @nGHIOUTDay = @nGHIDay OUTPUT--civil time


				end

				if @nMetricsResolution=2
				begin

				DECLARE @ParmDefinition2 nvarchar(500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT';

				declare @sql2 NVARCHAR(4000) =

				N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)
				and datepart(hour,a.dtDate)=datepart(hour,@bDate)'


				--exec sp_executesql @sql1, @ParmDefinition1, @bDate=@beginDate,@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--solar time
				exec sp_executesql @sql2, @ParmDefinition2,@bDate= @roundedDtCT,
				@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--civil time

				--select top 1 @nDNI=a.nDNI, @nDHI = a.nDHI from [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy] a
				--where month(a.dtDate)=month(@beginDate)
				--and day(a.dtDate)=day(@beginDate)
				--and datepart(hour,a.dtDate)=datepart(hour,@beginDate)


				end
		end


	if @bUserSpecifiedCoordinates  is null or @bUserSpecifiedCoordinates=0
	begin
		select @nInsolationPredicted = 
		case @cChosenTilt
			when '90 Deg' then
			(select s.nTilt90 from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when 'Latitude' then
			(select s.nTiltLat from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when 'Latitude Plus 15 Deg' then
			(select s.nTiltLatPlus15 from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when 'Latitude Minus 15 Deg' then
			(select s.nTiltLatMinus15 from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when 'No Tilt' then
			(select s.nTilt0 from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when '2 Axis Track' then
			(select s.n2Axis from dbo.insolation s where s.nCityID = @nCityID and nMonth = DATEPART(MONTH,@beginDate))
			when 'Custom' then
			0
			else 0
		end
	end
	else 
	begin
	--select @nInsolationPredicted = @nDNI   --change this to total emperical insolation
	select @nInsolationPredicted = 0
	end

	--select @nDHI = 5000.1111
	----------------------------------------R
	
	set @nAirMassRatio = [dbo].[UDF_getAirMassRatio](@nSunAltitude)
	set @nASHRAE_A = [dbo].[UDF_get@ASHRAE_A](@nDayOfYear)
	set @nASHRAE_k = [dbo].[UDF_get@ASHRAE_k](@nDayOfYear)
	set @nIB = [dbo].[UDF_get@nIB](@nASHRAE_A,@nASHRAE_k,@nAirMassRatio)

	set @nCOS_Incidence = 
	 case
	when @cChosenTilt ='90 Deg' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	when @cChosenTilt = 'Latitude' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	when @cChosenTilt = 'Latitude Plus 15 Deg' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	when @cChosenTilt = 'Latitude Minus 15 Deg' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	when @cChosenTilt = 'No Tilt' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then [dbo].[UDF_getIncidenceHNS](@nSunAltitude,@nSunAzimuth)
	when @cChosenTilt = '1 Axis Track HNS' then [dbo].[UDF_getIncidenceHNS](@nSunAltitude,@nSunAzimuth)
	when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then [dbo].[UDF_getIncidenceHEW](@nSunAltitude,@nSunAzimuth)
	when @cChosenTilt = '1 Axis Track HEW' then [dbo].[UDF_getIncidenceHEW](@nSunAltitude,@nSunAzimuth)
	when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then [dbo].[UDF_getIncidencePNS](@nDeclination)
	when @cChosenTilt = '1 Axis Track PNS' then [dbo].[UDF_getIncidencePNS](@nDeclination)
	when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then [dbo].[UDF_getIncidenceVERT](@nSunAltitude,@nChosenTiltDeg)
	when @cChosenTilt = '1 Axis Track VERT' then [dbo].[UDF_getIncidenceVERT](@nSunAltitude,@nChosenTiltDeg)
	when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)
	when @cChosenTilt = '2 Axis Track'  then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)

	when @cChosenTilt = 'Custom' then [dbo].[UDF_getIncidence](@nSunAltitude,@nSunAzimuth,@nChosenTiltDeg,@nChosenAzimuth)--cos θ
	
	else 500000
	end
	------------------------------------R
	
	set @nIncidence = degrees(ACOS(@nCOS_Incidence))
	
	set @nCOS_IncidenceHNS = [dbo].[UDF_getIncidenceHNS](@nSunAltitude,@nSunAzimuth)
	
	set @nIncidenceHNS = degrees(ACOS(@nCOS_IncidenceHNS))
	
	set @nCOS_IncidenceHEW = [dbo].[UDF_getIncidenceHEW](@nSunAltitude,@nSunAzimuth)
	
	set @nIncidenceHEW = degrees(ACOS(@nCOS_IncidenceHEW))
	
	set @nCOS_IncidenceVERT = [dbo].[UDF_getIncidenceVERT](@nSunAltitude,@nChosenTiltDeg)
	
	set @nIncidenceVERT = degrees(ACOS(@nCOS_IncidenceVERT))
	
	set @nCOS_IncidencePNS = [dbo].[UDF_getIncidencePNS](@nDeclination)
	
	set @nIncidencePNS = degrees(ACOS(@nCOS_IncidencePNS))
	
	set @nBeamCollector = @nIB * @nCOS_Incidence
	set @nBeamCollectorEmperical = @nCOS_Incidence * @nDNI
	
	set @nBeamCollectorHorizontal = [dbo].[UDF_getBeamCollectorHorizontal] (@nIB,@nSunAltitude)
	
	set @nSkyDiffuseFactor = [dbo].[UDF_getSkyDiffuseFactor](@nDayOfYear)
	
	set @nDiffuseCollectorHorizontal = @nIB*@nSkyDiffuseFactor
	
	set @nDiffuseCollector = 
	case
	when @cChosenTilt ='90 Deg' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = 'Latitude' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = 'Latitude Plus 15 Deg' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = 'Latitude Minus 15 Deg' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = 'No Tilt' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then [dbo].[UDF_getIDC_HNS](@nSunAltitude,@nIncidenceHNS,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '1 Axis Track HNS' then [dbo].[UDF_getIDC_HNS](@nSunAltitude,@nIncidenceHNS,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then [dbo].[UDF_getIDC_HEW](@nSunAltitude,@nIncidenceHEW,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '1 Axis Track HEW' then [dbo].[UDF_getIDC_HEW](@nSunAltitude,@nIncidenceHEW,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then [dbo].[UDF_getIDC_PNS](@nDeclination,@nDiffuseCollectorHorizontal,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track PNS' then [dbo].[UDF_getIDC_PNS](@nDeclination,@nDiffuseCollectorHorizontal,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '1 Axis Track VERT' then [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg,@nDiffuseCollectorHorizontal)
	when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	when @cChosenTilt = '2 Axis Track'  then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)

	when @cChosenTilt = 'Custom' then [dbo].[UDF_getDiffuse](@nIB,@nSkyDiffuseFactor,@nChosenTiltDeg)
	
	else 500000
	end
	
	set @nDiffuseCollectorEmperical =
	---@nDHI*((1+cos(radians(@nChosenTiltDeg)))/2)
	case
		when @cChosenTilt ='90 Deg' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = 'Latitude' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = 'Latitude Plus 15 Deg' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = 'Latitude Minus 15 Deg' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = 'No Tilt' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude,@nIncidenceHNS,@nDiffuseCollectorHorizontal)
		when @cChosenTilt = '1 Axis Track HNS' then [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude,@nIncidenceHNS,@nDHI)
		when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then [dbo].[UDF_getIDC_HEW](@nSunAltitude,@nIncidenceHEW,@nDiffuseCollectorHorizontal)
		when @cChosenTilt = '1 Axis Track HEW' then [dbo].[UDF_getIDC_HEW](@nSunAltitude,@nIncidenceHEW,@nDiffuseCollectorHorizontal)
		when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then [dbo].[UDF_getIDC_PNS](@nDeclination,@nDiffuseCollectorHorizontal,@nSunAltitude)
		when @cChosenTilt = '1 Axis Track PNS' then [dbo].[UDF_getIDC_PNS](@nDeclination,@nDiffuseCollectorHorizontal,@nSunAltitude)
		when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg,@nDiffuseCollectorHorizontal)
		when @cChosenTilt = '1 Axis Track VERT' then [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg,@nDiffuseCollectorHorizontal)
		when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
		when @cChosenTilt = '2 Axis Track'  then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)

		when @cChosenTilt = 'Custom' then [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
	
	else 500000
	end


	set @nReflectedCollector = 
	case
	when @cChosenTilt ='90 Deg' then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude' then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude Plus 15 Deg' then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude Minus 15 Deg' then[dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'No Tilt' then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then [dbo].[UDF_getIRC_HNS](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track HNS' then [dbo].[UDF_getIRC_HNS](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then [dbo].[UDF_getIRC_HEW](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track HEW' then [dbo].[UDF_getIRC_HEW](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then [dbo].[UDF_getIRC_PNS](@nReflectance,@nIB,@nSkyDiffuseFactor, @nDeclination,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track PNS' then [dbo].[UDF_getIRC_PNS](@nReflectance,@nIB,@nSkyDiffuseFactor, @nDeclination,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then [dbo].[UDF_getIRC_VERT](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track VERT' then [dbo].[UDF_getIRC_VERT](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = '2 Axis Track'  then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )

	when @cChosenTilt = 'Custom' then [dbo].[UDF_getReflected](@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	
	else 500000
	end

	set @nReflectedCollectorEmperical = 
	
	--@nGHI*@nReflectance*((1-cos(radians(@nChosenTiltDeg)))/2)
	case
	when @cChosenTilt ='90 Deg' then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude' then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude Plus 15 Deg' then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'Latitude Minus 15 Deg' then[dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = 'No Tilt' then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = '1 Axis Track HNS' and @nSunAltitude>0 then [dbo].[UDF_getIRC_HNSEmperical](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nGHI)
	when @cChosenTilt = '1 Axis Track HNS' then [dbo].[UDF_getIRC_HNS](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track HEW' and @nSunAltitude>0 then [dbo].[UDF_getIRC_HEW](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track HEW' then [dbo].[UDF_getIRC_HEW](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track PNS' and @nSunAltitude>0 then [dbo].[UDF_getIRC_PNS](@nReflectance,@nIB,@nSkyDiffuseFactor, @nDeclination,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track PNS' then [dbo].[UDF_getIRC_PNS](@nReflectance,@nIB,@nSkyDiffuseFactor, @nDeclination,@nSunAltitude)
	when @cChosenTilt = '1 Axis Track VERT' and @nSunAltitude>0 then [dbo].[UDF_getIRC_VERT](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '1 Axis Track VERT' then [dbo].[UDF_getIRC_VERT](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)
	when @cChosenTilt = '2 Axis Track'  and @nSunAltitude>0 then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	when @cChosenTilt = '2 Axis Track'  then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )

	when @cChosenTilt = 'Custom' then [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )
	
	else 500000
	end
	
	
	--declare @nInsolationToday decimal (18,6)
	--declare @nYear int = year(@beginDate)
	--declare @nDY int = datepart(dy,@beginDate)
	--if datepart(dy,@beginDate) <> datepart(dy,@oldDate)
	--begin

	--DECLARE @ParmDefinition5 nvarchar(500) = N'@year int, @dy int, @nTotalInsolationOut decimal OUTPUT';   

	----if we were to average:
	----select  @nDNI=avg(a.nDNI) from [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy] a 
	----where month(a.dtDate)=month(@beginDate)
	----and day(a.dtDate)=day(@beginDate)


	--	declare @sql5 NVARCHAR(4000) =

	--	N'select @nTotalInsolationOut=sum(a.nTotalEmperical) from ' + @tableName + ' a 
	--	where year(a.dtDate)=@year
	--	and datepart(dy,a.dtDate)=@dy'

	
	--	--exec sp_executesql @sql5, @ParmDefinition5, @nYear = year(@beginDate),@nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT--solar time
	--	exec sp_executesql @sql5, @ParmDefinition5,@year = @nYear,@dy  = @nDY,
	--	@nTotalInsolationOut = @nInsolationToday OUTPUT




	--set @nInsolationPredictedEmperical = @nInsolationToday
	--set @oldDate = @beginDate
	--end
	--else
	--begin
	--set @nInsolationPredictedEmperical = @nInsolationToday
	--end



	set @nIBC_HNS = @nIB*@nCOS_IncidenceHNS
	set @nIDC_HNS = [dbo].[UDF_getIDC_HNS](@nSunAltitude,@nIncidenceHNS,@nDiffuseCollectorHorizontal)
	set @nIRC_HNS = [dbo].[UDF_getIRC_HNS](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nIB)

	set @nIBC_HNSEmperical = @nDNI*@nCOS_IncidenceHNS
	set @nIDC_HNSEmperical = [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude,@nIncidenceHNS,@nDiffuseCollectorHorizontal)
	set @nIRC_HNSEmperical = [dbo].[UDF_getIRC_HNSEmperical](@nReflectance,@nSunAltitude,@nIncidenceHNS,@nSkyDiffuseFactor,@nGHI)

	
	set @nIBC_HEW = @nIB*@nCOS_IncidenceHEW
	set @nIDC_HEW = [dbo].[UDF_getIDC_HEW](@nSunAltitude,@nIncidenceHEW,@nDiffuseCollectorHorizontal)
	set @nIRC_HEW = [dbo].[UDF_getIRC_HEW](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)

	
	set @nIBC_VERT = @nIB*@nCOS_IncidenceVERT
	set @nIDC_VERT = [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg,@nDiffuseCollectorHorizontal)
	set @nIRC_VERT = [dbo].[UDF_getIRC_VERT](@nReflectance,@nSunAltitude,@nIncidenceHEW,@nSkyDiffuseFactor,@nIB)

	
	set @nIBC_PNS = @nIB*@nCOS_IncidencePNS
	set @nIDC_PNS = [dbo].[UDF_getIDC_PNS](@nDeclination,@nDiffuseCollectorHorizontal,@nSunAltitude)
	set @nIRC_PNS = [dbo].[UDF_getIRC_PNS](@nReflectance,@nIB,@nSkyDiffuseFactor, @nDeclination,@nSunAltitude)

	set @nIBC2 = @nIB
	set @nIDC2 = [dbo].[UDF_getIDC2] (@nIB,@nSkyDiffuseFactor,@nSunAltitude)
	set @nIRC2 = [dbo].[UDF_getIRC2] (@nReflectance,@nSunAltitude,@nSkyDiffuseFactor,@nIB)

	set @nIBC2Emperical = @nCOS_Incidence * @nDNI
	set @nIDC2Emperical = [dbo].[UDF_getDiffuseEmperical](@nDHI,@nSkyDiffuseFactor,@nChosenTiltDeg)
	set @nIRC2Emperical = [dbo].[UDF_getReflectedEmperical](@nGHI,@nSkyDiffuseFactor,@nSunAltitude,@nIB,@nReflectance,   @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal,@nChosenTiltDeg )

	--set @dtCT= [dbo].[UDF_getCT] (@nGMTPlusMinus,@nDayOfYear,@beginDate,@nLong,@bDaylightTime,@dtDaylightFirst,@dtDaylightLast)--moved to above

	if datepart(dy,@beginDate)>=datepart(dy,@dtDaylightFirst) and datepart(dy,@beginDate)<=datepart(dy,@dtDaylightLast)
	set @isDT = 1
	else
	set @isDT = 0


	
	
	--if @nInsolationPredicted>0
	--begin
	--select @pvrequired =((@nDemandTotal*@nDemandQty)/(@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted))
	--end
	
	--else
	--begin
	--select @pvrequired =0
	--end

	if @nInsolationPredicted>0
	begin
	select @nUseThisInsolation=@nInsolationPredicted
	end
	else
	begin
	select @nUseThisInsolation=@nInsolationPredictedEmperical
	end


	insert into dbo.summary

	

	(nDiffuseCollectorHorizontal,nBeamCollectorHorizontal,nReflectedCollector,nReflectedCollectorEmperical,nDiffuseCollector,
	nDiffuseCollectorEmperical,nSkyDiffuseFactor, nBeamCollector, nBeamCollectorEmperical,nIncidence,
	nIB,nDNI,nDHI,nGHI,nASHRAE_A,nASHRAE_k,
	nDayOfYear,nAirMassRatio,nChosenBatterykWh,nBatteryRemainingkWh,
	nChosenTiltDeg,nDeclination,nSunAltitude,nSunAltitude0800,nSunAltitude1600,
	nSunAzimuth,nSunAzimuth0800,nSunAzimuth1600,cChosenTilt,nLat,nLong,nChosenBattery,
	nVoltage,nChosenAzimuth,nDaysRunFullCharge,nHoursMoreRun,nMPPTFactor,nBatteryEfficiency,nInverterDerate,
	nChosenPV,nProjectsID,nInsolation,dtDate,nDemandTotal,nInsolationPredicted,nInsolationPredictedEmperical,
	nInsolationPredictedEmpericalMonth,
	nRunningLoss,
	nIncidenceHNS,nIBC_HNS,nIDC_HNS,nIRC_HNS,
	nIBC_HNSEmperical,nIDC_HNSEmperical,nIRC_HNSEmperical,
	nIncidenceHEW,nIBC_HEW,nIDC_HEW,nIRC_HEW,
	nIncidenceVERT,nIBC_VERT,nIDC_VERT,nIRC_VERT,
	nIncidencePNS,nIBC_PNS,nIDC_PNS,nIRC_PNS,
	nIBC2,nIDC2,nIRC2,
	nIBC2Emperical,nIDC2Emperical,nIRC2Emperical,
	nHourAngle,dtCT,bIsDT,
	nDNIDay,nDHIDay,nGHIDay,nTotalEmpericalDay,
	bUserSpecifiedCoordinates
	
	
	)

	values 
	(
	@nDiffuseCollectorHorizontal,
	@nBeamCollectorHorizontal,
	@nReflectedCollector,
	@nReflectedCollectorEmperical,
	@nDiffuseCollector,
	@nDiffuseCollectorEmperical,
	@nSkyDiffuseFactor,
	@nBeamCollector,
	@nBeamCollectorEmperical,
	@nIncidence,
	@nIB,
	@nDNI,
	@nDHI,
	@nGHI,
	@nASHRAE_A,
	@nASHRAE_k,
	@nDayOfYear,
	@nAirMassRatio,
	@nChosenBatterykWh,
	@nBatteryRemainingkWh,
	@nChosenTiltDeg,
	@nDeclination,
	@nSunAltitude,
	@nSunAltitude0800,
	@nSunAltitude1600,
	@nSunAzimuth,
	@nSunAzimuth0800,
	@nSunAzimuth1600,
	@cChosenTilt,
	@nLat,
	@nLong,
	@nChosenBattery,
	@nVoltage,
	@nChosenAzimuth,

	case when

	((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty))< 0

	then

	((@nChosenBattery*@nVoltage)/1000)/-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty))
	else 0
	end,




	case when

	(((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty)))< 0  --if net power balance (PVin, demand out) is less than zero and is not zer (prevent divide by zero error)

	then

	((((@nChosenBattery*@nVoltage)/1000)-@nRunningLoss)/-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty)))*24  --then kWh stored in battery/kWh energy defecit per day is number of days left, *24 is number of hours left
	else 999999999
	end,





	@nMPPTFactor,
	@nBatteryEfficiency, 
	@nInverterDerate,
	@nChosenPV,
	@projectsID,
	@nInsolation,
	@beginDate,
	(@nDemandTotal*@nDemandQty),


	@nInsolationPredicted,
	@nInsolationPredictedEmperical,
	@nInsolationPredictedEmpericalMonth,
	@nRunningLoss,
	@nIncidenceHNS	,
	@nIBC_HNS,
	@nIDC_HNS,
	@nIRC_HNS,
	@nIBC_HNSEmperical,
	@nIDC_HNSEmperical,
	@nIRC_HNSEmperical,
	@nIncidenceHEW,
	@nIBC_HEW,
	@nIDC_HEW,
	@nIRC_HEW,
	@nIncidenceVERT,
	@nIBC_VERT,
	@nIDC_VERT,
	@nIRC_VERT,
	@nIncidencePNS,
	@nIBC_PNS,
	@nIDC_PNS,
	@nIRC_PNS,
	@nIBC2,
	@nIDC2,
	@nIRC2,
	@nIBC2Emperical,
	@nIDC2Emperical,
	@nIRC2Emperical,
	@nHourAngle,
	@dtCT,
	@isDT,
	@nDNIDay,
	@nDHIDay,
	@nGHIDay,
	@nTotalEmpericalDay,
	@bUserSpecifiedCoordinates
	)

	

	select @nRunningLoss=
	case 
	when 	@nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nUseThisInsolation)-(@nDemandTotal*@nDemandQty))<0
	then 0
	
	when @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nUseThisInsolation)-(@nDemandTotal*@nDemandQty)) <=@nMaxRunningLoss
	and @nMetricsResolution=1
	then 
	
	@nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nUseThisInsolation)-(@nDemandTotal*@nDemandQty))/24
	
	when @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nUseThisInsolation)-(@nDemandTotal*@nDemandQty)) <=@nMaxRunningLoss
	and @nMetricsResolution!=1
	then 
	@nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nUseThisInsolation)-(@nDemandTotal*@nDemandQty))
	
	else @nMaxRunningLoss
	--else @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty))
	end
	--end
	if @nMetricsResolution=0
	begin
	select @beginDate=dateadd(day,1,@beginDate)
	end

	if @nMetricsResolution=1
	begin
	select @beginDate=dateadd(hour,1,@beginDate)
	end
	
	

	
END

--go thru again add total emperical
if @bUserSpecifiedCoordinates=1

	begin

		set @nRunningLoss=0

		set @beginDate =@originalbeginDate

		if @nMetricsResolution=0
		begin
		set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),@nMetricsHour,0,0,0)
		set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),@nMetricsHour,0,0,0)
		end

		if @nMetricsResolution=1
		begin
		set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),0,0,0,0)
		set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),23,0,0,0)
		end

		if @nMetricsResolution=2
		begin
		set @beginDate = DATETIMEFROMPARTS(datepart(year,@beginDate),datepart(month,@beginDate),datepart(day,@beginDate),0,0,0,0)
		set @endDate = DATETIMEFROMPARTS(datepart(year,@endDate),datepart(month,@endDate),datepart(day,@endDate),23,0,0,0)
		end
		--set @oldDate = @beginDate
		--set @nInsolationPredictedEmperical=0


		while @beginDate <= @endDate
			begin

					update dbo.summary
					set nTotalEmpericalDay=

					(select sum(a.nTotalEmperical)

					from summary a
					where year(a.dtDate)=year(@beginDate)
					and datepart(dy,a.dtDate) =  datepart(dy,@beginDate)
					and nProjectsID=@projectsID)
		
					where 

					year(dtDate)=year(@beginDate)
					and datepart(dy,dtDate) =  datepart(dy,@beginDate)
					and nProjectsID=@projectsID


				



					update dbo.summary
					set nInsolationPredictedEmperical=

					(select (sum(a.nTotalEmperical)/1000)

					from summary a
					where year(a.dtDate)=year(@beginDate)
					and datepart(dy,a.dtDate) =  datepart(dy,@beginDate)
					and nProjectsID=@projectsID)
		
					--,
					--nRequiredPV =((@nDemandTotal*@nDemandQty)/(@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical))
		

					where 

					year(dtDate)=year(@beginDate)
					and datepart(dy,dtDate) =  datepart(dy,@beginDate)
					and nProjectsID=@projectsID



					update dbo.summary
					set nInsolationPredictedEmpericalMonth=

					(select (avg(a.nInsolationPredictedEmperical))
	
					from summary a
					where year(a.dtDate)=year(@beginDate)
					and datepart(MONTH,a.dtDate) =  datepart(MONTH,@beginDate)
					and nProjectsID=@projectsID
					)

					where 

					year(dtDate)=year(@beginDate)
					and datepart(MONTH,dtDate) =  datepart(MONTH,@beginDate)
					and nProjectsID=@projectsID




			

					set @nInsolationPredictedEmperical =
					(select nInsolationPredictedEmperical
					from dbo.summary
					where dtDate=@beginDate
					and nProjectsID=@projectsID)

					--select @nRunningLoss=@nRunningLoss+1

					select @nRunningLoss=
					case 
					when 	@nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty))<0
					then 0
	
					when @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty)) <=@nMaxRunningLoss
					and @nMetricsResolution=1
					--then @nChosenPV *@nInsolationPredictedEmperical
					--then  @nChosenPV
					--then  @nChosenPV
					--then  @nInsolationPredictedEmperical
					--then 24312.11*2.68
					--then 777
	
					then @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty))/24
	
					when @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty)) <=@nMaxRunningLoss
					and @nMetricsResolution!=1
					then @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty))
	
					else @nMaxRunningLoss
					--else @nRunningLoss-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredicted)-(@nDemandTotal*@nDemandQty))
					end

					select @nDaysRunFullCharge =
					case when

					((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty))< 0

					then

					((@nChosenBattery*@nVoltage)/1000)/-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty))
					else 0
					end
					

					select @nHoursMoreRun=
					case when

					(((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty)))< 0 --if net power balance (PVin, demand out) is less than zero and is not zer (prevent divide by zero error)

					then

					((((@nChosenBattery*@nVoltage)/1000)-@nRunningLoss)/-((@nChosenPV*@nBatteryEfficiency*@nInverterDerate*@nMPPTFactor*@nInsolationPredictedEmperical)-(@nDemandTotal*@nDemandQty)))*24 --then kWh stored in battery/kWh energy defecit per day is number of days left, *24 is number of hours left
					else 999999999
					end

					select @nBatteryRemainingkWh=
					case when @nChosenBatterykWh-@nRunningLoss > @nChosenBatterykWh
					then @nChosenBatterykWh
					else @nChosenBatterykWh-@nRunningLoss
					end
			
			
					update  dbo.summary
					set nRunningLoss =@nRunningLoss,
					nBatteryRemainingkWh=@nBatteryRemainingkWh,
					nHoursMoreRun = @nHoursMoreRun,
					nDaysRunFullCharge=@nDaysRunFullCharge
				
					where dtDate=@beginDate
					and nProjectsID=@projectsID
	
					if @nMetricsResolution=0
					begin
					select @beginDate=dateadd(day,1,@beginDate)
					end

					if @nMetricsResolution=1
					begin
					select @beginDate=dateadd(hour,1,@beginDate)
					end


				end


				

		end






END