CREATE TABLE [dbo].[role] (
    [nID]          INT            IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate] DATETIME2 (7)  CONSTRAINT [DF_role_dtCreateDate] DEFAULT (getdate()) NULL,
    [cName]        NVARCHAR (50)  NULL,
    [cNote]        NVARCHAR (MAX) NULL,
    [bDeleted]     BIT            NULL,
    CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED ([nID] ASC)
);

