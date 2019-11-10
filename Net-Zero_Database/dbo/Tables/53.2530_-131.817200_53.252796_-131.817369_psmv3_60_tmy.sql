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
CREATE UNIQUE NONCLUSTERED INDEX [IX_53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy]
    ON [dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy]([dtDate] ASC);

