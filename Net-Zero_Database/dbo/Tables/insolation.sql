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

