-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UTIL_pivot]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	DECLARE @LoopCounter INT , @MaxEmployeeId INT, 
        @EmployeeName NVARCHAR(100)
SELECT @LoopCounter = min(nID) , @MaxEmployeeId = max(nID) 
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL]
 
WHILE(@LoopCounter IS NOT NULL
      AND @LoopCounter <= @MaxEmployeeId)
BEGIN


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1970',
b.n1970
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1971',
b.n1971
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1972',
b.n1972
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1973',
b.n1973
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1974',
b.n1974
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1975',
b.n1975
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1976',
b.n1976
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1977',
b.n1977
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1978',
b.n1978
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1979',
b.n1979
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1980',
b.n1980
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1981',
b.n1981
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1982',
b.n1982
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1983',
b.n1983
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1984',
b.n1984
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1985',
b.n1985
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1986',
b.n1986
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1987',
b.n1987
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1988',
b.n1988
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1989',
b.n1989
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1990',
b.n1990
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1991',
b.n1991
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)



insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1992',
b.n1992
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)



insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1993',
b.n1993
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1994',
b.n1994
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1995',
b.n1995
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1996',
b.n1996
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1997',
b.n1997
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)



insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1998',
b.n1998
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'1999',
b.n1999
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2000',
b.n2000
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)



insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2001',
b.n2001
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2002',
b.n2002
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2003',
b.n2003
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2004',
b.n2004
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2005',
b.n2005
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2006',
b.n2006
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2007',
b.n2007
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2008',
b.n2008
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2009',
b.n2009
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2010',
b.n2010
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2011',
b.n2011
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2012',
b.n2012
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2013',
b.n2013
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2014',
b.n2014
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)


insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2015',
b.n2015
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)

insert into  [DB_80510_netzero].[dbo].edgarPivot
(
nEdgarID,
dtYear,
nCO2
)
(select top 1
b.nID,
'2016',
b.n2016
FROM [DB_80510_netzero].[dbo].[EDGAR_to_SQL] b
WHERE b.nID = @LoopCounter)





















 
   SET @LoopCounter  = @LoopCounter  + 1        
END
END
