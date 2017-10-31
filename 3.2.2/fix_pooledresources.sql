-- Fixes the values in V_ACTIVITY_POOLEDRESOURCE
-- By default these are split incorrectly, leading to incorrect id's for all resources after the first

CREATE FUNCTION [dbo].[ufnSplitPooledResourceIDs](@allocString nvarchar(1800))
RETURNS @returnValues TABLE 
(
    PooledResourceID char(32)
)
AS 
BEGIN
	DECLARE @i int = 52;
	DECLARE @allocLength int = LEN(@allocString);

	WHILE @i <= @allocLength
	BEGIN
	    INSERT @returnValues
		SELECT SUBSTRING(@allocString, @i - 31, 32) AS PooledResourceID;
		SET @i = @i + 48;
	END;
    RETURN;
END;

GO

ALTER VIEW [rdowner].[V_ACTIVITY_POOLEDRESOURCE]
AS
SELECT	a.Id ActivityId,
		pr.PooledResourceID,
		0 AS Quantity,
		tr.[DateTime] as [LastChanged] 
FROM rdowner.ACTIVITY as a
INNER JOIN rdowner.SD_Transaction tr ON tr.TransNum = a.LatestTransaction
CROSS APPLY [dbo].[ufnSplitPooledResourceIDs](a.ALLC_POOLED_RSRC) pr
WHERE a.ALLC_POOLED_RSRC <> '0000' 

GO

