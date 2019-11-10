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

