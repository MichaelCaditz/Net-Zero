CREATE TABLE [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy] (
    [nID]             INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]    DATETIME2 (7)   CONSTRAINT [DF_53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy_dtCreateDate] DEFAULT (getdate()) NULL,
    [nYear]           INT             NULL,
    [nMonth]          INT             NULL,
    [nDay]            INT             NULL,
    [nHour]           INT             NULL,
    [nMinute]         INT             NULL,
    [nDNI]            INT             NULL,
    [nDHI]            INT             NULL,
    [nGHI]            INT             NULL,
    [nDew_Point]      DECIMAL (18, 4) NULL,
    [nTemperature]    DECIMAL (18, 4) NULL,
    [nPressure]       DECIMAL (18, 4) NULL,
    [nWind_Direction] DECIMAL (18, 4) NULL,
    [nWind_Speed]     DECIMAL (18, 4) NULL,
    [nSurface_Albedo] DECIMAL (18, 4) NULL,
    [dtDate]          DATETIME2 (7)   NULL,
    CONSTRAINT [PK_53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy_Staged] (
    [Year]           INT             NULL,
    [Month]          INT             NULL,
    [Day]            INT             NULL,
    [Hour]           INT             NULL,
    [Minute]         INT             NULL,
    [DNI]            INT             NULL,
    [DHI]            INT             NULL,
    [GHI]            INT             NULL,
    [Dew_Point]      DECIMAL (18, 4) NULL,
    [Temperature]    DECIMAL (18, 4) NULL,
    [Pressure]       DECIMAL (18, 4) NULL,
    [Wind_Direction] DECIMAL (18, 4) NULL,
    [Wind_Speed]     DECIMAL (18, 4) NULL,
    [Surface_Albedo] DECIMAL (18, 4) NULL
);

GO
CREATE TABLE [dbo].[battery] (
    [nID]                    INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]           DATETIME2 (7)   CONSTRAINT [DF_battery_dtCreateDate] DEFAULT (getdate()) NULL,
    [nBatterySeriesStringID] INT             NULL,
    [cModel]                 NVARCHAR (50)   NULL,
    [cBrand]                 NVARCHAR (50)   NULL,
    [nCapacity_Ah]           DECIMAL (18, 6) NULL,
    [cVendor]                NVARCHAR (50)   NULL,
    [nPrice]                 MONEY           NULL,
    [nQty]                   INT             NULL,
    [cURL]                   NVARCHAR (MAX)  NULL,
    [nVolts]                 DECIMAL (18, 6) NULL,
    [bDeleted]               BIT             NULL,
    [dtDateDeleted]          DATETIME2 (7)   NULL,
    [cNote]                  NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_battery] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[batteryMaster] (
    [nID]           INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]  DATETIME2 (7)   CONSTRAINT [DF_batteryMaster_dtCreateDate] DEFAULT (getdate()) NULL,
    [cModel]        NVARCHAR (50)   NULL,
    [cBrand]        NVARCHAR (50)   NULL,
    [nCapacity_Ah]  DECIMAL (18, 6) NULL,
    [cVendor]       NVARCHAR (50)   NULL,
    [nPrice]        MONEY           NULL,
    [cURL]          NVARCHAR (MAX)  NULL,
    [nVolts]        DECIMAL (18, 6) NULL,
    [bDeleted]      BIT             NULL,
    [dtDateDeleted] DATETIME2 (7)   NULL,
    [cNote]         NVARCHAR (MAX)  NULL,
    [nPriority]     DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_batteryMaster] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[batterySeriesString] (
    [nID]           INT            IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]  DATETIME2 (7)  CONSTRAINT [DF_batterySeriesString_dtCreateDate] DEFAULT (getdate()) NULL,
    [cName]         NVARCHAR (50)  NULL,
    [cNote]         NVARCHAR (MAX) NULL,
    [bDeleted]      BIT            NULL,
    [nProjectsID]   INT            NULL,
    [dtDateDeleted] DATETIME2 (7)  NULL,
    CONSTRAINT [PK_BatterySeriesString] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[ca_cities] (
    [id]              INT            NOT NULL,
    [name]            VARCHAR (73)   NULL,
    [county]          VARCHAR (36)   NULL,
    [province]        VARCHAR (25)   NULL,
    [province_code]   VARCHAR (2)    NULL,
    [postcode_area]   VARCHAR (3)    NULL,
    [type]            VARCHAR (12)   NULL,
    [map_reference]   VARCHAR (6)    NULL,
    [latitude]        NUMERIC (8, 5) NULL,
    [longitude]       NUMERIC (8, 5) NULL,
    [census_division] VARCHAR (36)   NULL,
    [area_code]       VARCHAR (3)    NULL,
    [time_zone]       VARCHAR (21)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

GO
CREATE TABLE [dbo].[city] (
    [nID]              INT             IDENTITY (1000, 1) NOT NULL,
    [nStateProvinceID] INT             NULL,
    [cName]            NVARCHAR (100)  NULL,
    [dtCreateDate]     DATETIME2 (7)   NULL,
    [bDeleted]         BIT             NULL,
    [cNote]            NVARCHAR (50)   NULL,
    [dtDateDeleted]    DATETIME2 (7)   NULL,
    [nLat]             DECIMAL (16, 6) NULL,
    [nLong]            DECIMAL (16, 6) NULL,
    [nCa_citiesID]     INT             NULL,
    CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[city_kWh] (
    [Province]     NVARCHAR (100)  NULL,
    [Municipality] NVARCHAR (100)  NULL,
    [month]        NVARCHAR (50)   NULL,
    [90deg]        NUMERIC (18, 4) NULL,
    [lat]          NUMERIC (18, 4) NULL,
    [latPlus15]    NUMERIC (18, 4) NULL,
    [latMinus15]   NUMERIC (18, 4) NULL,
    [2Axis]        NUMERIC (18, 4) NULL,
    [0deg]         NUMERIC (18, 4) NULL
);

GO
CREATE TABLE [dbo].[country] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [cName]        NVARCHAR (100) NULL,
    [cAlpha2]      CHAR (2)       NULL,
    [cAlpha3]      CHAR (3)       NULL,
    [nCountryID]   INT            NULL,
    [dtCreateDate] DATETIME2 (7)  CONSTRAINT [DF_country_dtCreateDate] DEFAULT (getdate()) NULL,
    [bDeleted]     BIT            NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[demandItems] (
    [nID]           INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]  DATETIME2 (7)   CONSTRAINT [DF_demandItems_dtCreateDate] DEFAULT (getdate()) NULL,
    [cDesc]         NVARCHAR (50)   NULL,
    [nQty]          INT             NULL,
    [nHours]        DECIMAL (18, 4) NULL,
    [nPowerW]       DECIMAL (18, 4) NULL,
    [cNote]         NVARCHAR (MAX)  NULL,
    [bDeleted]      BIT             NULL,
    [nOnOffFactor]  DECIMAL (12, 6) NULL,
    [nProjectsID]   INT             NULL,
    [dtDateDeleted] DATETIME2 (7)   NULL,
    CONSTRAINT [PK_demandItems] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[democracyImport] (
    [nID]                               INT           IDENTITY (1000, 1) NOT NULL,
    [ID]                                INT           NULL,
    [Country]                           NVARCHAR (50) NULL,
    [Score2011_2012]                    FLOAT (53)    NULL,
    [Rank2011_2012]                     INT           NULL,
    [Score2014_2015]                    FLOAT (53)    NULL,
    [Rank2014_2015]                     INT           NULL,
    [DIRankChange2011_2012___2014_2015] INT           NULL,
    [DIRank2011_2012___2014_2015]       INT           NULL,
    [DISCore2011_2012___2014_2015]      FLOAT (53)    NULL,
    [PS2011_2012]                       FLOAT (53)    NULL,
    [PS2014_2015]                       FLOAT (53)    NULL,
    [EC2011_2012]                       FLOAT (53)    NULL,
    [EC2014_2015]                       FLOAT (53)    NULL,
    [EN2011_2012]                       FLOAT (53)    NULL,
    [EN2014_2015]                       FLOAT (53)    NULL,
    [GE2011_2012]                       FLOAT (53)    NULL,
    [GE2014_2015]                       FLOAT (53)    NULL,
    [H2011_2012]                        FLOAT (53)    NULL,
    [H2014_2015]                        FLOAT (53)    NULL,
    [K2011_2012]                        FLOAT (53)    NULL,
    [K2014_2015]                        FLOAT (53)    NULL,
    [GC2011_2012]                       FLOAT (53)    NULL,
    [GC2014_2015]                       FLOAT (53)    NULL
);

GO
CREATE TABLE [dbo].[EDGAR_to_SQL] (
    [nID]        INT            IDENTITY (1000, 1) NOT NULL,
    [cISO_CODE]  NVARCHAR (50)  NULL,
    [cISO_Name]  NVARCHAR (100) NULL,
    [cSector]    NVARCHAR (50)  NULL,
    [cSubstance] NVARCHAR (50)  NULL,
    [n1970]      FLOAT (53)     NULL,
    [n1971]      FLOAT (53)     NULL,
    [n1972]      FLOAT (53)     NULL,
    [n1973]      FLOAT (53)     NULL,
    [n1974]      FLOAT (53)     NULL,
    [n1975]      FLOAT (53)     NULL,
    [n1976]      FLOAT (53)     NULL,
    [n1977]      FLOAT (53)     NULL,
    [n1978]      FLOAT (53)     NULL,
    [n1979]      FLOAT (53)     NULL,
    [n1980]      FLOAT (53)     NULL,
    [n1981]      FLOAT (53)     NULL,
    [n1982]      FLOAT (53)     NULL,
    [n1983]      FLOAT (53)     NULL,
    [n1984]      FLOAT (53)     NULL,
    [n1985]      FLOAT (53)     NULL,
    [n1986]      FLOAT (53)     NULL,
    [n1987]      FLOAT (53)     NULL,
    [n1988]      FLOAT (53)     NULL,
    [n1989]      FLOAT (53)     NULL,
    [n1990]      FLOAT (53)     NULL,
    [n1991]      FLOAT (53)     NULL,
    [n1992]      FLOAT (53)     NULL,
    [n1993]      FLOAT (53)     NULL,
    [n1994]      FLOAT (53)     NULL,
    [n1995]      FLOAT (53)     NULL,
    [n1996]      FLOAT (53)     NULL,
    [n1997]      FLOAT (53)     NULL,
    [n1998]      FLOAT (53)     NULL,
    [n1999]      FLOAT (53)     NULL,
    [n2000]      FLOAT (53)     NULL,
    [n2001]      FLOAT (53)     NULL,
    [n2002]      FLOAT (53)     NULL,
    [n2003]      FLOAT (53)     NULL,
    [n2004]      FLOAT (53)     NULL,
    [n2005]      FLOAT (53)     NULL,
    [n2006]      FLOAT (53)     NULL,
    [n2007]      FLOAT (53)     NULL,
    [n2008]      FLOAT (53)     NULL,
    [n2009]      FLOAT (53)     NULL,
    [n2010]      FLOAT (53)     NULL,
    [n2011]      FLOAT (53)     NULL,
    [n2012]      FLOAT (53)     NULL,
    [n2013]      FLOAT (53)     NULL,
    [n2014]      FLOAT (53)     NULL,
    [n2015]      FLOAT (53)     NULL,
    [n2016]      FLOAT (53)     NULL,
    CONSTRAINT [PK_EDGAR_to_SQL] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[edgarPivot] (
    [nID]      INT              IDENTITY (1000, 1) NOT NULL,
    [nEdgarID] INT              NULL,
    [dtYear]   DATETIME2 (7)    NULL,
    [nCO2]     DECIMAL (30, 12) NULL,
    CONSTRAINT [PK_edgarPivot] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[insolation] (
    [nID]             INT             IDENTITY (1000, 1) NOT NULL,
    [nCityID]         INT             NULL,
    [nMonth]          INT             NULL,
    [nTilt90]         DECIMAL (18, 4) NULL,
    [nTiltLat]        DECIMAL (18, 4) NULL,
    [nTiltLatPlus15]  DECIMAL (18, 4) NULL,
    [nTiltLatMinus15] DECIMAL (18, 4) NULL,
    [nTilt0]          DECIMAL (18, 4) NULL,
    [n2Axis]          DECIMAL (18, 4) NULL,
    [dtCreateDate]    DATETIME2 (7)   NULL,
    [bDeleted]        BIT             NULL,
    [cNote]           NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_insolation] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[projects] (
    [nID]                       INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]              DATETIME2 (7)   CONSTRAINT [DF_projects_dtCreateDate] DEFAULT (getdate()) NULL,
    [nUsersID]                  INT             NULL,
    [bGlobalUsers]              BIT             NULL,
    [cName]                     NVARCHAR (50)   NULL,
    [cDesc]                     NVARCHAR (MAX)  NULL,
    [bDeleted]                  BIT             NULL,
    [cNote1]                    NVARCHAR (MAX)  NULL,
    [cNote2]                    NVARCHAR (MAX)  NULL,
    [nClientsID]                INT             NULL,
    [dtDateDue]                 DATETIME2 (7)   NULL,
    [nDemandTotal]              DECIMAL (18, 6) NULL,
    [nCityID]                   INT             NULL,
    [nChosenInsolation]         DECIMAL (18, 6) NULL,
    [cChosenTilt]               NVARCHAR (100)  NULL,
    [nMPPTFactor]               DECIMAL (18, 6) NULL,
    [nBatteryEfficiency]        DECIMAL (18, 6) NULL,
    [nInverterDerate]           DECIMAL (18, 6) NULL,
    [nColdestAirTempC]          DECIMAL (8, 2)  NULL,
    [nMDoD]                     DECIMAL (8, 2)  NULL,
    [nDaysAutonomy]             DECIMAL (8, 2)  NULL,
    [nVoltage]                  DECIMAL (8, 2)  NULL,
    [nControllerEfficiency]     DECIMAL (8, 2)  NULL,
    [nTDR]                      DECIMAL (8, 2)  NULL,
    [nChosenPV]                 DECIMAL (18, 6) NULL,
    [nChosenBattery]            DECIMAL (18, 6) NULL,
    [dtSummaryStartDate]        DATETIME2 (7)   NULL,
    [dtSummaryEndDate]          DATETIME2 (7)   NULL,
    [nCityIDDemand]             INT             NULL,
    [nManualLat]                DECIMAL (18, 6) NULL,
    [nManualLong]               DECIMAL (18, 6) NULL,
    [bUserSpecifiedCoordinates] BIT             NULL,
    [nReflectance]              DECIMAL (18, 6) NULL,
    [nDemandQty]                DECIMAL (18, 6) CONSTRAINT [DF_projects_nDemandQty] DEFAULT ((1)) NULL,
    [nMetricsResolution]        INT             NULL,
    [nMetricsHour]              INT             NULL,
    [nGMTPlusMinus]             DECIMAL (18, 6) NULL,
    [nChosenAzimuth]            DECIMAL (18, 6) NULL,
    [nCustomTilt]               DECIMAL (18, 6) NULL,
    [nCO2g_perkWhCoal]          DECIMAL (18, 6) NULL,
    [nCO2g_perkWhPV]            DECIMAL (18, 6) NULL,
    [bDaylightTime]             BIT             NULL,
    [dtDaylightFirst]           DATETIME2 (7)   NULL,
    [dtDaylightLast]            DATETIME2 (7)   NULL,
    [cTMYFile]                  NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[PV] (
    [nID]              INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]     DATETIME2 (7)   CONSTRAINT [DF_PV_dtCreateDate] DEFAULT (getdate()) NULL,
    [cModel]           NVARCHAR (50)   NULL,
    [cBrand]           NVARCHAR (50)   NULL,
    [nPmax]            DECIMAL (18, 4) NULL,
    [nVmp]             DECIMAL (18, 4) NULL,
    [nImp]             DECIMAL (18, 4) NULL,
    [nVoc]             DECIMAL (18, 4) NULL,
    [nIsc]             DECIMAL (18, 4) NULL,
    [nWeight_kg]       DECIMAL (18, 4) NULL,
    [nLength_mm]       DECIMAL (18, 4) NULL,
    [nWidth_mm]        DECIMAL (18, 4) NULL,
    [nHeight_mm]       DECIMAL (18, 4) NULL,
    [cFrame]           NVARCHAR (50)   NULL,
    [cVendor]          NVARCHAR (50)   NULL,
    [nPrice]           MONEY           NULL,
    [nTilt_deg]        DECIMAL (18, 4) NULL,
    [nOrientation_deg] DECIMAL (18, 4) NULL,
    [cURL]             NVARCHAR (MAX)  NULL,
    [nQty]             INT             NULL,
    [bDeleted]         BIT             NULL,
    [nProjectsID]      INT             NULL,
    [dtDateDeleted]    DATETIME2 (7)   NULL,
    CONSTRAINT [PK_PV] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[PVMaster] (
    [nID]              INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]     DATETIME2 (7)   CONSTRAINT [DF_PVMaster_dtCreateDate] DEFAULT (getdate()) NULL,
    [cModel]           NVARCHAR (50)   NULL,
    [cBrand]           NVARCHAR (50)   NULL,
    [nPmax]            DECIMAL (18, 4) NULL,
    [nVmp]             DECIMAL (18, 4) NULL,
    [nImp]             DECIMAL (18, 4) NULL,
    [nVoc]             DECIMAL (18, 4) NULL,
    [nIsc]             DECIMAL (18, 4) NULL,
    [nWeight_kg]       DECIMAL (18, 4) NULL,
    [nLength_mm]       DECIMAL (18, 4) NULL,
    [nWidth_mm]        DECIMAL (18, 4) NULL,
    [nHeight_mm]       DECIMAL (18, 4) NULL,
    [cFrame]           NVARCHAR (50)   NULL,
    [cVendor]          NVARCHAR (50)   NULL,
    [nPrice]           MONEY           NULL,
    [nNominalTilt_deg] DECIMAL (18, 4) NULL,
    [cURL]             NVARCHAR (MAX)  NULL,
    [bDeleted]         BIT             NULL,
    [dtDateDeleted]    DATETIME2 (7)   NULL,
    [nPriority]        DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_PVMaster] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[role] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate] DATETIME2 (7)  CONSTRAINT [DF_role_dtCreateDate] DEFAULT (getdate()) NULL,
    [cName]        NVARCHAR (50)  NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    [bDeleted]     BIT            NULL,
    CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[stateProvince] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [nCountryID]   INT            NULL,
    [cName]        NVARCHAR (50)  NULL,
    [dtCreateDate] DATETIME2 (7)  NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    [bDeleted]     BIT            NULL,
    CONSTRAINT [PK_stateProvince] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[summary] (
    [nID]                                INT             IDENTITY (1000, 1) NOT NULL,
    [nInsolation]                        DECIMAL (18, 6) NULL,
    [dtCreateDate]                       DATETIME2 (7)   NULL,
    [nProjectsID]                        INT             NULL,
    [dtDate]                             DATETIME2 (7)   NOT NULL,
    [bDeleted]                           BIT             NULL,
    [cNote]                              NVARCHAR (50)   NULL,
    [nInsolationPredicted]               DECIMAL (18, 6) NULL,
    [nDemandTotal]                       DECIMAL (18, 6) NULL,
    [nRequiredPV]                        AS              (CASE WHEN [bUserSpecifiedCoordinates] = (1)
                                                                    AND (([nBatteryEfficiency] * [nInverterDerate]) * [nMPPTFactor]) * [nInsolationPredictedEmperical] > (0) THEN [nDemandTotal] / ((([nBatteryEfficiency] * [nInverterDerate]) * [nMPPTFactor]) * [nInsolationPredictedEmperical]) WHEN [bUserSpecifiedCoordinates] = (1)
                                                                                                                                                                                                                                                                                                         AND (([nBatteryEfficiency] * [nInverterDerate]) * [nMPPTFactor]) * [nInsolationPredictedEmperical] <= (0) THEN (0) WHEN [bUserSpecifiedCoordinates] = (0)
                                                                                                                                                                                                                                                                                                                                                                                                                                 AND (([nBatteryEfficiency] * [nInverterDerate]) * [nMPPTFactor]) * [nInsolationPredicted] > (0) THEN [nDemandTotal] / ((([nBatteryEfficiency] * [nInverterDerate]) * [nMPPTFactor]) * [nInsolationPredicted]) ELSE (0) END),
    [nChosenPV]                          DECIMAL (18, 6) NULL,
    [nMPPTFactor]                        DECIMAL (18, 6) NULL,
    [nBatteryEfficiency]                 DECIMAL (18, 6) NULL,
    [nInverterDerate]                    DECIMAL (18, 6) NULL,
    [nDaysRunFullCharge]                 DECIMAL (18, 6) NULL,
    [nChosenBattery]                     DECIMAL (18, 6) NULL,
    [nVoltage]                           DECIMAL (18, 6) NULL,
    [nRunningLoss]                       DECIMAL (18, 6) NULL,
    [nLat]                               DECIMAL (18, 6) NULL,
    [cChosenTilt]                        NVARCHAR (100)  NULL,
    [nSunAltitude]                       DECIMAL (18, 6) NULL,
    [nSunAzimuth]                        DECIMAL (18, 6) NULL,
    [nDeclination]                       DECIMAL (18, 6) NULL,
    [nChosenTiltDeg]                     DECIMAL (18, 6) NULL,
    [nChosenBatterykWh]                  DECIMAL (18, 6) NULL,
    [nBatteryRemainingkWh]               DECIMAL (18, 6) NULL,
    [nSunAzimuth0800]                    DECIMAL (18, 6) NULL,
    [nSunAzimuth1600]                    DECIMAL (18, 6) NULL,
    [nSunAltitude0800]                   DECIMAL (18, 6) NULL,
    [nSunAltitude1600]                   DECIMAL (18, 6) NULL,
    [nLong]                              DECIMAL (18, 6) NULL,
    [nAirMassRatio]                      DECIMAL (18, 6) NULL,
    [nDayOfYear]                         INT             NULL,
    [nASHRAE_A]                          DECIMAL (18, 6) NULL,
    [nASHRAE_k]                          DECIMAL (18, 6) NULL,
    [nIB]                                DECIMAL (18, 6) NULL,
    [nDNI]                               DECIMAL (18, 6) NULL,
    [nDNIDay]                            DECIMAL (18, 6) NULL,
    [nIncidence]                         DECIMAL (18, 6) NULL,
    [nBeamCollector]                     DECIMAL (18, 6) NULL,
    [nSkyDiffuseFactor]                  DECIMAL (18, 6) NULL,
    [nDiffuseCollector]                  DECIMAL (18, 6) NULL,
    [nReflectedCollector]                DECIMAL (18, 6) NULL,
    [nBeamCollectorHorizontal]           DECIMAL (18, 6) NULL,
    [nDiffuseCollectorHorizontal]        DECIMAL (18, 6) NULL,
    [nDHI]                               DECIMAL (18, 6) NULL,
    [nDHIDay]                            DECIMAL (18, 6) NULL,
    [nGHI]                               DECIMAL (18, 6) NULL,
    [nGHIDay]                            DECIMAL (18, 6) NULL,
    [nIncidenceHNS]                      DECIMAL (18, 6) NULL,
    [nIBC_HNS]                           DECIMAL (18, 6) NULL,
    [nIDC_HNS]                           DECIMAL (18, 6) NULL,
    [nIRC_HNS]                           DECIMAL (18, 6) NULL,
    [nIBC_HNSEmperical]                  DECIMAL (18, 6) NULL,
    [nIDC_HNSEmperical]                  DECIMAL (18, 6) NULL,
    [nIRC_HNSEmperical]                  DECIMAL (18, 6) NULL,
    [nIncidenceHEW]                      DECIMAL (18, 6) NULL,
    [nIBC_HEW]                           DECIMAL (18, 6) NULL,
    [nIDC_HEW]                           DECIMAL (18, 6) NULL,
    [nIRC_HEW]                           DECIMAL (18, 6) NULL,
    [nIncidenceVERT]                     DECIMAL (18, 6) NULL,
    [nIBC_VERT]                          DECIMAL (18, 6) NULL,
    [nIDC_VERT]                          DECIMAL (18, 6) NULL,
    [nIRC_VERT]                          DECIMAL (18, 6) NULL,
    [nIncidencePNS]                      DECIMAL (18, 6) NULL,
    [nIBC_PNS]                           DECIMAL (18, 6) NULL,
    [nIDC_PNS]                           DECIMAL (18, 6) NULL,
    [nIRC_PNS]                           DECIMAL (18, 6) NULL,
    [nIBC2]                              DECIMAL (18, 6) NULL,
    [nIDC2]                              DECIMAL (18, 6) NULL,
    [nIRC2]                              DECIMAL (18, 6) NULL,
    [nIBC2Emperical]                     DECIMAL (18, 6) NULL,
    [nIDC2Emperical]                     DECIMAL (18, 6) NULL,
    [nIRC2Emperical]                     DECIMAL (18, 6) NULL,
    [nHourAngle]                         DECIMAL (18, 6) NULL,
    [nHoursMoreRun]                      DECIMAL (18, 6) NULL,
    [dtCT]                               DATETIME        NULL,
    [nChosenAzimuth]                     DECIMAL (18, 6) NULL,
    [bIsDT]                              BIT             NULL,
    [nBeamCollectorEmperical]            DECIMAL (18, 6) NULL,
    [nReflectedCollectorEmperical]       DECIMAL (18, 6) NULL,
    [nDiffuseCollectorEmperical]         DECIMAL (18, 6) NULL,
    [nTotalEmperical]                    AS              (([nBeamCollectorEmperical] + [nReflectedCollectorEmperical]) + [nDiffuseCollectorEmperical]),
    [nInsolationPredictedEmperical]      DECIMAL (18, 6) NULL,
    [nInsolationPredictedEmpericalMonth] DECIMAL (18, 6) NULL,
    [nTotalEmpericalDay]                 DECIMAL (18, 6) NULL,
    [bUserSpecifiedCoordinates]          BIT             NULL,
    CONSTRAINT [PK_Summary] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE TABLE [dbo].[users] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate] DATETIME2 (7)  CONSTRAINT [DF_users_dtCreateDate] DEFAULT (getdate()) NULL,
    [cUserName]    NVARCHAR (50)  NULL,
    [cPassword]    NVARCHAR (50)  NULL,
    [nRoleID]      INT            NULL,
    [cFirst]       NVARCHAR (50)  NULL,
    [cLast]        NVARCHAR (50)  NULL,
    [cEmail]       NVARCHAR (50)  NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    [bDeleted]     BIT            NULL,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([nID] ASC)
);

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy]
    ON [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy]([dtDate] ASC);

GO
CREATE NONCLUSTERED INDEX [IX_summary_dtDate]
    ON [dbo].[summary]([dtDate] ASC);

GO
CREATE FUNCTION [dbo].[UDF_get@ASHRAE_A]
(@nDayOfYear DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = 1160 + (75 * SIN(radians(360 / 365 * (@nDayOfYear - 275))));
    SET @ResultVar = 1160 + 75 * sin(radians(CAST (360 AS FLOAT) / 365) * (@nDayOfYear - 275));
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_get@ASHRAE_k]
(@nDayOfYear DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = 0.174 + 0.035 * sin(radians(CAST (360 AS FLOAT) / 365) * (@nDayOfYear - 100));
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_get@nIB]
(@ASHRAE_A DECIMAL (18, 6) NULL, @ASHRAE_k DECIMAL (18, 6) NULL, @nAirMassRatio DECIMAL (18, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = @ASHRAE_A * power(EXP(1), -@ASHRAE_k * @nAirMassRatio);
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getAirMassRatio]
(@nAltitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = sqrt((square(708 * sin(radians(@nAltitude))) + 1417)) - 708 * sin(radians(@nAltitude));
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getAltitude]
(@nLatitude DECIMAL (16, 6) NULL, @nDeclination DECIMAL (26, 10) NULL, @nHourDegrees DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = (cos(radians(@nLatitude)) * COS(radians(@nDeclination)) * cos(radians(@nHourDegrees))) + sin(radians(@nLatitude)) * sin(radians(@nDeclination));
    SET @ResultVar = degrees(ASIN(@ResultVar));
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getAzimuth]
(@nDeclination DECIMAL (28, 16) NULL, @nHourDegrees DECIMAL (16, 6) NULL, @nAltitude DECIMAL (16, 6) NULL, @nLatitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nCosH AS DECIMAL (18, 6) = 0;
    DECLARE @nTanDecl AS DECIMAL (18, 6) = 0;
    DECLARE @nTanLat AS DECIMAL (18, 6) = 0;
    DECLARE @nAnswer1 AS FLOAT = 0;
    DECLARE @nAnswer2 AS DECIMAL (18, 6) = 0;
    DECLARE @nTest AS DECIMAL (18, 6) = 0;
    DECLARE @bTestResult AS BIT = 1;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = COS(radians(@nDeclination)) * CAST (sin(radians(@nHourDegrees)) AS FLOAT) / cos(radians(@nAltitude));
    SET @nAnswer1 = degrees(ASIN(@nPrelimAnswer1));
    SET @nAnswer2 = degrees(radians(180 - @nAnswer1));
    SET @nCosH = cos(radians(@nHourDegrees));
    SET @nTest = IIF (tan(radians(@nLatitude)) != 0, CAST (tan(radians(@nDeclination)) AS FLOAT) / tan(radians(@nLatitude)), CAST (tan(radians(@nDeclination)) AS FLOAT) / tan(radians(.0001)));
    SET @bTestResult = CASE WHEN CAST (@nCosH AS FLOAT) >= CAST (@nTest AS FLOAT) THEN 1 ELSE 0 END;
    SET @ResultVar = CASE WHEN @bTestResult = 1 THEN CASE WHEN ABS(@nAnswer1) < 90 THEN @nAnswer1 ELSE @nAnswer2 END ELSE CASE WHEN ABS(@nAnswer1) < 90 THEN @nAnswer2 ELSE @nAnswer1 END END;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getBeamCollectorHorizontal]
(@nIB DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * sin(radians(@nSunAltitude));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getCT]
(@nGMTPlusMinus DECIMAL (16, 6) NULL, @nDayOfYear DECIMAL (16, 6) NULL, @beginDate DATETIME NULL, @nLong DECIMAL (16, 6) NULL, @bDaylightTime BIT NULL, @dtDaylightFirst DATETIME NULL, @dtDaylightLast DATETIME NULL)
RETURNS DATETIME
AS
BEGIN
    IF datepart(dy, @beginDate) >= datepart(dy, @dtDaylightFirst)
       AND datepart(dy, @beginDate) <= datepart(dy, @dtDaylightLast)
        SET @nGMTPlusMinus = @nGMTPlusMinus + 1;
    DECLARE @ResultVar AS DATETIME;
    DECLARE @B AS DECIMAL (18, 6) = 0;
    DECLARE @E AS DECIMAL (18, 6) = 0;
    DECLARE @LTM AS DECIMAL (16, 6) = 0;
    DECLARE @nMinsToDeduct AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer2 AS DECIMAL (18, 6) = 0;
    SET @B = (360 / CONVERT (FLOAT, 364)) * (@nDayOfYear - 81);
    SET @LTM = @nGMTPlusMinus * 15;
    SET @E = 9.87 * sin(radians(2 * @B)) - 7.53 * cos(radians(@B)) - 1.5 * sin(radians(@B));
    SET @nMinsToDeduct = -4 * (@nLong - @LTM) - @E;
    SET @ResultVar = dateadd(mi, @nMinsToDeduct, @beginDate);
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getDeclination]
(@nDayNumber INT NULL)
RETURNS DECIMAL (28, 16)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = 23.45 * SIN(radians((360.0 / 365.0) * (@nDayNumber - 81)));
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getDiffuse]
(@nIB DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nSkyDiffuseFactor * (CAST ((1 + cos(radians(@nChosenTiltDeg))) AS FLOAT) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getDiffuseEmperical]
(@nDHI DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDHI * (CAST ((1 + cos(radians(@nChosenTiltDeg))) AS FLOAT) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC_HEW]
(@nAltitude DECIMAL (16, 6) NULL, @nIncidenceHEW DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDiffuseCollectorHorizontal * ((1 + (sin(radians(@nAltitude)) / cos(radians(@nIncidenceHEW)))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC_HNS]
(@nAltitude DECIMAL (16, 6) NULL, @nIncidenceHNS DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDiffuseCollectorHorizontal * ((1 + (sin(radians(@nAltitude)) / cos(radians(@nIncidenceHNS)))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC_HNSEmperical]
(@nAltitude DECIMAL (16, 6) NULL, @nIncidenceHNS DECIMAL (16, 6) NULL, @nDHI DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDHI * ((1 + (sin(radians(@nAltitude)) / cos(radians(@nIncidenceHNS)))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC_PNS]
(@nDeclination DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDiffuseCollectorHorizontal * ((1 + (sin(radians(@nSunAltitude) - radians(@nDeclination)))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC_VERT]
(@nChosenTiltDeg DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nDiffuseCollectorHorizontal * ((1 + (cos(radians(@nChosenTiltDeg)))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIDC2]
(@nIB DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nSkyDiffuseFactor * ((1 + sin(radians(@nSunAltitude))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIncidence]
(@nAltitude DECIMAL (16, 6) NULL, @nSunAzimuth DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL, @nChosenAzimuth DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = COS(radians(@nAltitude)) * cos(radians(@nSunAzimuth) - radians(@nChosenAzimuth)) * SIN(radians(@nChosenTiltDeg)) + SIN(radians(@nAltitude)) * COS(radians(@nChosenTiltDeg));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIncidenceHEW]
(@nAltitude DECIMAL (16, 6) NULL, @nSunAzimuth DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = SQRT(1 - power((cos(radians(@nAltitude)) * sin(radians(@nSunAzimuth))), 2));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIncidenceHNS]
(@nAltitude DECIMAL (16, 6) NULL, @nSunAzimuth DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = SQRT(1 - power((cos(radians(@nAltitude)) * cos(radians(@nSunAzimuth))), 2));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIncidencePNS]
(@nDeclination DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = cos(radians((@nDeclination)));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIncidenceVERT]
(@nAltitude DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = sin(radians((@nAltitude + @nChosenTiltDeg)));
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC_HEW]
(@nReflectance DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIncidenceHEW DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (@nSkyDiffuseFactor + sin(radians(@nSunAltitude))) * ((1 - sin(radians(@nSunAltitude)) / cos(radians(@nIncidenceHEW))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC_HNS]
(@nReflectance DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIncidenceHNS DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (@nSkyDiffuseFactor + sin(radians(@nSunAltitude))) * ((1 - sin(radians(@nSunAltitude)) / cos(radians(@nIncidenceHNS))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC_HNSEmperical]
(@nReflectance DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIncidenceHNS DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nGHI DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nGHI * @nReflectance * ((1 - sin(radians(@nSunAltitude)) / cos(radians(@nIncidenceHNS))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC_PNS]
(@nReflectance DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nDeclination DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (@nSkyDiffuseFactor + sin(radians(@nSunAltitude))) * ((1 - sin(radians(@nSunAltitude) - radians(@nDeclination))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC_VERT]
(@nReflectance DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIncidenceHNS DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (@nSkyDiffuseFactor + sin(radians(@nSunAltitude))) * ((1 - sin(radians(@nSunAltitude)) / cos(radians(@nIncidenceHNS))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getIRC2]
(@nReflectance DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (sin(radians(@nSunAltitude)) + @nSkyDiffuseFactor) * ((1 - sin(radians(@nSunAltitude))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getReflected]
(@nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL, @nReflectance DECIMAL (16, 6) NULL, @nBeamCollectorHorizontal DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nIB * @nReflectance * (@nSkyDiffuseFactor + sin(radians(@nSunAltitude))) * ((1 - cos(radians(@nChosenTiltDeg))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getReflectedEmperical]
(@nGHI DECIMAL (16, 6) NULL, @nSkyDiffuseFactor DECIMAL (16, 6) NULL, @nSunAltitude DECIMAL (16, 6) NULL, @nIB DECIMAL (16, 6) NULL, @nReflectance DECIMAL (16, 6) NULL, @nBeamCollectorHorizontal DECIMAL (16, 6) NULL, @nDiffuseCollectorHorizontal DECIMAL (16, 6) NULL, @nChosenTiltDeg DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    DECLARE @nPrelimAnswer1 AS DECIMAL (18, 6) = 0;
    SET @nPrelimAnswer1 = @nGHI * @nReflectance * ((1 - cos(radians(@nChosenTiltDeg))) / 2);
    SET @ResultVar = @nPrelimAnswer1;
    RETURN @ResultVar;
END

GO
CREATE FUNCTION [dbo].[UDF_getSkyDiffuseFactor]
(@nDayOfYear DECIMAL (16, 6) NULL)
RETURNS DECIMAL (18, 6)
AS
BEGIN
    DECLARE @ResultVar AS DECIMAL (18, 6) = 0;
    SET @ResultVar = 0.095 + 0.04 * sin(radians(CAST (360 AS FLOAT) / 365) * (@nDayOfYear - 100));
    RETURN @ResultVar;
END

GO
CREATE PROCEDURE [dbo].[createDates]
@projectsID INT NULL, @originalbeginDate DATETIME NULL, @endDate DATETIME NULL, @nMetricsResolution INT NULL, @nMetricsHour INT NULL, @TMYFilename VARCHAR (5000) NULL
AS
BEGIN
    DECLARE @nCityID AS INT;
    DECLARE @nInsolation AS DECIMAL (18, 6);
    DECLARE @nLat AS DECIMAL (18, 6);
    DECLARE @nLong AS DECIMAL (18, 6);
    DECLARE @nVoltage AS DECIMAL (18, 6);
    DECLARE @nDemandTotal AS DECIMAL (18, 6);
    DECLARE @nDemandQty AS DECIMAL (18, 6);
    DECLARE @pvrequired AS DECIMAL (18, 6) = 0;
    DECLARE @nBatteryEfficiency AS DECIMAL (18, 6);
    DECLARE @nChosenAzimuth AS DECIMAL (18, 6);
    DECLARE @nInverterDerate AS DECIMAL (18, 6);
    DECLARE @nInsolationPredicted AS DECIMAL (18, 6);
    DECLARE @nInsolationPredictedEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nInsolationPredictedEmpericalMonth AS DECIMAL (18, 6) = 0;
    DECLARE @nMPPTFactor AS DECIMAL (18, 6);
    DECLARE @nChosenPV AS DECIMAL (18, 6);
    DECLARE @nChosenBattery AS DECIMAL (18, 6);
    DECLARE @cChosenTilt AS NVARCHAR (100) = '';
    DECLARE @nRunningLoss AS DECIMAL (18, 6) = 0;
    DECLARE @nMaxRunningLoss AS DECIMAL (18, 6) = 0;
    DECLARE @nDeclination AS DECIMAL (28, 16) = 0;
    DECLARE @nSunAltitude AS DECIMAL (18, 6) = 0;
    DECLARE @nSunAltitude0800 AS DECIMAL (18, 6) = 0;
    DECLARE @nSunAltitude1600 AS DECIMAL (18, 6) = 0;
    DECLARE @nSunAzimuth AS DECIMAL (18, 6) = 0;
    DECLARE @nSunAzimuth0800 AS DECIMAL (18, 6) = 0;
    DECLARE @nSunAzimuth1600 AS DECIMAL (18, 6) = 0;
    DECLARE @nDayNum AS INT = 0;
    DECLARE @nChosenTiltDeg AS DECIMAL (18, 6) = 0;
    DECLARE @nChosenBatterykWh AS DECIMAL (18, 6) = 0;
    DECLARE @nBatteryRemainingkWh AS DECIMAL (18, 6) = 0;
    DECLARE @bUserSpecifiedCoordinates AS BIT = 0;
    DECLARE @nAirMassRatio AS DECIMAL (18, 6) = 0;
    DECLARE @nDayOfYear AS INT;
    DECLARE @nASHRAE_A AS DECIMAL (18, 6) = 0;
    DECLARE @nASHRAE_k AS DECIMAL (18, 6) = 0;
    DECLARE @nIB AS DECIMAL (18, 6) = 0;
    DECLARE @nDNI AS DECIMAL (18, 6) = 0;
    DECLARE @nDHI AS DECIMAL (18, 6) = 0;
    DECLARE @nGHI AS DECIMAL (18, 6) = 0;
    DECLARE @nDNIDay AS DECIMAL (18, 6) = 0;
    DECLARE @nDHIDay AS DECIMAL (18, 6) = 0;
    DECLARE @nGHIDay AS DECIMAL (18, 6) = 0;
    DECLARE @nTotalEmpericalDay AS DECIMAL (18, 6) = 0;
    DECLARE @nCOS_Incidence AS DECIMAL (18, 6) = 0;
    DECLARE @nIncidence AS DECIMAL (18, 6) = 0;
    DECLARE @nCOS_IncidenceHNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIncidenceHNS AS DECIMAL (18, 6) = 0;
    DECLARE @nCOS_IncidenceHEW AS DECIMAL (18, 6) = 0;
    DECLARE @nIncidenceHEW AS DECIMAL (18, 6) = 0;
    DECLARE @nCOS_IncidenceVERT AS DECIMAL (18, 6) = 0;
    DECLARE @nIncidenceVERT AS DECIMAL (18, 6) = 0;
    DECLARE @nCOS_IncidencePNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIncidencePNS AS DECIMAL (18, 6) = 0;
    DECLARE @nBeamCollector AS DECIMAL (18, 6) = 0;
    DECLARE @nBeamCollectorEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nBeamCollectorHorizontal AS DECIMAL (18, 6) = 0;
    DECLARE @nDiffuseCollectorHorizontal AS DECIMAL (18, 6) = 0;
    DECLARE @nSkyDiffuseFactor AS DECIMAL (18, 6) = 0;
    DECLARE @nDiffuseCollector AS DECIMAL (18, 6) = 0;
    DECLARE @nDiffuseCollectorEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nReflectance AS DECIMAL (18, 6) = 0;
    DECLARE @nReflectedCollector AS DECIMAL (18, 6) = 0;
    DECLARE @nReflectedCollectorEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC_HNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC_HNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC_HNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC_HNSEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC_HNSEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC_HNSEmperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC_HEW AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC_HEW AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC_HEW AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC_VERT AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC_VERT AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC_VERT AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC_PNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC_PNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC_PNS AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC2 AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC2 AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC2 AS DECIMAL (18, 6) = 0;
    DECLARE @nIBC2Emperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIDC2Emperical AS DECIMAL (18, 6) = 0;
    DECLARE @nIRC2Emperical AS DECIMAL (18, 6) = 0;
    DECLARE @nHourAngle AS DECIMAL (18, 6) = 0;
    DECLARE @nGMTPlusMinus AS DECIMAL (18, 6) = 0;
    DECLARE @dtCT AS DATETIME;
    DECLARE @nCustomTilt AS DECIMAL (18, 6) = 0;
    DECLARE @bDaylightTime AS BIT;
    DECLARE @dtDaylightFirst AS DATETIME;
    DECLARE @dtDaylightLast AS DATETIME;
    DECLARE @isDT AS BIT = 0;
    DECLARE @nUseThisInsolation AS DECIMAL (18, 6);
    DECLARE @nHoursMoreRun AS DECIMAL (18, 6);
    DECLARE @nDaysRunFullCharge AS DECIMAL (18, 6);
    DECLARE @beginDate AS DATETIME = @originalbeginDate;
    SELECT @nCityID = a.nCityID,
           @nInsolation = a.nChosenInsolation,
           @bUserSpecifiedCoordinates = a.bUserSpecifiedCoordinates,
           @nReflectance = a.nReflectance,
           @nVoltage = a.nVoltage,
           @cChosenTilt = a.cChosenTilt,
           @nChosenBattery = a.nChosenBattery,
           @nDemandTotal = a.nDemandTotal,
           @nDemandQty = a.nDemandQty,
           @nBatteryEfficiency = a.nBatteryEfficiency,
           @nChosenAzimuth = a.nChosenAzimuth,
           @nInverterDerate = a.nInverterDerate,
           @nMPPTFactor = a.nMPPTFactor,
           @nChosenPV = a.nChosenPV,
           @nGMTPlusMinus = a.nGMTPlusMinus,
           @nCustomTilt = a.nCustomTilt,
           @bDaylightTime = a.bDaylightTime,
           @dtDaylightFirst = a.dtDaylightFirst,
           @dtDaylightLast = a.dtDaylightLast
    FROM   dbo.projects AS a
    WHERE  a.nID = @projectsID;
    IF @bUserSpecifiedCoordinates IS NULL
       OR @bUserSpecifiedCoordinates = 0
        BEGIN
            SELECT @nLat = b.nLat,
                   @nLong = b.nLong
            FROM   dbo.projects AS a
                   INNER JOIN
                   dbo.city AS b
                   ON a.nCityID = b.nID
            WHERE  a.nID = @projectsID;
        END
    ELSE
        BEGIN
            SELECT @nLat = a.nManualLat,
                   @nLong = a.nManualLong
            FROM   dbo.projects AS a
            WHERE  a.nID = @projectsID;
        END
    SELECT @nMaxRunningLoss = (@nChosenBattery * @nVoltage) / 1000;
    SELECT @nChosenBatterykWh = (@nChosenBattery * @nVoltage) / 1000;
    SET NOCOUNT ON;
    DELETE dbo.summary
    WHERE  nProjectsID = @projectsID;
    IF @nMetricsResolution = 0
        BEGIN
            SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), @nMetricsHour, 0, 0, 0);
            SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), @nMetricsHour, 0, 0, 0);
        END
    IF @nMetricsResolution = 1
        BEGIN
            SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), 0, 0, 0, 0);
            SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), 23, 0, 0, 0);
        END
    IF @nMetricsResolution = 2
        BEGIN
            SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), 0, 0, 0, 0);
            SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), 23, 0, 0, 0);
        END
    WHILE @beginDate <= @endDate
        BEGIN
            SET @nHourAngle = 15 * (datediff(hour, @beginDate, datetimefromparts(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), 12, 00, 0, 0)));
            SELECT @nBatteryRemainingkWh = CASE WHEN @nChosenBatterykWh - @nRunningLoss > @nChosenBatterykWh THEN @nChosenBatterykWh ELSE @nChosenBatterykWh - @nRunningLoss END;
            SET @nDayNum = datepart(dayofyear, @beginDate);
            SET @nDayOfYear = @nDayNum;
            SET @nDeclination = [dbo].[UDF_getDeclination](@nDayOfYear);
            SET @nSunAltitude = [dbo].[UDF_getAltitude](@nLat, @nDeclination, @nHourAngle);
            SET @nSunAzimuth = [dbo].[UDF_getAzimuth](@nDeclination, @nHourAngle, @nSunAltitude, @nLat);
            SET @dtCT = [dbo].[UDF_getCT](@nGMTPlusMinus, @nDayOfYear, @beginDate, @nLong, @bDaylightTime, @dtDaylightFirst, @dtDaylightLast);
            SELECT @nChosenTiltDeg = CASE WHEN @cChosenTilt = '90 Deg' THEN 90 WHEN @cChosenTilt = 'Latitude' THEN @nLat WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN @nLat + 15 WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN @nLat - 15 WHEN @cChosenTilt = 'No Tilt' THEN 0 WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                          AND @nSunAltitude > 0 THEN 90 - @nSunAltitude WHEN @cChosenTilt = '1 Axis Track HNS' THEN 90 WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                            AND @nSunAltitude > 0 THEN 90 - @nSunAltitude WHEN @cChosenTilt = '1 Axis Track HEW' THEN 0 WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             AND @nSunAltitude > 0 THEN 90 - @nSunAltitude WHEN @cChosenTilt = '1 Axis Track PNS' THEN 0 WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN @nCustomTilt WHEN @cChosenTilt = '1 Axis Track VERT' THEN @nCustomTilt WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     AND @nSunAltitude > 0 THEN 90 - @nSunAltitude WHEN @cChosenTilt = '2 Axis Track' THEN 90 WHEN @cChosenTilt = 'Custom' THEN @nCustomTilt ELSE 500000 END;
            SELECT @nChosenAzimuth = CASE WHEN @cChosenTilt = '90 Deg' THEN @nChosenAzimuth WHEN @cChosenTilt = 'Latitude' THEN @nChosenAzimuth WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN @nChosenAzimuth WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN @nChosenAzimuth WHEN @cChosenTilt = 'No Tilt' THEN @nChosenAzimuth WHEN @cChosenTilt = '1 Axis Track HNS' THEN 0 WHEN @cChosenTilt = '1 Axis Track HEW' THEN 0 WHEN @cChosenTilt = '1 Axis Track PNS' THEN 0 WHEN @cChosenTilt = '1 Axis Track VERT' THEN 0 WHEN @cChosenTilt = '2 Axis Track' THEN @nSunAzimuth ELSE @nChosenAzimuth END;
            DECLARE @roundedDtCT AS DATETIME = DATEADD(hour, DATEDIFF(hour, 0, DATEADD(minute, 30 - DATEPART(minute, @dtCT + '00:30:00.000'), @dtCT)), 0);
            IF @TMYFilename <> ''
                BEGIN
                    DECLARE @strippedFileName AS VARCHAR (4000) = trim('.csv' FROM RIGHT(@TMYFilename, CHARINDEX('\', REVERSE(@TMYFilename)) - 1));
                    DECLARE @tableName AS sysname = '[dbo].[' + @strippedFileName + ']';
                    IF @nMetricsResolution = 0
                        BEGIN
                            DECLARE @ParmDefinition0 AS NVARCHAR (500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT';
                            DECLARE @sql0 AS NVARCHAR (4000) = N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
					where month(a.dtDate)=month(@bDate)
					and day(a.dtDate)=day(@bDate)
					and datepart(hour,a.dtDate)=datepart(hour,@bDate)';
                        END
                    IF @nMetricsResolution = 1
                        BEGIN
                            DECLARE @ParmDefinition1 AS NVARCHAR (500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT';
                            DECLARE @sql1 AS NVARCHAR (4000) = N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)
				and datepart(hour,a.dtDate)=datepart(hour,@bDate)';
                            EXECUTE sp_executesql @sql1, @ParmDefinition1, @bDate = @roundedDtCT, @nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT;
                            EXECUTE sp_executesql @sql0, @ParmDefinition0, @bDate = @roundedDtCT, @nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT;
                            DECLARE @ParmDefinition10 AS NVARCHAR (500) = N'@bDate datetime2, @nDNIOUTDay decimal OUTPUT, @nDHIOUTDay decimal OUTPUT,@nGHIOUTDay decimal OUTPUT';
                            DECLARE @sql10 AS NVARCHAR (4000) = N'select @nDNIOUTDay=sum(a.nDNI), @nDHIOUTDay = sum(a.nDHI), @nGHIOUTDay = sum(a.nGHI) from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)';
                            EXECUTE sp_executesql @sql10, @ParmDefinition10, @bDate = @roundedDtCT, @nDNIOUTDay = @nDNIDay OUTPUT, @nDHIOUTDay = @nDHIDay OUTPUT, @nGHIOUTDay = @nGHIDay OUTPUT;
                        END
                    IF @nMetricsResolution = 2
                        BEGIN
                            DECLARE @ParmDefinition2 AS NVARCHAR (500) = N'@bDate datetime2, @nDNIOUT decimal OUTPUT, @nDHIOUT decimal OUTPUT,@nGHIOUT decimal OUTPUT';
                            DECLARE @sql2 AS NVARCHAR (4000) = N'select top 1 @nDNIOUT=a.nDNI, @nDHIOUT = a.nDHI, @nGHIOUT = a.nGHI from ' + @tableName + ' a
				where month(a.dtDate)=month(@bDate)
				and day(a.dtDate)=day(@bDate)
				and datepart(hour,a.dtDate)=datepart(hour,@bDate)';
                            EXECUTE sp_executesql @sql2, @ParmDefinition2, @bDate = @roundedDtCT, @nDNIOUT = @nDNI OUTPUT, @nDHIOUT = @nDHI OUTPUT, @nGHIOUT = @nGHI OUTPUT;
                        END
                END
            IF @bUserSpecifiedCoordinates IS NULL
               OR @bUserSpecifiedCoordinates = 0
                BEGIN
                    SELECT @nInsolationPredicted = CASE @cChosenTilt WHEN '90 Deg' THEN (SELECT s.nTilt90
                                                                                         FROM   dbo.insolation AS s
                                                                                         WHERE  s.nCityID = @nCityID
                                                                                                AND nMonth = DATEPART(MONTH, @beginDate)) WHEN 'Latitude' THEN (SELECT s.nTiltLat
                                                                                                                                                                FROM   dbo.insolation AS s
                                                                                                                                                                WHERE  s.nCityID = @nCityID
                                                                                                                                                                       AND nMonth = DATEPART(MONTH, @beginDate)) WHEN 'Latitude Plus 15 Deg' THEN (SELECT s.nTiltLatPlus15
                                                                                                                                                                                                                                                   FROM   dbo.insolation AS s
                                                                                                                                                                                                                                                   WHERE  s.nCityID = @nCityID
                                                                                                                                                                                                                                                          AND nMonth = DATEPART(MONTH, @beginDate)) WHEN 'Latitude Minus 15 Deg' THEN (SELECT s.nTiltLatMinus15
                                                                                                                                                                                                                                                                                                                                       FROM   dbo.insolation AS s
                                                                                                                                                                                                                                                                                                                                       WHERE  s.nCityID = @nCityID
                                                                                                                                                                                                                                                                                                                                              AND nMonth = DATEPART(MONTH, @beginDate)) WHEN 'No Tilt' THEN (SELECT s.nTilt0
                                                                                                                                                                                                                                                                                                                                                                                                             FROM   dbo.insolation AS s
                                                                                                                                                                                                                                                                                                                                                                                                             WHERE  s.nCityID = @nCityID
                                                                                                                                                                                                                                                                                                                                                                                                                    AND nMonth = DATEPART(MONTH, @beginDate)) WHEN '2 Axis Track' THEN (SELECT s.n2Axis
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        FROM   dbo.insolation AS s
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        WHERE  s.nCityID = @nCityID
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               AND nMonth = DATEPART(MONTH, @beginDate)) WHEN 'Custom' THEN 0 ELSE 0 END;
                END
            ELSE
                BEGIN
                    SELECT @nInsolationPredicted = 0;
                END
            SET @nAirMassRatio = [dbo].[UDF_getAirMassRatio](@nSunAltitude);
            SET @nASHRAE_A = [dbo].[UDF_get@ASHRAE_A](@nDayOfYear);
            SET @nASHRAE_k = [dbo].[UDF_get@ASHRAE_k](@nDayOfYear);
            SET @nIB = [dbo].[UDF_get@nIB](@nASHRAE_A, @nASHRAE_k, @nAirMassRatio);
            SET @nCOS_Incidence = CASE WHEN @cChosenTilt = '90 Deg' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = 'Latitude' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = 'No Tilt' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN [dbo].[UDF_getIncidenceHNS](@nSunAltitude, @nSunAzimuth) WHEN @cChosenTilt = '1 Axis Track HNS' THEN [dbo].[UDF_getIncidenceHNS](@nSunAltitude, @nSunAzimuth) WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AND @nSunAltitude > 0 THEN [dbo].[UDF_getIncidenceHEW](@nSunAltitude, @nSunAzimuth) WHEN @cChosenTilt = '1 Axis Track HEW' THEN [dbo].[UDF_getIncidenceHEW](@nSunAltitude, @nSunAzimuth) WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          AND @nSunAltitude > 0 THEN [dbo].[UDF_getIncidencePNS](@nDeclination) WHEN @cChosenTilt = '1 Axis Track PNS' THEN [dbo].[UDF_getIncidencePNS](@nDeclination) WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AND @nSunAltitude > 0 THEN [dbo].[UDF_getIncidenceVERT](@nSunAltitude, @nChosenTiltDeg) WHEN @cChosenTilt = '1 Axis Track VERT' THEN [dbo].[UDF_getIncidenceVERT](@nSunAltitude, @nChosenTiltDeg) WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   AND @nSunAltitude > 0 THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = '2 Axis Track' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) WHEN @cChosenTilt = 'Custom' THEN [dbo].[UDF_getIncidence](@nSunAltitude, @nSunAzimuth, @nChosenTiltDeg, @nChosenAzimuth) ELSE 500000 END;
            SET @nIncidence = degrees(ACOS(@nCOS_Incidence));
            SET @nCOS_IncidenceHNS = [dbo].[UDF_getIncidenceHNS](@nSunAltitude, @nSunAzimuth);
            SET @nIncidenceHNS = degrees(ACOS(@nCOS_IncidenceHNS));
            SET @nCOS_IncidenceHEW = [dbo].[UDF_getIncidenceHEW](@nSunAltitude, @nSunAzimuth);
            SET @nIncidenceHEW = degrees(ACOS(@nCOS_IncidenceHEW));
            SET @nCOS_IncidenceVERT = [dbo].[UDF_getIncidenceVERT](@nSunAltitude, @nChosenTiltDeg);
            SET @nIncidenceVERT = degrees(ACOS(@nCOS_IncidenceVERT));
            SET @nCOS_IncidencePNS = [dbo].[UDF_getIncidencePNS](@nDeclination);
            SET @nIncidencePNS = degrees(ACOS(@nCOS_IncidencePNS));
            SET @nBeamCollector = @nIB * @nCOS_Incidence;
            SET @nBeamCollectorEmperical = @nCOS_Incidence * @nDNI;
            SET @nBeamCollectorHorizontal = [dbo].[UDF_getBeamCollectorHorizontal](@nIB, @nSunAltitude);
            SET @nSkyDiffuseFactor = [dbo].[UDF_getSkyDiffuseFactor](@nDayOfYear);
            SET @nDiffuseCollectorHorizontal = @nIB * @nSkyDiffuseFactor;
            SET @nDiffuseCollector = CASE WHEN @cChosenTilt = '90 Deg' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'No Tilt' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_HNS](@nSunAltitude, @nIncidenceHNS, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track HNS' THEN [dbo].[UDF_getIDC_HNS](@nSunAltitude, @nIncidenceHNS, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_HEW](@nSunAltitude, @nIncidenceHEW, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track HEW' THEN [dbo].[UDF_getIDC_HEW](@nSunAltitude, @nIncidenceHEW, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_PNS](@nDeclination, @nDiffuseCollectorHorizontal, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track PNS' THEN [dbo].[UDF_getIDC_PNS](@nDeclination, @nDiffuseCollectorHorizontal, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track VERT' THEN [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        AND @nSunAltitude > 0 THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = '2 Axis Track' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Custom' THEN [dbo].[UDF_getDiffuse](@nIB, @nSkyDiffuseFactor, @nChosenTiltDeg) ELSE 500000 END;
            SET @nDiffuseCollectorEmperical = CASE WHEN @cChosenTilt = '90 Deg' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'No Tilt' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude, @nIncidenceHNS, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track HNS' THEN [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude, @nIncidenceHNS, @nDHI) WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_HEW](@nSunAltitude, @nIncidenceHEW, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track HEW' THEN [dbo].[UDF_getIDC_HEW](@nSunAltitude, @nIncidenceHEW, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_PNS](@nDeclination, @nDiffuseCollectorHorizontal, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track PNS' THEN [dbo].[UDF_getIDC_PNS](@nDeclination, @nDiffuseCollectorHorizontal, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   AND @nSunAltitude > 0 THEN [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '1 Axis Track VERT' THEN [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg, @nDiffuseCollectorHorizontal) WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = '2 Axis Track' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) WHEN @cChosenTilt = 'Custom' THEN [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg) ELSE 500000 END;
            SET @nReflectedCollector = CASE WHEN @cChosenTilt = '90 Deg' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'No Tilt' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_HNS](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track HNS' THEN [dbo].[UDF_getIRC_HNS](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_HEW](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track HEW' THEN [dbo].[UDF_getIRC_HEW](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_PNS](@nReflectance, @nIB, @nSkyDiffuseFactor, @nDeclination, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track PNS' THEN [dbo].[UDF_getIRC_PNS](@nReflectance, @nIB, @nSkyDiffuseFactor, @nDeclination, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_VERT](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track VERT' THEN [dbo].[UDF_getIRC_VERT](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           AND @nSunAltitude > 0 THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = '2 Axis Track' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Custom' THEN [dbo].[UDF_getReflected](@nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) ELSE 500000 END;
            SET @nReflectedCollectorEmperical = CASE WHEN @cChosenTilt = '90 Deg' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Plus 15 Deg' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Latitude Minus 15 Deg' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'No Tilt' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = '1 Axis Track HNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_HNSEmperical](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nGHI) WHEN @cChosenTilt = '1 Axis Track HNS' THEN [dbo].[UDF_getIRC_HNS](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track HEW'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_HEW](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track HEW' THEN [dbo].[UDF_getIRC_HEW](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track PNS'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_PNS](@nReflectance, @nIB, @nSkyDiffuseFactor, @nDeclination, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track PNS' THEN [dbo].[UDF_getIRC_PNS](@nReflectance, @nIB, @nSkyDiffuseFactor, @nDeclination, @nSunAltitude) WHEN @cChosenTilt = '1 Axis Track VERT'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 AND @nSunAltitude > 0 THEN [dbo].[UDF_getIRC_VERT](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '1 Axis Track VERT' THEN [dbo].[UDF_getIRC_VERT](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB) WHEN @cChosenTilt = '2 Axis Track'
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              AND @nSunAltitude > 0 THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = '2 Axis Track' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) WHEN @cChosenTilt = 'Custom' THEN [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg) ELSE 500000 END;
            SET @nIBC_HNS = @nIB * @nCOS_IncidenceHNS;
            SET @nIDC_HNS = [dbo].[UDF_getIDC_HNS](@nSunAltitude, @nIncidenceHNS, @nDiffuseCollectorHorizontal);
            SET @nIRC_HNS = [dbo].[UDF_getIRC_HNS](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nIB);
            SET @nIBC_HNSEmperical = @nDNI * @nCOS_IncidenceHNS;
            SET @nIDC_HNSEmperical = [dbo].[UDF_getIDC_HNSEmperical](@nSunAltitude, @nIncidenceHNS, @nDiffuseCollectorHorizontal);
            SET @nIRC_HNSEmperical = [dbo].[UDF_getIRC_HNSEmperical](@nReflectance, @nSunAltitude, @nIncidenceHNS, @nSkyDiffuseFactor, @nGHI);
            SET @nIBC_HEW = @nIB * @nCOS_IncidenceHEW;
            SET @nIDC_HEW = [dbo].[UDF_getIDC_HEW](@nSunAltitude, @nIncidenceHEW, @nDiffuseCollectorHorizontal);
            SET @nIRC_HEW = [dbo].[UDF_getIRC_HEW](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB);
            SET @nIBC_VERT = @nIB * @nCOS_IncidenceVERT;
            SET @nIDC_VERT = [dbo].[UDF_getIDC_VERT](@nChosenTiltDeg, @nDiffuseCollectorHorizontal);
            SET @nIRC_VERT = [dbo].[UDF_getIRC_VERT](@nReflectance, @nSunAltitude, @nIncidenceHEW, @nSkyDiffuseFactor, @nIB);
            SET @nIBC_PNS = @nIB * @nCOS_IncidencePNS;
            SET @nIDC_PNS = [dbo].[UDF_getIDC_PNS](@nDeclination, @nDiffuseCollectorHorizontal, @nSunAltitude);
            SET @nIRC_PNS = [dbo].[UDF_getIRC_PNS](@nReflectance, @nIB, @nSkyDiffuseFactor, @nDeclination, @nSunAltitude);
            SET @nIBC2 = @nIB;
            SET @nIDC2 = [dbo].[UDF_getIDC2](@nIB, @nSkyDiffuseFactor, @nSunAltitude);
            SET @nIRC2 = [dbo].[UDF_getIRC2](@nReflectance, @nSunAltitude, @nSkyDiffuseFactor, @nIB);
            SET @nIBC2Emperical = @nCOS_Incidence * @nDNI;
            SET @nIDC2Emperical = [dbo].[UDF_getDiffuseEmperical](@nDHI, @nSkyDiffuseFactor, @nChosenTiltDeg);
            SET @nIRC2Emperical = [dbo].[UDF_getReflectedEmperical](@nGHI, @nSkyDiffuseFactor, @nSunAltitude, @nIB, @nReflectance, @nBeamCollectorHorizontal, @nDiffuseCollectorHorizontal, @nChosenTiltDeg);
            IF datepart(dy, @beginDate) >= datepart(dy, @dtDaylightFirst)
               AND datepart(dy, @beginDate) <= datepart(dy, @dtDaylightLast)
                SET @isDT = 1;
            ELSE
                SET @isDT = 0;
            IF @nInsolationPredicted > 0
                BEGIN
                    SELECT @nUseThisInsolation = @nInsolationPredicted;
                END
            ELSE
                BEGIN
                    SELECT @nUseThisInsolation = @nInsolationPredictedEmperical;
                END
            INSERT  INTO dbo.summary (nDiffuseCollectorHorizontal, nBeamCollectorHorizontal, nReflectedCollector, nReflectedCollectorEmperical, nDiffuseCollector, nDiffuseCollectorEmperical, nSkyDiffuseFactor, nBeamCollector, nBeamCollectorEmperical, nIncidence, nIB, nDNI, nDHI, nGHI, nASHRAE_A, nASHRAE_k, nDayOfYear, nAirMassRatio, nChosenBatterykWh, nBatteryRemainingkWh, nChosenTiltDeg, nDeclination, nSunAltitude, nSunAltitude0800, nSunAltitude1600, nSunAzimuth, nSunAzimuth0800, nSunAzimuth1600, cChosenTilt, nLat, nLong, nChosenBattery, nVoltage, nChosenAzimuth, nDaysRunFullCharge, nHoursMoreRun, nMPPTFactor, nBatteryEfficiency, nInverterDerate, nChosenPV, nProjectsID, nInsolation, dtDate, nDemandTotal, nInsolationPredicted, nInsolationPredictedEmperical, nInsolationPredictedEmpericalMonth, nRunningLoss, nIncidenceHNS, nIBC_HNS, nIDC_HNS, nIRC_HNS, nIBC_HNSEmperical, nIDC_HNSEmperical, nIRC_HNSEmperical, nIncidenceHEW, nIBC_HEW, nIDC_HEW, nIRC_HEW, nIncidenceVERT, nIBC_VERT, nIDC_VERT, nIRC_VERT, nIncidencePNS, nIBC_PNS, nIDC_PNS, nIRC_PNS, nIBC2, nIDC2, nIRC2, nIBC2Emperical, nIDC2Emperical, nIRC2Emperical, nHourAngle, dtCT, bIsDT, nDNIDay, nDHIDay, nGHIDay, nTotalEmpericalDay, bUserSpecifiedCoordinates)
            VALUES                  (@nDiffuseCollectorHorizontal, @nBeamCollectorHorizontal, @nReflectedCollector, @nReflectedCollectorEmperical, @nDiffuseCollector, @nDiffuseCollectorEmperical, @nSkyDiffuseFactor, @nBeamCollector, @nBeamCollectorEmperical, @nIncidence, @nIB, @nDNI, @nDHI, @nGHI, @nASHRAE_A, @nASHRAE_k, @nDayOfYear, @nAirMassRatio, @nChosenBatterykWh, @nBatteryRemainingkWh, @nChosenTiltDeg, @nDeclination, @nSunAltitude, @nSunAltitude0800, @nSunAltitude1600, @nSunAzimuth, @nSunAzimuth0800, @nSunAzimuth1600, @cChosenTilt, @nLat, @nLong, @nChosenBattery, @nVoltage, @nChosenAzimuth, CASE WHEN ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredicted) - (@nDemandTotal * @nDemandQty)) < 0 THEN ((@nChosenBattery * @nVoltage) / 1000) / -((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredicted) - (@nDemandTotal * @nDemandQty)) ELSE 0 END, CASE WHEN (((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredicted) - (@nDemandTotal * @nDemandQty))) < 0 THEN ((((@nChosenBattery * @nVoltage) / 1000) - @nRunningLoss) / -((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredicted) - (@nDemandTotal * @nDemandQty))) * 24 ELSE 999999999 END, @nMPPTFactor, @nBatteryEfficiency, @nInverterDerate, @nChosenPV, @projectsID, @nInsolation, @beginDate, (@nDemandTotal * @nDemandQty), @nInsolationPredicted, @nInsolationPredictedEmperical, @nInsolationPredictedEmpericalMonth, @nRunningLoss, @nIncidenceHNS, @nIBC_HNS, @nIDC_HNS, @nIRC_HNS, @nIBC_HNSEmperical, @nIDC_HNSEmperical, @nIRC_HNSEmperical, @nIncidenceHEW, @nIBC_HEW, @nIDC_HEW, @nIRC_HEW, @nIncidenceVERT, @nIBC_VERT, @nIDC_VERT, @nIRC_VERT, @nIncidencePNS, @nIBC_PNS, @nIDC_PNS, @nIRC_PNS, @nIBC2, @nIDC2, @nIRC2, @nIBC2Emperical, @nIDC2Emperical, @nIRC2Emperical, @nHourAngle, @dtCT, @isDT, @nDNIDay, @nDHIDay, @nGHIDay, @nTotalEmpericalDay, @bUserSpecifiedCoordinates);
            SELECT @nRunningLoss = CASE WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nUseThisInsolation) - (@nDemandTotal * @nDemandQty)) < 0 THEN 0 WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nUseThisInsolation) - (@nDemandTotal * @nDemandQty)) <= @nMaxRunningLoss
                                                                                                                                                                                                          AND @nMetricsResolution = 1 THEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nUseThisInsolation) - (@nDemandTotal * @nDemandQty)) / 24 WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nUseThisInsolation) - (@nDemandTotal * @nDemandQty)) <= @nMaxRunningLoss
                                                                                                                                                                                                                                                                                                                                                                                                  AND @nMetricsResolution != 1 THEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nUseThisInsolation) - (@nDemandTotal * @nDemandQty)) ELSE @nMaxRunningLoss END;
            IF @nMetricsResolution = 0
                BEGIN
                    SELECT @beginDate = dateadd(day, 1, @beginDate);
                END
            IF @nMetricsResolution = 1
                BEGIN
                    SELECT @beginDate = dateadd(hour, 1, @beginDate);
                END
        END
    IF @bUserSpecifiedCoordinates = 1
        BEGIN
            SET @nRunningLoss = 0;
            SET @beginDate = @originalbeginDate;
            IF @nMetricsResolution = 0
                BEGIN
                    SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), @nMetricsHour, 0, 0, 0);
                    SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), @nMetricsHour, 0, 0, 0);
                END
            IF @nMetricsResolution = 1
                BEGIN
                    SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), 0, 0, 0, 0);
                    SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), 23, 0, 0, 0);
                END
            IF @nMetricsResolution = 2
                BEGIN
                    SET @beginDate = DATETIMEFROMPARTS(datepart(year, @beginDate), datepart(month, @beginDate), datepart(day, @beginDate), 0, 0, 0, 0);
                    SET @endDate = DATETIMEFROMPARTS(datepart(year, @endDate), datepart(month, @endDate), datepart(day, @endDate), 23, 0, 0, 0);
                END
            WHILE @beginDate <= @endDate
                BEGIN
                    UPDATE dbo.summary
                    SET    nTotalEmpericalDay = (SELECT sum(a.nTotalEmperical)
                                                 FROM   summary AS a
                                                 WHERE  year(a.dtDate) = year(@beginDate)
                                                        AND datepart(dy, a.dtDate) = datepart(dy, @beginDate)
                                                        AND nProjectsID = @projectsID)
                    WHERE  year(dtDate) = year(@beginDate)
                           AND datepart(dy, dtDate) = datepart(dy, @beginDate)
                           AND nProjectsID = @projectsID;
                    UPDATE dbo.summary
                    SET    nInsolationPredictedEmperical = (SELECT (sum(a.nTotalEmperical) / 1000)
                                                            FROM   summary AS a
                                                            WHERE  year(a.dtDate) = year(@beginDate)
                                                                   AND datepart(dy, a.dtDate) = datepart(dy, @beginDate)
                                                                   AND nProjectsID = @projectsID)
                    WHERE  year(dtDate) = year(@beginDate)
                           AND datepart(dy, dtDate) = datepart(dy, @beginDate)
                           AND nProjectsID = @projectsID;
                    UPDATE dbo.summary
                    SET    nInsolationPredictedEmpericalMonth = (SELECT (avg(a.nInsolationPredictedEmperical))
                                                                 FROM   summary AS a
                                                                 WHERE  year(a.dtDate) = year(@beginDate)
                                                                        AND datepart(MONTH, a.dtDate) = datepart(MONTH, @beginDate)
                                                                        AND nProjectsID = @projectsID)
                    WHERE  year(dtDate) = year(@beginDate)
                           AND datepart(MONTH, dtDate) = datepart(MONTH, @beginDate)
                           AND nProjectsID = @projectsID;
                    SET @nInsolationPredictedEmperical = (SELECT nInsolationPredictedEmperical
                                                          FROM   dbo.summary
                                                          WHERE  dtDate = @beginDate
                                                                 AND nProjectsID = @projectsID);
                    SELECT @nRunningLoss = CASE WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) < 0 THEN 0 WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) <= @nMaxRunningLoss
                                                                                                                                                                                                                             AND @nMetricsResolution = 1 THEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) / 24 WHEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) <= @nMaxRunningLoss
                                                                                                                                                                                                                                                                                                                                                                                                                                AND @nMetricsResolution != 1 THEN @nRunningLoss - ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) ELSE @nMaxRunningLoss END;
                    SELECT @nDaysRunFullCharge = CASE WHEN ((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) < 0 THEN ((@nChosenBattery * @nVoltage) / 1000) / -((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty)) ELSE 0 END;
                    SELECT @nHoursMoreRun = CASE WHEN (((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty))) < 0 THEN ((((@nChosenBattery * @nVoltage) / 1000) - @nRunningLoss) / -((@nChosenPV * @nBatteryEfficiency * @nInverterDerate * @nMPPTFactor * @nInsolationPredictedEmperical) - (@nDemandTotal * @nDemandQty))) * 24 ELSE 999999999 END;
                    SELECT @nBatteryRemainingkWh = CASE WHEN @nChosenBatterykWh - @nRunningLoss > @nChosenBatterykWh THEN @nChosenBatterykWh ELSE @nChosenBatterykWh - @nRunningLoss END;
                    UPDATE dbo.summary
                    SET    nRunningLoss         = @nRunningLoss,
                           nBatteryRemainingkWh = @nBatteryRemainingkWh,
                           nHoursMoreRun        = @nHoursMoreRun,
                           nDaysRunFullCharge   = @nDaysRunFullCharge
                    WHERE  dtDate = @beginDate
                           AND nProjectsID = @projectsID;
                    IF @nMetricsResolution = 0
                        BEGIN
                            SELECT @beginDate = dateadd(day, 1, @beginDate);
                        END
                    IF @nMetricsResolution = 1
                        BEGIN
                            SELECT @beginDate = dateadd(hour, 1, @beginDate);
                        END
                END
        END
END

GO
CREATE PROCEDURE [dbo].[CreateTMY]
@TMYFilename VARCHAR (5000) NULL
AS
BEGIN
    DECLARE @FlatFile AS sysname = '"' + @TMYFilename + '"';
    DECLARE @strippedFileName AS VARCHAR (4000) = trim('.csv' FROM RIGHT(@TMYFilename, CHARINDEX('\', REVERSE(@TMYFilename)) - 1));
    DECLARE @TableName AS sysname = '[dbo].[' + @strippedFileName + ']';
    DECLARE @TableNameStaged AS sysname = '[dbo].[' + @strippedFileName + '_Staged]';
    DECLARE @constraint AS sysname = 'PK_' + @strippedFileName;
    DECLARE @index AS sysname = 'IX_' + @strippedFileName;
    DECLARE @constraint_dtDate AS sysname = 'DF_' + @strippedFileName + '_dtCreateDate';
    IF OBJECT_ID(@TableNameStaged, 'U') IS NOT NULL
        EXECUTE ('DROP TABLE' + @TableNameStaged);
    DECLARE @sql1 AS NVARCHAR (4000) = 'CREATE TABLE' + @TableNameStaged + '
	(
	[Year] int NULL,
	[Month] int NULL,
	[Day] int NULL,
	[Hour] int NULL,
	[Minute] int NULL,
	[DNI] int NULL,
	[DHI] int NULL,
	[GHI] int NULL,
	[Dew_Point] decimal(18,4) NULL,
	[Temperature] decimal(18,4) NULL,
	[Pressure] decimal(18,4) NULL,
	[Wind_Direction] decimal(18,4) NULL,
	[Wind_Speed] decimal(18,4) NULL,
	[Surface_Albedo] decimal(18,4) NULL

	)';
    EXECUTE (@sql1);
    DECLARE @sql2 AS NVARCHAR (4000) = 'BULK INSERT' + @TableNameStaged + 'FROM ' + @FlatFile + 'WITH (
		FIELDTERMINATOR = '','',
		ROWTERMINATOR = ''\r'',
		firstrow=2,
		 lastrow=8761
	  );';
    EXECUTE (@sql2);
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
        EXECUTE ('DROP TABLE' + @TableName);
    DECLARE @sql3 AS NVARCHAR (4000) = 'CREATE TABLE' + @TableName + '
	(
	[nID] [int] IDENTITY(1000,1) NOT NULL,
	[dtCreateDate] [datetime2](7) NULL,
	[nYear] [int] NULL,
	[nMonth] [int] NULL,
	[nDay] [int] NULL,
	[nHour] [int] NULL,
	[nMinute] [int] NULL,
	[nDNI] [int] NULL,
	[nDHI] [int] NULL,
	[nGHI] [int] NULL,
	[nDew_Point] [decimal](18, 4) NULL,
	[nTemperature] [decimal](18, 4) NULL,
	[nPressure] [decimal](18, 4) NULL,
	[nWind_Direction] [decimal](18, 4) NULL,
	[nWind_Speed] [decimal](18, 4) NULL,
	[nSurface_Albedo] [decimal](18, 4) NULL,
	[dtDate] [datetime2](7) NULL,
 CONSTRAINT [' + @constraint + '] PRIMARY KEY CLUSTERED 
(
	[nID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]';
    EXECUTE (@sql3);
    DECLARE @sql4 AS NVARCHAR (4000) = 'CREATE UNIQUE NONCLUSTERED INDEX [' + @index + '] ON ' + @TableName + '([dtDate] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]';
    EXECUTE (@sql4);
    DECLARE @sql5 AS NVARCHAR (4000) = 'ALTER TABLE' + @TableName + ' ADD  CONSTRAINT [' + @constraint_dtDate + ']  DEFAULT (getdate()) FOR [dtCreateDate]';
    EXECUTE (@sql5);
    DECLARE @sql6 AS VARCHAR (4000) = 'insert into ' + @TableName + ' (nYear,nMonth, nDay,nHour,nMinute,nDHI,nDNI,nGHI,nDew_Point,nTemperature,nPressure,nWind_Direction,nWind_Speed,nSurface_Albedo,dtDate)
--select top 1 cast(convert(numeric,Year) as int), cast(convert(numeric,Month) as int)
select  Year , Month , Day, Hour, Minute,DHI,DNI,GHI,Dew_Point,Temperature,Pressure,Wind_Direction,Wind_Speed,Surface_Albedo,DATETIMEFROMPARTS ( Year, Month, Day, Hour, Minute,0,0 ) 
from ' + @TableNameStaged;
    EXECUTE (@sql6);
END

GO
CREATE PROCEDURE [dbo].[getAllCity]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cName,
             a.nStateProvinceID,
             a.cNote,
             a.nLong,
             a.nLat
    FROM     dbo.city AS a WITH (NOLOCK)
    WHERE    ((a.bDeleted IS NULL
               OR a.bDeleted = 0))
    ORDER BY a.cName ASC;
END

GO
CREATE PROCEDURE [dbo].[getAllCountries]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cName,
             a.cAlpha2,
             a.cAlpha3,
             a.nCountryID,
             a.cNote
    FROM     country AS a WITH (NOLOCK)
    WHERE    ((a.bDeleted IS NULL
               OR a.bDeleted = 0))
    ORDER BY a.cName ASC;
END

GO
CREATE PROCEDURE [dbo].[getAllInsolation]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.nCityID,
             a.nMonth,
             a.nTilt90,
             a.nTiltLat,
             a.nTiltLatMinus15,
             a.nTiltLatPlus15,
             a.nTilt0,
             a.n2Axis,
             a.cNote,
             CASE a.nMonth WHEN 0 THEN 'Annual' WHEN 1 THEN 'Jan' WHEN 2 THEN 'Feb' WHEN 3 THEN 'Mar' WHEN 4 THEN 'Apr' WHEN 5 THEN 'May' WHEN 6 THEN 'Jun' WHEN 7 THEN 'Jul' WHEN 8 THEN 'Aug' WHEN 9 THEN 'Sep' WHEN 10 THEN 'Oct' WHEN 11 THEN 'Nov' WHEN 12 THEN 'Dec' END AS cMonthText
    FROM     dbo.insolation AS a WITH (NOLOCK)
    WHERE    ((a.bDeleted IS NULL
               OR a.bDeleted = 0))
    ORDER BY a.nMonth ASC;
END

GO
CREATE PROCEDURE [dbo].[getAllProject]
@nUserID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cName,
             a.cDesc,
             a.cNote1,
             cNote2,
             a.nClientsID,
             a.dtDateDue,
             a.nCityID,
             a.cChosenTilt,
             round(a.nMPPTFactor, 2) AS nMPPTFactor,
             round(a.nBatteryEfficiency, 2) AS nBatteryEfficiency,
             round(a.nInverterDerate, 2) AS nInverterDerate,
             round(a.nControllerEfficiency, 2) AS nControllerEfficiency,
             round(a.nDaysAutonomy, 2) AS nDaysAutonomy,
             round(a.nVoltage, 2) AS nVoltage,
             round(a.nMDoD, 2) AS nMDoD,
             round(a.nTDR, 2) AS nTDR,
             round(a.nChosenInsolation, 2) AS nChosenInsolation,
             round(a.nDemandTotal, 2) AS nDemandTotal,
             IIF (a.nCityID > 0
                  AND (a.bUserSpecifiedCoordinates IS NULL
                       OR a.bUserSpecifiedCoordinates = 0), b.cName + ', ' + c.cName + ', ' + d.cName, '') AS cCity,
             round(a.nChosenPV, 2) AS nChosenPV,
             round(a.nChosenBattery, 2) AS nChosenBattery,
             a.dtSummaryStartDate,
             a.dtSummaryEndDate,
             a.nCityIDDemand,
             IIF (a.nCityIDDemand > 0, e.cName + ', ' + f.cName + ', ' + g.cName, '') AS cCityDemand,
             IIF ((a.bUserSpecifiedCoordinates IS NULL
                   OR a.bUserSpecifiedCoordinates = 0), b.nLat, a.nManualLat) AS nLat,
             e.nLat AS nLatDemand,
             IIF ((a.bUserSpecifiedCoordinates IS NULL
                   OR a.bUserSpecifiedCoordinates = 0), b.nLong, a.nManualLong) AS nLong,
             e.nLong AS nLongDemand,
             c.nID AS nStateProvinceID,
             d.nID AS nCountryID,
             f.nID AS nStateProvinceIDDemand,
             g.nID AS nCountryIDDemand,
             a.nManualLat,
             a.nManualLong,
             a.bUserSpecifiedCoordinates,
             a.nReflectance
    FROM     dbo.projects AS a WITH (NOLOCK)
             LEFT OUTER JOIN
             dbo.city AS b
             ON a.nCityID = b.nID
             LEFT OUTER JOIN
             dbo.stateProvince AS c
             ON b.nStateProvinceID = c.nID
             LEFT OUTER JOIN
             dbo.country AS d
             ON c.nCountryID = d.nID
             LEFT OUTER JOIN
             dbo.city AS e
             ON a.nCityIDDemand = e.nID
             LEFT OUTER JOIN
             dbo.stateProvince AS f
             ON e.nStateProvinceID = f.nID
             LEFT OUTER JOIN
             dbo.country AS g
             ON f.nCountryID = g.nID
    WHERE    (a.nUsersID = @nUserID
              OR a.bGlobalUsers = 1)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0))
    ORDER BY a.dtCreateDate DESC;
END

GO
CREATE PROCEDURE [dbo].[getAllStateProvince]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cName,
             nCountryID,
             a.cNote
    FROM     stateProvince AS a WITH (NOLOCK)
    WHERE    ((a.bDeleted IS NULL
               OR a.bDeleted = 0))
    ORDER BY a.cName ASC;
END

GO
CREATE PROCEDURE [dbo].[getBattery]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cModel,
             a.cNote,
             a.bDeleted,
             b.nProjectsID,
             a.dtDateDeleted,
             a.cBrand,
             a.nCapacity_Ah,
             a.cVendor,
             a.nPrice,
             a.nQty,
             a.cURL,
             a.nVolts,
             a.nBatterySeriesStringID
    FROM     [dbo].[battery] AS a WITH (NOLOCK)
             INNER JOIN
             batterySeriesString AS b
             ON a.nBatterySeriesStringID = b.nID
    WHERE    (b.nProjectsID = @projectsID)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0)
                  AND (b.bDeleted IS NULL
                       OR b.bDeleted = 0))
    ORDER BY a.dtCreateDate ASC;
END

GO
CREATE PROCEDURE [dbo].[getBatteryMaster]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cModel,
             a.cNote,
             a.bDeleted,
             a.dtDateDeleted,
             a.cBrand,
             a.nCapacity_Ah,
             a.cVendor,
             a.nPrice,
             a.cURL,
             a.nVolts,
             a.nPriority
    FROM     [dbo].[batteryMaster] AS a WITH (NOLOCK)
    WHERE    (a.bDeleted IS NULL
              OR a.bDeleted = 0)
    ORDER BY a.nPriority DESC;
END

GO
CREATE PROCEDURE [dbo].[getBatterySeriesString]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cName,
             a.cNote,
             a.bDeleted,
             a.nProjectsID,
             (SELECT sum(nVolts * nQty)
              FROM   dbo.battery AS b
              WHERE  b.nBatterySeriesStringID = a.nID
                     AND (b.bDeleted IS NULL
                          OR b.bDeleted = 0)) AS nTotVolts,
             (SELECT min(nCapacity_Ah)
              FROM   dbo.battery AS b
              WHERE  b.nBatterySeriesStringID = a.nID
                     AND (b.bDeleted IS NULL
                          OR b.bDeleted = 0)) AS nTotCapacity
    FROM     [dbo].[batterySeriesString] AS a WITH (NOLOCK)
    WHERE    (a.nProjectsID = @projectsID)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0))
    ORDER BY a.dtCreateDate ASC;
END

GO
CREATE PROCEDURE [dbo].[getDemandItems]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cDesc,
             a.nQty,
             a.nHours,
             nPowerW,
             a.cNote,
             a.nOnOffFactor,
             a.nProjectsID,
             a.bDeleted
    FROM     demandItems AS a WITH (NOLOCK)
    WHERE    (a.nProjectsID = @projectsID)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0))
    ORDER BY a.dtCreateDate DESC;
END

GO
CREATE PROCEDURE [dbo].[getEDGAR_to_SQL]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT *
    FROM   [dbo].EDGAR_to_SQL WITH (NOLOCK);
END

GO
CREATE PROCEDURE [dbo].[getEDGAR_to_SQL_grouped]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.cISO_Name,
             a.cISO_CODE,
             b.Score2014_2015,
             sum(a.n1970) AS n1970,
             sum(a.n1971) AS n1971,
             sum(a.n1972) AS n1972,
             sum(a.n1973) AS n1973,
             sum(a.n1974) AS n1974,
             sum(a.n1975) AS n1975,
             sum(a.n1976) AS n1976,
             sum(a.n1977) AS n1977,
             sum(a.n1978) AS n1978,
             sum(a.n1979) AS n1979,
             sum(a.n1980) AS n1980,
             sum(a.n1981) AS n1981,
             sum(a.n1982) AS n1982,
             sum(a.n1983) AS n1983,
             sum(a.n1984) AS n1984,
             sum(a.n1985) AS n1985,
             sum(a.n1986) AS n1986,
             sum(a.n1987) AS n1987,
             sum(a.n1988) AS n1988,
             sum(a.n1989) AS n1989,
             sum(a.n1990) AS n1990,
             sum(a.n1991) AS n1991,
             sum(a.n1992) AS n1992,
             sum(a.n1993) AS n1993,
             sum(a.n1994) AS n1994,
             sum(a.n1995) AS n1995,
             sum(a.n1996) AS n1996,
             sum(a.n1997) AS n1997,
             sum(a.n1998) AS n1998,
             sum(a.n1999) AS n1999,
             sum(a.n2000) AS n2000,
             sum(a.n2001) AS n2001,
             sum(a.n2002) AS n2002,
             sum(a.n2003) AS n2003,
             sum(a.n2004) AS n2004,
             sum(a.n2005) AS n2005,
             sum(a.n2006) AS n2006,
             sum(a.n2007) AS n2007,
             sum(a.n2008) AS n2008,
             sum(a.n2009) AS n2009,
             sum(a.n2010) AS n2010,
             sum(a.n2011) AS n2011,
             sum(a.n2012) AS n2012,
             sum(a.n2013) AS n2013,
             sum(a.n2014) AS n2014,
             sum(a.n2015) AS n2015,
             sum(a.n2016) AS n2016
    FROM     [dbo].EDGAR_to_SQL AS a WITH (NOLOCK)
             LEFT OUTER JOIN
             dbo.democracyImport AS b
             ON a.cISO_Name = b.Country
    GROUP BY cISO_Name, cISO_CODE, b.Score2014_2015
    ORDER BY cISO_Name;
END

GO
CREATE PROCEDURE [dbo].[getEdgarPivotGrouped]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   b.cISO_Name,
             a.dtYear,
             sum(a.nCO2) AS nCO2
    FROM     [dbo].edgarPivot AS a
             INNER JOIN
             dbo.EDGAR_to_SQL AS b
             ON a.nEdgarID = b.nID
    GROUP BY b.cISO_Name, a.dtYear
    ORDER BY b.cISO_Name, a.dtYear;
END

GO
CREATE PROCEDURE [dbo].[getProject]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT a.nID,
           a.dtCreateDate,
           a.cName,
           a.cDesc,
           a.cNote1,
           cNote2,
           a.nClientsID,
           a.dtDateDue,
           a.nCityID,
           a.cChosenTilt,
           round(a.nMPPTFactor, 2) AS nMPPTFactor,
           round(a.nBatteryEfficiency, 2) AS nBatteryEfficiency,
           round(a.nInverterDerate, 2) AS nInverterDerate,
           round(a.nControllerEfficiency, 2) AS nControllerEfficiency,
           round(a.nDaysAutonomy, 2) AS nDaysAutonomy,
           round(a.nVoltage, 2) AS nVoltage,
           round(a.nMDoD, 2) AS nMDoD,
           round(a.nTDR, 2) AS nTDR,
           round(a.nChosenInsolation, 2) AS nChosenInsolation,
           round(a.nDemandTotal, 2) AS nDemandTotal,
           IIF (a.nCityID > 0
                AND (a.bUserSpecifiedCoordinates IS NULL
                     OR a.bUserSpecifiedCoordinates = 0), b.cName + ', ' + c.cName + ', ' + d.cName, '') AS cCity,
           round(a.nChosenPV, 2) AS nChosenPV,
           round(a.nChosenBattery, 2) AS nChosenBattery,
           a.dtSummaryStartDate,
           a.dtSummaryEndDate,
           a.nCityIDDemand,
           IIF (a.nCityIDDemand > 0, e.cName + ', ' + f.cName + ', ' + g.cName, '') AS cCityDemand,
           IIF ((a.bUserSpecifiedCoordinates IS NULL
                 OR a.bUserSpecifiedCoordinates = 0), b.nLat, a.nManualLat) AS nLat,
           e.nLat AS nLatDemand,
           IIF ((a.bUserSpecifiedCoordinates IS NULL
                 OR a.bUserSpecifiedCoordinates = 0), b.nLong, a.nManualLong) AS nLong,
           e.nLong AS nLongDemand,
           c.nID AS nStateProvinceID,
           d.nID AS nCountryID,
           f.nID AS nStateProvinceIDDemand,
           g.nID AS nCountryIDDemand,
           a.nManualLat,
           a.nManualLong,
           a.bUserSpecifiedCoordinates,
           a.nReflectance,
           a.nDemandQty,
           a.nMetricsResolution,
           a.nMetricsHour,
           a.nGMTPlusMinus,
           a.nChosenAzimuth,
           a.nCustomTilt,
           a.nCO2g_perkWhCoal,
           a.nCO2g_perkWhPV,
           a.bDaylightTime,
           a.dtDaylightFirst,
           a.dtDaylightLast,
           a.cTMYFile
    FROM   dbo.projects AS a WITH (NOLOCK)
           LEFT OUTER JOIN
           dbo.city AS b
           ON a.nCityID = b.nID
           LEFT OUTER JOIN
           dbo.stateProvince AS c
           ON b.nStateProvinceID = c.nID
           LEFT OUTER JOIN
           dbo.country AS d
           ON c.nCountryID = d.nID
           LEFT OUTER JOIN
           dbo.city AS e
           ON a.nCityIDDemand = e.nID
           LEFT OUTER JOIN
           dbo.stateProvince AS f
           ON e.nStateProvinceID = f.nID
           LEFT OUTER JOIN
           dbo.country AS g
           ON f.nCountryID = g.nID
    WHERE  (a.nID = @projectsID)
           AND ((a.bDeleted IS NULL
                 OR a.bDeleted = 0));
END

GO
CREATE PROCEDURE [dbo].[getPV]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cModel,
             a.cBrand,
             a.nPmax,
             a.nVmp,
             a.nImp,
             a.nVoc,
             a.nIsc,
             a.nWeight_kg,
             a.nLength_mm,
             a.nWidth_mm,
             a.nHeight_mm,
             a.cFrame,
             a.cVendor,
             a.nPrice,
             a.nTilt_deg,
             a.nOrientation_deg,
             a.cURL,
             a.nQty,
             a.bDeleted,
             a.nProjectsID
    FROM     dbo.PV AS a WITH (NOLOCK)
    WHERE    (a.nProjectsID = @projectsID)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0))
    ORDER BY a.dtCreateDate ASC;
END

GO
CREATE PROCEDURE [dbo].[getPVMaster]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.cModel,
             a.cBrand,
             a.nPmax,
             a.nVmp,
             a.nImp,
             a.nVoc,
             a.nIsc,
             a.nWeight_kg,
             a.nLength_mm,
             a.nWidth_mm,
             a.nHeight_mm,
             a.cFrame,
             a.cVendor,
             a.nPrice,
             a.cURL,
             a.bDeleted,
             a.nPriority
    FROM     dbo.PVMaster AS a WITH (NOLOCK)
    WHERE    (a.bDeleted IS NULL
              OR a.bDeleted = 0)
    ORDER BY a.nPriority DESC;
END

GO
CREATE PROCEDURE [dbo].[getSummary]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.dtDate,
             a.nInsolation,
             a.cNote,
             a.nProjectsID,
             a.nInsolationPredicted,
             a.nInsolationPredictedEmperical,
             a.nInsolationPredictedEmpericalMonth,
             a.nDemandTotal,
             a.nRequiredPV,
             a.nChosenPV,
             a.nMPPTFactor,
             a.nBatteryEfficiency,
             a.nInverterDerate,
             a.nDaysRunFullCharge,
             a.nVoltage,
             a.nChosenBattery,
             a.nRunningLoss,
             a.nLat,
             a.nLong,
             a.cChosenTilt,
             a.nSunAltitude,
             a.nSunAltitude0800,
             a.nSunAltitude1600,
             a.nSunAzimuth,
             a.nSunAzimuth0800,
             a.nSunAzimuth1600,
             a.nDeclination,
             a.nChosenTiltDeg,
             a.nChosenBatterykWh,
             a.nBatteryRemainingkWh,
             a.nAirMassRatio,
             a.nDayOfYear,
             a.nASHRAE_A,
             a.nASHRAE_k,
             a.nIB,
             a.nDNI,
             a.nDNIDay,
             a.nIncidence,
             a.nBeamCollector,
             a.nBeamCollectorEmperical,
             a.nSkyDiffuseFactor,
             a.nDiffuseCollector,
             a.nDiffuseCollectorEmperical,
             a.nReflectedCollector,
             a.nReflectedCollectorEmperical,
             a.nBeamCollectorHorizontal,
             a.nDiffuseCollectorHorizontal,
             a.nDHI,
             a.nGHI,
             a.nDHIDay,
             a.nGHIDay,
             90 - a.nSunAltitude AS nOptimumTiltSQL,
             a.nIncidenceHNS,
             a.nIBC_HNS,
             a.nIDC_HNS,
             a.nIRC_HNS,
             a.nIBC_HNSEmperical,
             a.nIDC_HNSEmperical,
             a.nIRC_HNSEmperical,
             a.nIncidenceHEW,
             a.nIBC_HEW,
             a.nIDC_HEW,
             a.nIRC_HEW,
             a.nIncidenceVERT,
             a.nIBC_VERT,
             a.nIDC_VERT,
             a.nIRC_VERT,
             a.nIncidencePNS,
             a.nIBC_PNS,
             a.nIDC_PNS,
             a.nIRC_PNS,
             a.nIBC2,
             a.nIDC2,
             a.nIRC2,
             a.nIBC2Emperical,
             a.nIDC2Emperical,
             a.nIRC2Emperical,
             a.nHourAngle,
             a.nHoursMoreRun,
             a.dtCT,
             a.nChosenAzimuth,
             a.bIsDT,
             a.nTotalEmpericalDay,
             a.bUserSpecifiedCoordinates
    FROM     summary AS a WITH (NOLOCK)
    WHERE    (a.nProjectsID = @projectsID)
             AND ((a.bDeleted IS NULL
                   OR a.bDeleted = 0))
    ORDER BY a.dtDate ASC;
END

GO
CREATE PROCEDURE [dbo].[getSummaryAll]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   a.nID,
             a.dtCreateDate,
             a.dtDate,
             a.nInsolation,
             a.cNote,
             a.nProjectsID
    FROM     summary AS a WITH (NOLOCK)
    WHERE    ((a.bDeleted IS NULL
               OR a.bDeleted = 0))
    ORDER BY a.dtCreateDate DESC;
END

GO
CREATE PROCEDURE [dbo].[getSummaryDailyTotals]
@projectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    SELECT   CONVERT (DATE, a.dtDate),
             sum(a.nBeamCollector)
    FROM     summary AS a WITH (NOLOCK)
    GROUP BY CONVERT (DATE, a.dtDate)
    ORDER BY CONVERT (DATE, a.dtDate);
END

GO
CREATE PROCEDURE [dbo].[getUser]
@cEmail VARCHAR (50) NULL, @cPassword VARCHAR (50) NULL, @nID INT NULL OUTPUT, @cFirst VARCHAR (50) NULL OUTPUT, @cLast VARCHAR (50) NULL OUTPUT, @cRoleName VARCHAR (50) NULL OUTPUT, @nRoleID INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT @nID = a.nID,
           @cFirst = a.cFirst,
           @cLast = a.cLast,
           @cRoleName = b.cName,
           @nRoleID = b.nID
    FROM   dbo.users AS a WITH (NOLOCK)
           LEFT OUTER JOIN
           dbo.role AS b
           ON a.nRoleID = b.nID
    WHERE  a.cEmail = @cEmail
           AND a.cPassword = @cPassword
           AND ((a.bDeleted IS NULL
                 OR a.bDeleted = 0));
END

GO
CREATE PROCEDURE [dbo].[InsertCountries]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.country (nCountryID, cName, cAlpha2, cAlpha3)
    VALUES                  (4, 'Afghanistan', 'af', 'afg'),
    (248, 'Ã…land Islands', 'ax', 'ala'),
    (8, 'Albania', 'al', 'alb'),
    (12, 'Algeria', 'dz', 'dza'),
    (16, 'American Samoa', 'as', 'asm'),
    (20, 'Andorra', 'ad', 'and'),
    (24, 'Angola', 'ao', 'ago'),
    (660, 'Anguilla', 'ai', 'aia'),
    (10, 'Antarctica', 'aq', 'ata'),
    (28, 'Antigua and Barbuda', 'ag', 'atg'),
    (32, 'Argentina', 'ar', 'arg'),
    (51, 'Armenia', 'am', 'arm'),
    (533, 'Aruba', 'aw', 'abw'),
    (36, 'Australia', 'au', 'aus'),
    (40, 'Austria', 'at', 'aut'),
    (31, 'Azerbaijan', 'az', 'aze'),
    (44, 'Bahamas', 'bs', 'bhs'),
    (48, 'Bahrain', 'bh', 'bhr'),
    (50, 'Bangladesh', 'bd', 'bgd'),
    (52, 'Barbados', 'bb', 'brb'),
    (112, 'Belarus', 'by', 'blr'),
    (56, 'Belgium', 'be', 'bel'),
    (84, 'Belize', 'bz', 'blz'),
    (204, 'Benin', 'bj', 'ben'),
    (60, 'Bermuda', 'bm', 'bmu'),
    (64, 'Bhutan', 'bt', 'btn'),
    (68, 'Bolivia (Plurinational State of)', 'bo', 'bol'),
    (535, 'Bonaire, Sint Eustatius and Saba', 'bq', 'bes'),
    (70, 'Bosnia and Herzegovina', 'ba', 'bih'),
    (72, 'Botswana', 'bw', 'bwa'),
    (74, 'Bouvet Island', 'bv', 'bvt'),
    (76, 'Brazil', 'br', 'bra'),
    (86, 'British Indian Ocean Territory', 'io', 'iot'),
    (96, 'Brunei Darussalam', 'bn', 'brn'),
    (100, 'Bulgaria', 'bg', 'bgr'),
    (854, 'Burkina Faso', 'bf', 'bfa'),
    (108, 'Burundi', 'bi', 'bdi'),
    (132, 'Cabo Verde', 'cv', 'cpv'),
    (116, 'Cambodia', 'kh', 'khm'),
    (120, 'Cameroon', 'cm', 'cmr'),
    (124, 'Canada', 'ca', 'can'),
    (136, 'Cayman Islands', 'ky', 'cym'),
    (140, 'Central African Republic', 'cf', 'caf'),
    (148, 'Chad', 'td', 'tcd'),
    (152, 'Chile', 'cl', 'chl'),
    (156, 'China', 'cn', 'chn'),
    (162, 'Christmas Island', 'cx', 'cxr'),
    (166, 'Cocos (Keeling) Islands', 'cc', 'cck'),
    (170, 'Colombia', 'co', 'col'),
    (174, 'Comoros', 'km', 'com'),
    (178, 'Congo', 'cg', 'cog'),
    (180, 'Congo (Democratic Republic of the)', 'cd', 'cod'),
    (184, 'Cook Islands', 'ck', 'cok'),
    (188, 'Costa Rica', 'cr', 'cri'),
    (384, 'Cote d''Ivoire', 'ci', 'civ'),
    (191, 'Croatia', 'hr', 'hrv'),
    (192, 'Cuba', 'cu', 'cub'),
    (531, 'CuraÃ§ao', 'cw', 'cuw'),
    (196, 'Cyprus', 'cy', 'cyp'),
    (203, 'Czechia', 'cz', 'cze'),
    (208, 'Denmark', 'dk', 'dnk'),
    (262, 'Djibouti', 'dj', 'dji'),
    (212, 'Dominica', 'dm', 'dma'),
    (214, 'Dominican Republic', 'do', 'dom'),
    (218, 'Ecuador', 'ec', 'ecu'),
    (818, 'Egypt', 'eg', 'egy'),
    (222, 'El Salvador', 'sv', 'slv'),
    (226, 'Equatorial Guinea', 'gq', 'gnq'),
    (232, 'Eritrea', 'er', 'eri'),
    (233, 'Estonia', 'ee', 'est'),
    (748, 'Eswatini', 'sz', 'swz'),
    (231, 'Ethiopia', 'et', 'eth'),
    (238, 'Falkland Islands (Malvinas)', 'fk', 'flk'),
    (234, 'Faroe Islands', 'fo', 'fro'),
    (242, 'Fiji', 'fj', 'fji'),
    (246, 'Finland', 'fi', 'fin'),
    (250, 'France', 'fr', 'fra'),
    (254, 'French Guiana', 'gf', 'guf'),
    (258, 'French Polynesia', 'pf', 'pyf'),
    (260, 'French Southern Territories', 'tf', 'atf'),
    (266, 'Gabon', 'ga', 'gab'),
    (270, 'Gambia', 'gm', 'gmb'),
    (268, 'Georgia', 'ge', 'geo'),
    (276, 'Germany', 'de', 'deu'),
    (288, 'Ghana', 'gh', 'gha'),
    (292, 'Gibraltar', 'gi', 'gib'),
    (300, 'Greece', 'gr', 'grc'),
    (304, 'Greenland', 'gl', 'grl'),
    (308, 'Grenada', 'gd', 'grd'),
    (312, 'Guadeloupe', 'gp', 'glp'),
    (316, 'Guam', 'gu', 'gum'),
    (320, 'Guatemala', 'gt', 'gtm'),
    (831, 'Guernsey', 'gg', 'ggy'),
    (324, 'Guinea', 'gn', 'gin'),
    (624, 'Guinea-Bissau', 'gw', 'gnb'),
    (328, 'Guyana', 'gy', 'guy'),
    (332, 'Haiti', 'ht', 'hti'),
    (334, 'Heard Island and McDonald Islands', 'hm', 'hmd'),
    (336, 'Holy See', 'va', 'vat'),
    (340, 'Honduras', 'hn', 'hnd'),
    (344, 'Hong Kong', 'hk', 'hkg'),
    (348, 'Hungary', 'hu', 'hun'),
    (352, 'Iceland', 'is', 'isl'),
    (356, 'India', 'in', 'ind'),
    (360, 'Indonesia', 'id', 'idn'),
    (364, 'Iran (Islamic Republic of)', 'ir', 'irn'),
    (368, 'Iraq', 'iq', 'irq'),
    (372, 'Ireland', 'ie', 'irl'),
    (833, 'Isle of Man', 'im', 'imn'),
    (376, 'Israel', 'il', 'isr'),
    (380, 'Italy', 'it', 'ita'),
    (388, 'Jamaica', 'jm', 'jam'),
    (392, 'Japan', 'jp', 'jpn'),
    (832, 'Jersey', 'je', 'jey'),
    (400, 'Jordan', 'jo', 'jor'),
    (398, 'Kazakhstan', 'kz', 'kaz'),
    (404, 'Kenya', 'ke', 'ken'),
    (296, 'Kiribati', 'ki', 'kir'),
    (408, 'Korea (Democratic People''s Republic of)', 'kp', 'prk'),
    (410, 'Korea (Republic of)', 'kr', 'kor'),
    (414, 'Kuwait', 'kw', 'kwt'),
    (417, 'Kyrgyzstan', 'kg', 'kgz'),
    (418, 'Lao People''s Democratic Republic', 'la', 'lao'),
    (428, 'Latvia', 'lv', 'lva'),
    (422, 'Lebanon', 'lb', 'lbn'),
    (426, 'Lesotho', 'ls', 'lso'),
    (430, 'Liberia', 'lr', 'lbr'),
    (434, 'Libya', 'ly', 'lby'),
    (438, 'Liechtenstein', 'li', 'lie'),
    (440, 'Lithuania', 'lt', 'ltu'),
    (442, 'Luxembourg', 'lu', 'lux'),
    (446, 'Macao', 'mo', 'mac'),
    (807, 'Macedonia (the former Yugoslav Republic of)', 'mk', 'mkd'),
    (450, 'Madagascar', 'mg', 'mdg'),
    (454, 'Malawi', 'mw', 'mwi'),
    (458, 'Malaysia', 'my', 'mys'),
    (462, 'Maldives', 'mv', 'mdv'),
    (466, 'Mali', 'ml', 'mli'),
    (470, 'Malta', 'mt', 'mlt'),
    (584, 'Marshall Islands', 'mh', 'mhl'),
    (474, 'Martinique', 'mq', 'mtq'),
    (478, 'Mauritania', 'mr', 'mrt'),
    (480, 'Mauritius', 'mu', 'mus'),
    (175, 'Mayotte', 'yt', 'myt'),
    (484, 'Mexico', 'mx', 'mex'),
    (583, 'Micronesia (Federated States of)', 'fm', 'fsm'),
    (498, 'Moldova (Republic of)', 'md', 'mda'),
    (492, 'Monaco', 'mc', 'mco'),
    (496, 'Mongolia', 'mn', 'mng'),
    (499, 'Montenegro', 'me', 'mne'),
    (500, 'Montserrat', 'ms', 'msr'),
    (504, 'Morocco', 'ma', 'mar'),
    (508, 'Mozambique', 'mz', 'moz'),
    (104, 'Myanmar', 'mm', 'mmr'),
    (516, 'Namibia', 'na', 'nam'),
    (520, 'Nauru', 'nr', 'nru'),
    (524, 'Nepal', 'np', 'npl'),
    (528, 'Netherlands', 'nl', 'nld'),
    (540, 'New Caledonia', 'nc', 'ncl'),
    (554, 'New Zealand', 'nz', 'nzl'),
    (558, 'Nicaragua', 'ni', 'nic'),
    (562, 'Niger', 'ne', 'ner'),
    (566, 'Nigeria', 'ng', 'nga'),
    (570, 'Niue', 'nu', 'niu'),
    (574, 'Norfolk Island', 'nf', 'nfk'),
    (580, 'Northern Mariana Islands', 'mp', 'mnp'),
    (578, 'Norway', 'no', 'nor'),
    (512, 'Oman', 'om', 'omn'),
    (586, 'Pakistan', 'pk', 'pak'),
    (585, 'Palau', 'pw', 'plw'),
    (275, 'Palestine, State of', 'ps', 'pse'),
    (591, 'Panama', 'pa', 'pan'),
    (598, 'Papua New Guinea', 'pg', 'png'),
    (600, 'Paraguay', 'py', 'pry'),
    (604, 'Peru', 'pe', 'per'),
    (608, 'Philippines', 'ph', 'phl'),
    (612, 'Pitcairn', 'pn', 'pcn'),
    (616, 'Poland', 'pl', 'pol'),
    (620, 'Portugal', 'pt', 'prt'),
    (630, 'Puerto Rico', 'pr', 'pri'),
    (634, 'Qatar', 'qa', 'qat'),
    (638, 'RÃ©union', 're', 'reu'),
    (642, 'Romania', 'ro', 'rou'),
    (643, 'Russian Federation', 'ru', 'rus'),
    (646, 'Rwanda', 'rw', 'rwa'),
    (652, 'Saint BarthÃ©lemy', 'bl', 'blm'),
    (654, 'Saint Helena, Ascension and Tristan da Cunha', 'sh', 'shn'),
    (659, 'Saint Kitts and Nevis', 'kn', 'kna'),
    (662, 'Saint Lucia', 'lc', 'lca'),
    (663, 'Saint Martin (French part)', 'mf', 'maf'),
    (666, 'Saint Pierre and Miquelon', 'pm', 'spm'),
    (670, 'Saint Vincent and the Grenadines', 'vc', 'vct'),
    (882, 'Samoa', 'ws', 'wsm'),
    (674, 'San Marino', 'sm', 'smr'),
    (678, 'Sao Tome and Principe', 'st', 'stp'),
    (682, 'Saudi Arabia', 'sa', 'sau'),
    (686, 'Senegal', 'sn', 'sen'),
    (688, 'Serbia', 'rs', 'srb'),
    (690, 'Seychelles', 'sc', 'syc'),
    (694, 'Sierra Leone', 'sl', 'sle'),
    (702, 'Singapore', 'sg', 'sgp'),
    (534, 'Sint Maarten (Dutch part)', 'sx', 'sxm'),
    (703, 'Slovakia', 'sk', 'svk'),
    (705, 'Slovenia', 'si', 'svn'),
    (90, 'Solomon Islands', 'sb', 'slb'),
    (706, 'Somalia', 'so', 'som'),
    (710, 'South Africa', 'za', 'zaf'),
    (239, 'South Georgia and the South Sandwich Islands', 'gs', 'sgs'),
    (728, 'South Sudan', 'ss', 'ssd'),
    (724, 'Spain', 'es', 'esp'),
    (144, 'Sri Lanka', 'lk', 'lka'),
    (729, 'Sudan', 'sd', 'sdn'),
    (740, 'Suriname', 'sr', 'sur'),
    (744, 'Svalbard and Jan Mayen', 'sj', 'sjm'),
    (752, 'Sweden', 'se', 'swe'),
    (756, 'Switzerland', 'ch', 'che'),
    (760, 'Syrian Arab Republic', 'sy', 'syr'),
    (158, 'Taiwan, Province of China', 'tw', 'twn'),
    (762, 'Tajikistan', 'tj', 'tjk'),
    (834, 'Tanzania, United Republic of', 'tz', 'tza'),
    (764, 'Thailand', 'th', 'tha'),
    (626, 'Timor-Leste', 'tl', 'tls'),
    (768, 'Togo', 'tg', 'tgo'),
    (772, 'Tokelau', 'tk', 'tkl'),
    (776, 'Tonga', 'to', 'ton'),
    (780, 'Trinidad and Tobago', 'tt', 'tto'),
    (788, 'Tunisia', 'tn', 'tun'),
    (792, 'Turkey', 'tr', 'tur'),
    (795, 'Turkmenistan', 'tm', 'tkm'),
    (796, 'Turks and Caicos Islands', 'tc', 'tca'),
    (798, 'Tuvalu', 'tv', 'tuv'),
    (800, 'Uganda', 'ug', 'uga'),
    (804, 'Ukraine', 'ua', 'ukr'),
    (784, 'United Arab Emirates', 'ae', 'are'),
    (826, 'United Kingdom of Great Britain and Northern Ireland', 'gb', 'gbr'),
    (840, 'United States of America', 'us', 'usa'),
    (581, 'United States Minor Outlying Islands', 'um', 'umi'),
    (858, 'Uruguay', 'uy', 'ury'),
    (860, 'Uzbekistan', 'uz', 'uzb'),
    (548, 'Vanuatu', 'vu', 'vut'),
    (862, 'Venezuela (Bolivarian Republic of)', 've', 'ven'),
    (704, 'Viet Nam', 'vn', 'vnm'),
    (92, 'Virgin Islands (British)', 'vg', 'vgb'),
    (850, 'Virgin Islands (U.S.)', 'vi', 'vir'),
    (876, 'Wallis and Futuna', 'wf', 'wlf'),
    (732, 'Western Sahara', 'eh', 'esh'),
    (887, 'Yemen', 'ye', 'yem'),
    (894, 'Zambia', 'zm', 'zmb'),
    (716, 'Zimbabwe', 'zw', 'zwe');
END

GO
CREATE PROCEDURE [dbo].[updateChosenBattery]
@nProjectsID INT NULL, @nChosenBattery DECIMAL (18, 6) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    a.nChosenBattery = @nChosenBattery
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateChosenDemand]
@nProjectsID INT NULL, @nDemandTotal DECIMAL (18, 6) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    nDemandTotal = @nDemandTotal
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateChosenPV]
@nProjectsID INT NULL, @nChosenPV DECIMAL (18, 6) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    a.nChosenPV = @nChosenPV
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateCity]
@nProjectsID INT NULL, @nCityID INT NULL, @nInsolation DECIMAL (18, 6) NULL, @nManualLat DECIMAL (18, 6) NULL, @nManualLong DECIMAL (18, 6) NULL, @bUserSpecifiedCoordinates BIT NULL, @nReflectance DECIMAL (18, 6) NULL, @nGMTPlusMinus DECIMAL (18, 6) NULL, @bDaylightTime BIT NULL, @dtDaylightFirst DATETIME2 (7) NULL, @dtDaylightLast DATETIME2 (7) NULL, @cTMYFile NVARCHAR (MAX) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    a.nCityID                   = @nCityID,
           a.nChosenInsolation         = @nInsolation,
           a.nManualLat                = @nManualLat,
           a.nManualLong               = @nManualLong,
           a.bUserSpecifiedCoordinates = @bUserSpecifiedCoordinates,
           a.nReflectance              = @nReflectance,
           a.nGMTPlusMinus             = @nGMTPlusMinus,
           a.bDaylightTime             = @bDaylightTime,
           a.dtDaylightFirst           = @dtDaylightFirst,
           a.dtDaylightLast            = @dtDaylightLast,
           a.cTMYFile                  = @cTMYFile
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateCityDemand]
@nProjectsID INT NULL, @nCityID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    a.nCityIDDemand = @nCityID
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateDerates]
@nProjectsID INT NULL, @nMPPTFactor DECIMAL (18, 6) NULL, @nBatteryEfficiency DECIMAL (18, 6) NULL, @nChosenAzimuth DECIMAL (18, 6) NULL, @nControllerEfficiency DECIMAL (18, 6) NULL, @nDaysAutonomy DECIMAL (18, 6) NULL, @nVoltage DECIMAL (18, 6) NULL, @nMDoD DECIMAL (18, 6) NULL, @nTDR DECIMAL (18, 6) NULL, @nInverterDerate DECIMAL (18, 6) NULL, @nCustomTilt DECIMAL (18, 6) NULL, @nChosenInsolation DECIMAL (18, 6) NULL, @nChosenBattery DECIMAL (18, 6) NULL, @nChosenPV DECIMAL (18, 6) NULL, @nDemandTotal DECIMAL (18, 6) NULL, @cName VARCHAR (MAX) NULL, @cDesc VARCHAR (MAX) NULL, @cNote1 VARCHAR (MAX) NULL, @cNote2 VARCHAR (MAX) NULL, @cChosenTilt VARCHAR (MAX) NULL, @dtDateDue DATETIME NULL, @nMetricsResolution INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    nMPPTFactor           = @nMPPTFactor,
           nBatteryEfficiency    = @nBatteryEfficiency,
           nChosenAzimuth        = @nChosenAzimuth,
           nControllerEfficiency = @nControllerEfficiency,
           nInverterDerate       = @nInverterDerate,
           nDaysAutonomy         = @nDaysAutonomy,
           nMDoD                 = @nMDoD,
           nTDR                  = @nTDR,
           nVoltage              = @nVoltage,
           nCustomTilt           = @nCustomTilt,
           nChosenInsolation     = @nChosenInsolation,
           nChosenBattery        = @nChosenBattery,
           nChosenPV             = @nChosenPV,
           nDemandTotal          = @nDemandTotal,
           cName                 = @cName,
           cDesc                 = @cDesc,
           cNote1                = @cNote1,
           cNote2                = @cNote2,
           cChosenTilt           = @cChosenTilt,
           dtDateDue             = @dtDateDue
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateEnterprise]
@nProjectsID INT NULL, @nDemandTotal DECIMAL (18, 6) NULL, @nDemandQty DECIMAL (18, 6) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    nDemandTotal = @nDemandTotal,
           nDemandQty   = @nDemandQty
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[updateSummaryDates]
@nProjectsID INT NULL, @dtStartDate DATETIME NULL, @dtEndDate DATETIME NULL, @nMetricsResolution INT NULL, @nMetricsHour INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    a.dtSummaryStartDate = @dtStartDate,
           a.dtSummaryEndDate   = @dtEndDate,
           a.nMetricsResolution = @nMetricsResolution,
           a.nMetricsHour       = @nMetricsHour
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[USP_autoBattery]
@nProjectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @transactIdentity AS INT, @cSeriesName AS VARCHAR (MAX), @nChosenBattery AS DECIMAL (16, 4), @nSeriesNeeded AS DECIMAL (16, 4), @nUnitsNeeded AS DECIMAL (16, 4), @nVoltage AS DECIMAL (16, 4), @cModel AS NVARCHAR (MAX), @cBrand AS NVARCHAR (MAX), @nCapacity_Ah AS DECIMAL (20, 6), @cNote AS NVARCHAR (MAX), @cVendor AS NVARCHAR (MAX), @nPrice AS DECIMAL (20, 6), @nVolts AS DECIMAL (16, 4), @cURL AS NVARCHAR (MAX), @nQty AS INT, @nQtySeries AS INT, @nQtyBatteryInSeries AS DECIMAL (16, 4);
    SELECT   TOP (1) @cModel = a.cModel,
                     @cBrand = a.cBrand,
                     @nVolts = nVolts,
                     @nCapacity_Ah = nCapacity_Ah,
                     @cVendor = a.cVendor,
                     @nPrice = a.nPrice,
                     @cURL = a.cURL
    FROM     dbo.batteryMaster AS a
    ORDER BY a.nPriority DESC;
    SELECT @nChosenBattery = nChosenBattery,
           @nVoltage = nVoltage
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
    SELECT @nSeriesNeeded = CASE WHEN @nCapacity_Ah > 0 THEN @nChosenBattery / @nCapacity_Ah ELSE 0 END;
    SELECT @nQtyBatteryInSeries = CASE WHEN @nVolts > 0 THEN @nVoltage / @nVolts ELSE 0 END;
    SELECT @nQtySeries = CEILING(@nQtyBatteryInSeries);
    DECLARE @i AS INT = 0;
    WHILE @i < @nSeriesNeeded
        BEGIN
            SET @cSeriesName = 'Series ' + CONVERT (VARCHAR (10), @i);
            INSERT  INTO dbo.batterySeriesString (nProjectsID, cName, bDeleted)
            VALUES                              (@nProjectsID, @cSeriesName, 0);
            SELECT @transactIdentity = SCOPE_IDENTITY();
            DECLARE @j AS INT = 0;
            WHILE @j < @nQtySeries
                BEGIN
                    INSERT  INTO dbo.battery (cModel, cNote, nQty, nBatterySeriesStringID, bDeleted, nPrice, cURL, cVendor, cBrand, nVolts, nCapacity_Ah)
                    VALUES                  (@cModel, @cNote, @nQtySeries, @transactIdentity, 0, @nPrice, @cURL, @cVendor, @cBrand, @nVolts, @nCapacity_Ah);
                    SET @j = @j + 1;
                END
            SET @i = @i + 1;
        END
END

GO
CREATE PROCEDURE [dbo].[USP_autoPV]
@nProjectsID INT NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @nChosenPV AS DECIMAL (16, 4), @cChosenTilt AS VARCHAR (MAX), @nUnitsNeeded AS DECIMAL (16, 4), @cModel AS NVARCHAR (MAX), @cBrand AS NVARCHAR (MAX), @nPmax AS DECIMAL (20, 6), @nVmp AS DECIMAL (20, 6), @nImp AS DECIMAL (20, 6), @nVoc AS DECIMAL (20, 6), @nIsc AS DECIMAL (20, 6), @nWeight_kg AS DECIMAL (20, 6), @nLength_mm AS DECIMAL (20, 6), @nHeight_mm AS DECIMAL (20, 6), @nWidth_mm AS DECIMAL (20, 6), @cFrame AS NVARCHAR (MAX), @cVendor AS NVARCHAR (MAX), @nPrice AS DECIMAL (20, 6), @nTilt_deg AS DECIMAL (20, 6), @nOrientation_deg AS DECIMAL (20, 6) = 180, @cURL AS NVARCHAR (MAX), @nQty AS INT;
    SELECT   TOP (1) @cModel = a.cModel,
                     @cBrand = a.cBrand,
                     @nPmax = a.nPmax,
                     @nVmp = a.nVmp,
                     @nImp = a.nImp,
                     @nVoc = a.nVoc,
                     @nIsc = a.nIsc,
                     @nWeight_kg = a.nWeight_kg,
                     @nLength_mm = a.nLength_mm,
                     @nHeight_mm = a.nHeight_mm,
                     @nWidth_mm = a.nWidth_mm,
                     @cFrame = a.cFrame,
                     @cVendor = a.cVendor,
                     @nPrice = a.nPrice,
                     @cURL = a.cURL
    FROM     dbo.PVMaster AS a
    ORDER BY a.nPriority DESC;
    SELECT @nChosenPV = nChosenPV,
           @cChosenTilt = cChosenTilt
    FROM   dbo.projects AS a
    WHERE  a.nID = @nProjectsID;
    SELECT @nTilt_deg = 0;
    SELECT @nUnitsNeeded = CASE WHEN @nPmax > 0 THEN (@nChosenPV * 1000) / @nPmax ELSE 0 END;
    SELECT @nQty = CEILING(@nUnitsNeeded);
    INSERT  INTO dbo.PV (nProjectsID, cModel, cBrand, nPmax, nVmp, nImp, nVoc, nIsc, nWeight_kg, nLength_mm, nHeight_mm, nWidth_mm, cFrame, cVendor, nPrice, nTilt_deg, nOrientation_deg, cURL, nQty, bDeleted)
    VALUES             (@nProjectsID, @cModel, @cBrand, @nPmax, @nVmp, @nImp, @nVoc, @nIsc, @nWeight_kg, @nLength_mm, @nHeight_mm, @nWidth_mm, @cFrame, @cVendor, @nPrice, @nTilt_deg, @nOrientation_deg, @cURL, @nQty, 0);
END

GO
CREATE PROCEDURE [dbo].[USP_deletePV]
@nProjectsID INT NULL=0
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.PV
    SET    bDeleted      = 1,
           dtDateDeleted = getDate()
    WHERE  nProjectsID = @nProjectsID;
END

GO
CREATE PROCEDURE [dbo].[USP_insertBattery]
@nBatterySeriesStringID INT NULL=0, @nQty INT NULL=0, @nPrice DECIMAL (16, 4) NULL=0, @nVolts DECIMAL (16, 4) NULL=0, @nCapacity_Ah DECIMAL (16, 4) NULL=0, @cNote VARCHAR (MAX) NULL, @cBrand VARCHAR (MAX) NULL, @cModel VARCHAR (MAX) NULL, @cVendor VARCHAR (MAX) NULL, @cURL VARCHAR (MAX) NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.battery (cModel, cNote, nQty, nBatterySeriesStringID, bDeleted, nPrice, cURL, cVendor, cBrand, nVolts, nCapacity_Ah)
    VALUES                  (@cModel, @cNote, @nQty, @nBatterySeriesStringID, 0, @nPrice, @cURL, @cVendor, @cBrand, @nVolts, @nCapacity_Ah);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertBatteryMaster]
@transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.batteryMaster (cModel, cNote, bDeleted)
    VALUES                        ('Battery', '', 0);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertBatterySeriesString]
@nProjectsID INT NULL=0, @cName NVARCHAR (MAX) NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.batterySeriesString (nProjectsID, cName, bDeleted)
    VALUES                              (@nProjectsID, @cName, 0);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertDemandItem]
@nProjectsID INT NULL=0, @cDesc NVARCHAR (MAX) NULL, @nQty INT NULL, @nHours DECIMAL (20, 6) NULL, @nPowerW DECIMAL (20, 6) NULL, @cNote NVARCHAR (MAX) NULL, @nOnOffFactor DECIMAL (20, 6) NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.demandItems (nProjectsID, cDesc, nQty, nHours, nPowerW, cNote, nOnOffFactor, bDeleted)
    VALUES                      (@nProjectsID, @cDesc, @nQty, @nHours, @nPowerW, @cNote, @nOnOffFactor, 0);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertProject]
@nUserID INT NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.projects (nUsersID, cName, nChosenInsolation, cChosenTilt, nMPPTFactor, nBatteryEfficiency, nInverterDerate, nColdestAirTempC, nMDoD, nDaysAutonomy, nVoltage, nControllerEfficiency, nTDR, nReflectance)
    VALUES                   (@nUserID, 'New Project', 2, 'Latitude', 1, .80, .75, 0, .60, 4, 48, .98, .80, .1);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertPV]
@nProjectsID INT NULL=0, @cModel NVARCHAR (MAX) NULL, @cBrand NVARCHAR (MAX) NULL, @nPmax DECIMAL (20, 6) NULL, @nVmp DECIMAL (20, 6) NULL, @nImp DECIMAL (20, 6) NULL, @nVoc DECIMAL (20, 6) NULL, @nIsc DECIMAL (20, 6) NULL, @nWeight_kg DECIMAL (20, 6) NULL, @nLength_mm DECIMAL (20, 6) NULL, @nHeight_mm DECIMAL (20, 6) NULL, @nWidth_mm DECIMAL (20, 6) NULL, @cFrame NVARCHAR (MAX) NULL, @cVendor NVARCHAR (MAX) NULL, @nPrice DECIMAL (20, 6) NULL, @nTilt_deg DECIMAL (20, 6) NULL, @nOrientation_deg DECIMAL (20, 6) NULL, @cURL NVARCHAR (MAX) NULL, @nQty INT NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO dbo.PV (nProjectsID, cModel, cBrand, nPmax, nVmp, nImp, nVoc, nIsc, nWeight_kg, nLength_mm, nHeight_mm, nWidth_mm, cFrame, cVendor, nPrice, nTilt_deg, nOrientation_deg, cURL, nQty, bDeleted)
    VALUES             (@nProjectsID, @cModel, @cBrand, @nPmax, @nVmp, @nImp, @nVoc, @nIsc, @nWeight_kg, @nLength_mm, @nHeight_mm, @nWidth_mm, @cFrame, @cVendor, @nPrice, @nTilt_deg, @nOrientation_deg, @cURL, @nQty, 0);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_insertPVMaster]
@cModel NVARCHAR (MAX) NULL, @cBrand NVARCHAR (MAX) NULL, @nPmax DECIMAL (20, 6) NULL, @nVmp DECIMAL (20, 6) NULL, @nImp DECIMAL (20, 6) NULL, @nVoc DECIMAL (20, 6) NULL, @nIsc DECIMAL (20, 6) NULL, @nWeight_kg DECIMAL (20, 6) NULL, @nLength_mm DECIMAL (20, 6) NULL, @nHeight_mm DECIMAL (20, 6) NULL, @nWidth_mm DECIMAL (20, 6) NULL, @cFrame NVARCHAR (MAX) NULL, @cVendor NVARCHAR (MAX) NULL, @nPrice DECIMAL (20, 6) NULL, @nPriority DECIMAL (20, 6) NULL, @cURL NVARCHAR (MAX) NULL, @transactIdentity INT NULL OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT  INTO [Net-Zero].dbo.PVMaster (cModel, cBrand, nPmax, nVmp, nImp, nVoc, nIsc, nWeight_kg, nLength_mm, nHeight_mm, nWidth_mm, cFrame, cVendor, nPrice, cURL, bDeleted, nPriority)
    VALUES                              (@cModel, @cBrand, @nPmax, @nVmp, @nImp, @nVoc, @nIsc, @nWeight_kg, @nLength_mm, @nHeight_mm, @nWidth_mm, @cFrame, @cVendor, @nPrice, @cURL, 0, @nPriority);
    SELECT @transactIdentity = SCOPE_IDENTITY();
END

GO
CREATE PROCEDURE [dbo].[USP_updateBattery]
@nBatterySeriesStringID INT NULL=0, @nID INT NULL=0, @nPrice DECIMAL (16, 4) NULL=0, @nQty INT NULL=0, @cNote VARCHAR (MAX) NULL='', @cBrand VARCHAR (MAX) NULL='', @bDeleted BIT NULL, @cModel VARCHAR (MAX) NULL='', @nVolts DECIMAL (16, 4) NULL=0, @nCapacity_Ah DECIMAL (16, 4) NULL=0, @cVendor VARCHAR (MAX) NULL='', @cURL VARCHAR (MAX) NULL=''
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.battery
    SET    cModel                 = @cModel,
           cNote                  = @cNote,
           nQty                   = @nQty,
           nBatterySeriesStringID = @nBatterySeriesStringID,
           bDeleted               = @bDeleted,
           nPrice                 = @nPrice,
           cBrand                 = @cBrand,
           nVolts                 = @nVolts,
           nCapacity_Ah           = @nCapacity_Ah,
           cVendor                = @cVendor,
           cURL                   = @cURL
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[USP_updateBatteryMaster]
@nID INT NULL=0, @nPrice DECIMAL (16, 4) NULL=0, @cNote VARCHAR (MAX) NULL='', @cBrand VARCHAR (MAX) NULL='', @bDeleted BIT NULL, @cModel VARCHAR (MAX) NULL='', @nVolts DECIMAL (16, 4) NULL=0, @nCapacity_Ah DECIMAL (16, 4) NULL=0, @cVendor VARCHAR (MAX) NULL='', @cURL VARCHAR (MAX) NULL='', @nPriority DECIMAL (16, 4) NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.batteryMaster
    SET    cModel       = @cModel,
           cNote        = @cNote,
           bDeleted     = @bDeleted,
           nPrice       = @nPrice,
           cBrand       = @cBrand,
           nVolts       = @nVolts,
           nCapacity_Ah = @nCapacity_Ah,
           cVendor      = @cVendor,
           cURL         = @cURL,
           nPriority    = @nPriority
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[USP_updateBatterySeriesString]
@nProjectsID INT NULL=0, @nID INT NULL=0, @cName NVARCHAR (MAX) NULL='', @bDeleted BIT NULL, @cNote NVARCHAR (MAX) NULL=''
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.batterySeriesString
    SET    cName       = @cName,
           cNote       = @cNote,
           nProjectsID = @nProjectsID,
           bDeleted    = @bDeleted
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[USP_updateDemand]
@nProjectsID INT NULL=0, @nID INT NULL=0, @nOnOffFactor DECIMAL (16, 4) NULL=0, @nQty INT NULL=0, @cDesc VARCHAR (MAX) NULL='', @bDeleted BIT NULL, @nHours DECIMAL (16, 4) NULL=0, @nPowerW DECIMAL (16, 4) NULL=0, @cNote VARCHAR (MAX) NULL=''
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.demandItems
    SET    nProjectsID  = @nProjectsID,
           nOnOffFactor = @nOnOffFactor,
           nQty         = @nQty,
           cDesc        = @cDesc,
           bDeleted     = @bDeleted,
           nHours       = @nHours,
           nPowerW      = @nPowerW,
           cNote        = @cNote
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[USP_updatePV]
@nID INT NULL, @nProjectsID INT NULL=0, @cModel NVARCHAR (MAX) NULL, @cBrand NVARCHAR (MAX) NULL, @nPmax DECIMAL (20, 6) NULL, @nVmp DECIMAL (20, 6) NULL, @nImp DECIMAL (20, 6) NULL, @nVoc DECIMAL (20, 6) NULL, @nIsc DECIMAL (20, 6) NULL, @nWeight_kg DECIMAL (20, 6) NULL, @nLength_mm DECIMAL (20, 6) NULL, @nHeight_mm DECIMAL (20, 6) NULL, @nWidth_mm DECIMAL (20, 6) NULL, @cFrame NVARCHAR (MAX) NULL, @cVendor NVARCHAR (MAX) NULL, @nPrice DECIMAL (20, 6) NULL, @nTilt_deg DECIMAL (20, 6) NULL, @nOrientation_deg DECIMAL (20, 6) NULL, @cURL NVARCHAR (MAX) NULL, @nQty INT NULL, @bDeleted BIT NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.PV
    SET    nProjectsID      = nProjectsID,
           cModel           = @cModel,
           cBrand           = @cBrand,
           nPmax            = @nPmax,
           nVmp             = @nVmp,
           nImp             = @nImp,
           nVoc             = @nVoc,
           nIsc             = @nIsc,
           nWeight_kg       = @nWeight_kg,
           nLength_mm       = @nLength_mm,
           nHeight_mm       = @nHeight_mm,
           nWidth_mm        = @nWidth_mm,
           cFrame           = @cFrame,
           cVendor          = @cVendor,
           nPrice           = @nPrice,
           nTilt_deg        = @nTilt_deg,
           nOrientation_deg = @nOrientation_deg,
           cURL             = @cURL,
           nQty             = @nQty,
           bDeleted         = @bDeleted
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[USP_updatePVMaster]
@nID INT NULL, @cModel NVARCHAR (MAX) NULL, @cBrand NVARCHAR (MAX) NULL, @nPmax DECIMAL (20, 6) NULL, @nVmp DECIMAL (20, 6) NULL, @nImp DECIMAL (20, 6) NULL, @nVoc DECIMAL (20, 6) NULL, @nIsc DECIMAL (20, 6) NULL, @nWeight_kg DECIMAL (20, 6) NULL, @nLength_mm DECIMAL (20, 6) NULL, @nHeight_mm DECIMAL (20, 6) NULL, @nWidth_mm DECIMAL (20, 6) NULL, @cFrame NVARCHAR (MAX) NULL, @cVendor NVARCHAR (MAX) NULL, @nPrice DECIMAL (20, 6) NULL, @nPriority DECIMAL (20, 6) NULL, @cURL NVARCHAR (MAX) NULL, @bDeleted BIT NULL
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.PVMaster
    SET    cModel     = @cModel,
           cBrand     = @cBrand,
           nPmax      = @nPmax,
           nVmp       = @nVmp,
           nImp       = @nImp,
           nVoc       = @nVoc,
           nIsc       = @nIsc,
           nWeight_kg = @nWeight_kg,
           nLength_mm = @nLength_mm,
           nHeight_mm = @nHeight_mm,
           nWidth_mm  = @nWidth_mm,
           cFrame     = @cFrame,
           cVendor    = @cVendor,
           nPrice     = @nPrice,
           nPriority  = @nPriority,
           cURL       = @cURL,
           bDeleted   = @bDeleted
    WHERE  nID = @nID;
END

GO
CREATE PROCEDURE [dbo].[UTIL_pivot]
AS
BEGIN
    DECLARE @LoopCounter AS INT, @MaxEmployeeId AS INT, @EmployeeName AS NVARCHAR (100);
    SELECT @LoopCounter = min(nID),
           @MaxEmployeeId = max(nID)
    FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL];
    WHILE (@LoopCounter IS NOT NULL
           AND @LoopCounter <= @MaxEmployeeId)
        BEGIN
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1970',
                          b.n1970
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1971',
                          b.n1971
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1972',
                          b.n1972
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1973',
                          b.n1973
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1974',
                          b.n1974
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1975',
                          b.n1975
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1976',
                          b.n1976
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1977',
                          b.n1977
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1978',
                          b.n1978
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1979',
                          b.n1979
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1980',
                          b.n1980
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1981',
                          b.n1981
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1982',
                          b.n1982
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1983',
                          b.n1983
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1984',
                          b.n1984
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1985',
                          b.n1985
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1986',
                          b.n1986
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1987',
                          b.n1987
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1988',
                          b.n1988
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1989',
                          b.n1989
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1990',
                          b.n1990
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1991',
                          b.n1991
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1992',
                          b.n1992
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1993',
                          b.n1993
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1994',
                          b.n1994
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1995',
                          b.n1995
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1996',
                          b.n1996
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1997',
                          b.n1997
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1998',
                          b.n1998
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '1999',
                          b.n1999
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2000',
                          b.n2000
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2001',
                          b.n2001
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2002',
                          b.n2002
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2003',
                          b.n2003
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2004',
                          b.n2004
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2005',
                          b.n2005
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2006',
                          b.n2006
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2007',
                          b.n2007
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2008',
                          b.n2008
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2009',
                          b.n2009
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2010',
                          b.n2010
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2011',
                          b.n2011
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2012',
                          b.n2012
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2013',
                          b.n2013
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2014',
                          b.n2014
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2015',
                          b.n2015
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            INSERT INTO [DB_80510_netzero].[dbo].edgarPivot (nEdgarID, dtYear, nCO2)
            (SELECT TOP 1 b.nID,
                          '2016',
                          b.n2016
             FROM   [DB_80510_netzero].[dbo].[EDGAR_to_SQL] AS b
             WHERE  b.nID = @LoopCounter);
            SET @LoopCounter = @LoopCounter + 1;
        END
END

GO
CREATE PROCEDURE [dbo].[UTILITY_latlong]
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE z
    SET    nLat         = (SELECT TOP 1 b.latitude
                           FROM   dbo.ca_cities AS b
                           WHERE  z.cName = b.name
                                  AND x.cName LIKE '%' + b.province + '%'),
           nLong        = (SELECT TOP 1 b.longitude
                           FROM   dbo.ca_cities AS b
                           WHERE  z.cName = b.name
                                  AND x.cName LIKE '%' + b.province + '%'),
           nCa_citiesID = (SELECT TOP 1 b.id
                           FROM   dbo.ca_cities AS b
                           WHERE  z.cName = b.name
                                  AND x.cName LIKE '%' + b.province + '%')
    FROM   dbo.city AS z
           INNER JOIN
           dbo.stateProvince AS x
           ON z.nStateProvinceID = x.nID;
END

GO
CREATE PROCEDURE [dbo].[UTILITYCOPYSTATES]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.stateProvince (nCountryID, cName)
    SELECT   1040,
             Province
    FROM     dbo.city_kWh
    GROUP BY Province;
END

GO
CREATE PROCEDURE [dbo].[UTILITYInsertInsolation]
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO dbo.insolation (nCityID, nMonth, nTilt90, nTiltLat, nTiltLatPlus15, nTiltLatMinus15, nTilt0, n2Axis)
    SELECT (SELECT nID
            FROM   dbo.city AS c
            WHERE  c.cName = b.Municipality),
           CASE b.month WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 WHEN 'April' THEN 4 WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'July' THEN 7 WHEN 'August' THEN 8 WHEN 'September' THEN 9 WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12 ELSE 0 END,
           b.[90deg],
           b.lat,
           b.latPlus15,
           b.latMinus15,
           b.[0deg],
           b.[2Axis]
    FROM   dbo.city_kWh AS b;
END

GO
CREATE PROCEDURE [dbo].[UTILITYUPDATECITY]
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET    nStateProvinceID = (SELECT TOP 1 nID
                               FROM   dbo.stateProvince AS b
                                      INNER JOIN
                                      dbo.city_kWh AS c
                                      ON c.Province = b.cName
                               WHERE  a.cName = c.Municipality)
    FROM   dbo.city AS a;
END

GO
