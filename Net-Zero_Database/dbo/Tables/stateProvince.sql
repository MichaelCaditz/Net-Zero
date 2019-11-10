CREATE TABLE [dbo].[stateProvince] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [nCountryID]   INT            NULL,
    [cName]        NVARCHAR (50)  NULL,
    [dtCreateDate] DATETIME2 (7)  NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    [bDeleted]     BIT            NULL,
    CONSTRAINT [PK_stateProvince] PRIMARY KEY CLUSTERED ([nID] ASC)
);

