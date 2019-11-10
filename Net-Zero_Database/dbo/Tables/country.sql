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

