-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_autoPV]
	-- Add the parameters for the stored procedure here
	@nProjectsID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	declare @nChosenPV decimal(16,4),
	@cChosenTilt varchar(max),
	@nUnitsNeeded decimal(16,4),

	@cModel nvarchar(max),
	@cBrand nvarchar(max),
	@nPmax decimal(20,6),
	@nVmp decimal(20,6),
	@nImp decimal(20,6),
	@nVoc decimal(20,6),
	@nIsc decimal(20,6),
	@nWeight_kg decimal(20,6),
	@nLength_mm decimal(20,6),
	@nHeight_mm decimal(20,6),
	@nWidth_mm decimal(20,6),
	@cFrame nvarchar(max),
	@cVendor nvarchar(max),
	@nPrice decimal(20,6),
	@nTilt_deg decimal(20,6),
	@nOrientation_deg decimal(20,6) = 180,
	@cURL nvarchar(max),
	@nQty int

	select top(1)
	@cModel=a.cModel,
	
	@cBrand =a.cBrand,
	@nPmax =a.nPmax,
	@nVmp =a.nVmp,
	@nImp =a.nImp,
	@nVoc =a.nVoc,
	@nIsc =a.nIsc,
	@nWeight_kg =a.nWeight_kg,
	@nLength_mm =a.nLength_mm,
	@nHeight_mm =a.nHeight_mm,
	@nWidth_mm =a.nWidth_mm,
	@cFrame =a.cFrame,
	@cVendor =a.cVendor,
	@nPrice =a.nPrice,
	
	@cURL =a.cURL
	
	
	
	 from  dbo.PVMaster a order by a.nPriority desc 


	select @nChosenPV =nChosenPV, @cChosenTilt=cChosenTilt from dbo.projects a where a.nID = @nProjectsID
	

	select @nTilt_deg=0
	--fill in code to get tilt degrees from latitude

	select @nUnitsNeeded = 
	
	case
	when @nPmax>0
	then (@nChosenPV*1000)/@nPmax
	else 0
	end

	select @nQty=CEILING(@nUnitsNeeded)

	insert into dbo.PV

	(
	nProjectsID,
	cModel,
	cBrand,
	nPmax,
	nVmp,
	nImp,
	nVoc,
	nIsc,
	nWeight_kg,
	nLength_mm,
	nHeight_mm,
	nWidth_mm,
	cFrame,
	cVendor,
	nPrice,
	nTilt_deg,
	nOrientation_deg,
	cURL,
	nQty,
	bDeleted

	
	)
	
	
	

	values (
	@nProjectsID,
	@cModel,
	@cBrand,
	@nPmax,
	@nVmp,
	@nImp,
	@nVoc,
	@nIsc,
	@nWeight_kg,
	@nLength_mm,
	@nHeight_mm,
	@nWidth_mm,
	@cFrame,
	@cVendor,
	@nPrice,
	@nTilt_deg,
	@nOrientation_deg,
	@cURL,
	@nQty,
	0
	

	)
--    close selectedPV
--deallocate selectedPV
	
END
