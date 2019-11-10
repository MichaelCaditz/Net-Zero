-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateTMY]
	--@projectsID int,
	--@beginDate datetime,
	--@endDate datetime,
	--@nMetricsResolution int,
	--@nMetricsHour int
	--@nMetricsHour int

	@TMYFilename varchar(5000)
AS
BEGIN
	
/****** Object:  Table [dbo].[TMYStaged]    Script Date: 2019-09-09 10:26:18 AM ******/
DECLARE @FlatFile sysname ='"'+@TMYFilename+'"'

declare @strippedFileName varchar(4000) = trim('.csv' from right(@TMYFilename,CHARINDEX('\',REVERSE(@TMYFilename)) -1))
DECLARE @TableName sysname = '[dbo].['+@strippedFileName+']'
DECLARE @TableNameStaged sysname ='[dbo].['+@strippedFileName+'_Staged]'
declare @constraint sysname ='PK_'+@strippedFileName
declare @index sysname ='IX_'+@strippedFileName
declare @constraint_dtDate sysname ='DF_'+@strippedFileName+'_dtCreateDate'


--DECLARE @TableNameStaged sysname ='[dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy_Staged]'
--DECLARE @FlatFile sysname ='''C:\Users\michael.MICHAELCADITZ\OneDrive\Net-Zero\TMY\53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy.csv'''
--DECLARE @TableName sysname ='[dbo].[53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy]'
--declare @constraint sysname = 'Constraint_53.2530_-131.817200_53.252796_-131.817369_psmv3_60_tmy'

IF OBJECT_ID(@TableNameStaged, 'U') IS NOT NULL 
  exec ('DROP TABLE' + @TableNameStaged); 

  declare @sql1 NVARCHAR(4000) =



'CREATE TABLE' + @TableNameStaged + '
	(
	[Year] int NULL,
	[Month] int NULL,
	[Day] int NULL,
	[Hour] int NULL,
	[Minute] int NULL,
	[DNI] int NULL,
	[DHI] int NULL,
	[GHI] int NULL,
	[Dew_Point] decimal(18,4) NULL,
	[Temperature] decimal(18,4) NULL,
	[Pressure] decimal(18,4) NULL,
	[Wind_Direction] decimal(18,4) NULL,
	[Wind_Speed] decimal(18,4) NULL,
	[Surface_Albedo] decimal(18,4) NULL

	)'
	
	
	exec(@sql1)




	DECLARE @sql2 NVARCHAR(4000) = 'BULK INSERT' + @TableNameStaged+
	'FROM '+ @FlatFile
	+ 'WITH (
		FIELDTERMINATOR = '','',
		ROWTERMINATOR = ''\r'',
		firstrow=2,
		 lastrow=8761
	  );';
	 
EXEC(@sql2);





  IF OBJECT_ID(@TableName, 'U') IS NOT NULL 
  exec ('DROP TABLE' + @TableName); 

 

 declare @sql3 NVARCHAR(4000) =


'CREATE TABLE' + @TableName + '
	(
	[nID] [int] IDENTITY(1000,1) NOT NULL,
	[dtCreateDate] [datetime2](7) NULL,
	[nYear] [int] NULL,
	[nMonth] [int] NULL,
	[nDay] [int] NULL,
	[nHour] [int] NULL,
	[nMinute] [int] NULL,
	[nDNI] [int] NULL,
	[nDHI] [int] NULL,
	[nGHI] [int] NULL,
	[nDew_Point] [decimal](18, 4) NULL,
	[nTemperature] [decimal](18, 4) NULL,
	[nPressure] [decimal](18, 4) NULL,
	[nWind_Direction] [decimal](18, 4) NULL,
	[nWind_Speed] [decimal](18, 4) NULL,
	[nSurface_Albedo] [decimal](18, 4) NULL,
	[dtDate] [datetime2](7) NULL,
 CONSTRAINT ['+@constraint+'] PRIMARY KEY CLUSTERED 
(
	[nID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]'
	

	EXEC(@sql3);


	


	 declare @sql4 NVARCHAR(4000) =

'CREATE UNIQUE NONCLUSTERED INDEX [' + @index+ '] ON ' + @TableName +
'([dtDate] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]'

EXEC(@sql4);

declare @sql5 NVARCHAR(4000) =

'ALTER TABLE' + @TableName + ' ADD  CONSTRAINT [' + @constraint_dtDate + ']  DEFAULT (getdate()) FOR [dtCreateDate]'

EXEC(@sql5);

declare @sql6 VARCHAR(4000) =

'insert into '+@TableName +' (nYear,nMonth, nDay,nHour,nMinute,nDHI,nDNI,nGHI,nDew_Point,nTemperature,nPressure,nWind_Direction,nWind_Speed,nSurface_Albedo,dtDate)
--select top 1 cast(convert(numeric,Year) as int), cast(convert(numeric,Month) as int)
select  Year , Month , Day, Hour, Minute,DHI,DNI,GHI,Dew_Point,Temperature,Pressure,Wind_Direction,Wind_Speed,Surface_Albedo,DATETIMEFROMPARTS ( Year, Month, Day, Hour, Minute,0,0 ) 
from '+@TableNameStaged 

exec (@sql6)
END
