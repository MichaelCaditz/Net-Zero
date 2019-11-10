CREATE TABLE [dbo].[battery] (
    [nID]                    INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]           DATETIME2 (7)   CONSTRAINT [DF_battery_dtCreateDate] DEFAULT (getdate()) NULL,
    [nBatterySeriesStringID] INT             NULL,
    [cModel]                 NVARCHAR (50)   NULL,
    [cBrand]                 NVARCHAR (50)   NULL,
    [nCapacity_Ah]           DECIMAL (18, 6) NULL,
    [cVendor]                NVARCHAR (50)   NULL,
    [nPrice]                 MONEY           NULL,
    [nQty]                   INT             NULL,
    [cURL]                   NVARCHAR (MAX)  NULL,
    [nVolts]                 DECIMAL (18, 6) NULL,
    [bDeleted]               BIT             NULL,
    [dtDateDeleted]          DATETIME2 (7)   NULL,
    [cNote]                  NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_battery] PRIMARY KEY CLUSTERED ([nID] ASC)
);

