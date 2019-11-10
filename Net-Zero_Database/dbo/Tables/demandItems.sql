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

