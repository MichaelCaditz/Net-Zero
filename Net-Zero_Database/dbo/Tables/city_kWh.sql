CREATE TABLE [dbo].[city_kWh] (
    [Province]     NVARCHAR (100)  NULL,
    [Municipality] NVARCHAR (100)  NULL,
    [month]        NVARCHAR (50)   NULL,
    [90deg]        NUMERIC (18, 4) NULL,
    [lat]          NUMERIC (18, 4) NULL,
    [latPlus15]    NUMERIC (18, 4) NULL,
    [latMinus15]   NUMERIC (18, 4) NULL,
    [2Axis]        NUMERIC (18, 4) NULL,
    [0deg]         NUMERIC (18, 4) NULL
);

