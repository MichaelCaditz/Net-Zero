CREATE TABLE [dbo].[ca_cities] (
    [id]              INT            NOT NULL,
    [name]            VARCHAR (73)   NULL,
    [county]          VARCHAR (36)   NULL,
    [province]        VARCHAR (25)   NULL,
    [province_code]   VARCHAR (2)    NULL,
    [postcode_area]   VARCHAR (3)    NULL,
    [type]            VARCHAR (12)   NULL,
    [map_reference]   VARCHAR (6)    NULL,
    [latitude]        NUMERIC (8, 5) NULL,
    [longitude]       NUMERIC (8, 5) NULL,
    [census_division] VARCHAR (36)   NULL,
    [area_code]       VARCHAR (3)    NULL,
    [time_zone]       VARCHAR (21)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

