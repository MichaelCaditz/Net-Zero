﻿CREATE TABLE [dbo].[PV] (
    [nID]              INT             IDENTITY (1000, 1) NOT NULL,
    [dtCreateDate]     DATETIME2 (7)   CONSTRAINT [DF_PV_dtCreateDate] DEFAULT (getdate()) NULL,
    [cModel]           NVARCHAR (50)   NULL,
    [cBrand]           NVARCHAR (50)   NULL,
    [nPmax]            DECIMAL (18, 4) NULL,
    [nVmp]             DECIMAL (18, 4) NULL,
    [nImp]             DECIMAL (18, 4) NULL,
    [nVoc]             DECIMAL (18, 4) NULL,
    [nIsc]             DECIMAL (18, 4) NULL,
    [nWeight_kg]       DECIMAL (18, 4) NULL,
    [nLength_mm]       DECIMAL (18, 4) NULL,
    [nWidth_mm]        DECIMAL (18, 4) NULL,
    [nHeight_mm]       DECIMAL (18, 4) NULL,
    [cFrame]           NVARCHAR (50)   NULL,
    [cVendor]          NVARCHAR (50)   NULL,
    [nPrice]           MONEY           NULL,
    [nTilt_deg]        DECIMAL (18, 4) NULL,
    [nOrientation_deg] DECIMAL (18, 4) NULL,
    [cURL]             NVARCHAR (MAX)  NULL,
    [nQty]             INT             NULL,
    [bDeleted]         BIT             NULL,
    [nProjectsID]      INT             NULL,
    [dtDateDeleted]    DATETIME2 (7)   NULL,
    CONSTRAINT [PK_PV] PRIMARY KEY CLUSTERED ([nID] ASC)
);

