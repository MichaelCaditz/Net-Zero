CREATE TABLE [dbo].[edgarPivot] (
    [nID]      INT              IDENTITY (1000, 1) NOT NULL,
    [nEdgarID] INT              NULL,
    [dtYear]   DATETIME2 (7)    NULL,
    [nCO2]     DECIMAL (30, 12) NULL,
    CONSTRAINT [PK_edgarPivot] PRIMARY KEY CLUSTERED ([nID] ASC)
);

