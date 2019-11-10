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

