-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getEDGAR_to_SQL_grouped]
	-- Add the parameters for the stored procedure here
	
	--@projectsID int

AS
BEGIN



	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--a.cNameFirst,a.cNameLast,
	
	 SELECT a.cISO_Name,a.cISO_CODE,b.Score2014_2015,

	 sum(a.n1970) as n1970 ,
	  sum(a.n1971) as n1971 ,
	   sum(a.n1972) as n1972 ,
	    sum(a.n1973) as n1973 ,
		 sum(a.n1974) as n1974 ,
		  sum(a.n1975) as n1975 ,
		   sum(a.n1976) as n1976 ,
		    sum(a.n1977) as n1977 ,
			 sum(a.n1978) as n1978 ,
			  sum(a.n1979) as n1979 ,
			   sum(a.n1980) as n1980 ,
			    sum(a.n1981) as n1981 ,
				sum(a.n1982) as n1982 ,
				sum(a.n1983) as n1983 ,
				sum(a.n1984) as n1984 ,
				sum(a.n1985) as n1985 ,
				sum(a.n1986) as n1986 ,
				sum(a.n1987) as n1987 ,
				sum(a.n1988) as n1988 ,
				sum(a.n1989) as n1989 ,
				sum(a.n1990) as n1990 ,
				sum(a.n1991) as n1991 ,
				sum(a.n1992) as n1992 ,
				sum(a.n1993) as n1993 ,
				sum(a.n1994) as n1994 ,
				sum(a.n1995) as n1995 ,
				sum(a.n1996) as n1996 ,
				sum(a.n1997) as n1997 ,
				sum(a.n1998) as n1998 ,
				sum(a.n1999) as n1999 ,
				sum(a.n2000) as n2000 ,
				sum(a.n2001) as n2001 ,
				sum(a.n2002) as n2002 ,
				sum(a.n2003) as n2003 ,
				sum(a.n2004) as n2004 ,
				sum(a.n2005) as n2005 ,
				sum(a.n2006) as n2006 ,
				sum(a.n2007) as n2007 ,
				sum(a.n2008) as n2008 ,
				sum(a.n2009) as n2009 ,
				sum(a.n2010) as n2010 ,
				sum(a.n2011) as n2011 ,
				sum(a.n2012) as n2012 ,
				sum(a.n2013) as n2013 ,
				sum(a.n2014) as n2014 ,
				sum(a.n2015) as n2015 ,
				sum(a.n2016) as n2016 
				

	 FROM [dbo].EDGAR_to_SQL a  WITH (NOLOCK) left join dbo.democracyImport b on a.cISO_Name = b.Country
	 
	group by cISO_Name,cISO_CODE,b.Score2014_2015
	

	order by cISO_Name

	
END
