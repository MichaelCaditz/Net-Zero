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

