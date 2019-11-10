CREATE TABLE [dbo].[batteryMaster] (
    [nID]           INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]  DATETIME2 (7)   CONSTRAINT [DF_batteryMaster_dtCreateDate] DEFAULT (getdate()) NULL,
    [cModel]        NVARCHAR (50)   NULL,
    [cBrand]        NVARCHAR (50)   NULL,
    [nCapacity_Ah]  DECIMAL (18, 6) NULL,
    [cVendor]       NVARCHAR (50)   NULL,
    [nPrice]        MONEY           NULL,
    [cURL]          NVARCHAR (MAX)  NULL,
    [nVolts]        DECIMAL (18, 6) NULL,
    [bDeleted]      BIT             NULL,
    [dtDateDeleted] DATETIME2 (7)   NULL,
    [cNote]         NVARCHAR (MAX)  NULL,
    [nPriority]     DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_batteryMaster] PRIMARY KEY CLUSTERED ([nID] ASC)
);

