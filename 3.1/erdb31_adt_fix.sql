-------------------------------------------------------------
-- Fix for ERDB 3.1.x to include the last activitydatetime
-- Scientia bug references 20227 and 21127
-------------------------------------------------------------
-- Replace [STAGINGDB] with the name of your staging DB
-- and run the script on the RDB
-------------------------------------------------------------

ALTER function [rdowner].[getdatetimes]()
RETURNS @MyOutputTable TABLE (ID CHAR(32), Occurance INT, StartDateTime DATETIME, EndDateTime DATETIME, Week TINYINT) 
AS
BEGIN
DECLARE @maxPK INT;
DECLARE @pk INT;
DECLARE @v_startDate DATETIME;
DECLARE @v_periodPerDay INT;
DECLARE @v_periodLength INT;
DECLARE @v_prevPeriod INT;
DECLARE @v_currPeriod INT;
DECLARE @v_startTime DATETIME;
DECLARE @v_endTime DATETIME;
DECLARE @v_prevWeek INT;
DECLARE @v_currWeek INT;
DECLARE @v_prevActivity CHAR(32);
DECLARE @v_currActivity CHAR(32);
DECLARE @v_notFirstActivity BIT;
DECLARE @v_Duration INT;
DECLARE @v_shouldAddRow BIT;

DECLARE c1 CURSOR READ_ONLY
FOR
SELECT ActivityId, Week, Period
FROM RDOWNER.ACTIVITIESSCHEDULE
ORDER BY ActivityId, Week, Period

SELECT   @v_startDate = DATEADD(ss, DATEPART(ss, starttime), DATEADD(mi, DATEPART(mi, starttime), DATEADD(hh, DATEPART(hh, starttime), startdate))) FROM rdowner.globals;
SELECT   @v_periodPerDay = PeriodsPerDay FROM rdowner.globals;
SELECT   @v_periodLength = PeriodLength FROM rdowner.globals;

OPEN C1

FETCH NEXT FROM C1
INTO @v_currActivity, @v_currWeek, @v_currPeriod

WHILE @@FETCH_STATUS =0 
BEGIN
 --One row
 SET @v_shouldAddRow = 0;
 IF @v_notFirstActivity = 1
 BEGIN
                IF @v_prevActivity <> @v_currActivity
                BEGIN
                  SET @v_shouldAddRow = 1;
                END
                IF ROUND(@v_prevPeriod/@v_PeriodPerDay, 0, 1) < ROUND(@v_currPeriod/@v_PeriodPerDay, 0, 1)
    BEGIN
      SET @v_shouldAddRow = 1;
    END
    IF @v_currWeek>@v_prevWeek
    BEGIN
                  SET @v_shouldAddRow = 1;
                END
 END
 
 IF @v_shouldAddRow = 1
 BEGIN
   INSERT INTO @MyOutputTable
   SELECT @v_prevActivity, 1, @v_startTime, @v_endTime, @v_prevWeek
   SET @v_startTime = NULL;
   SET @v_endTime = NULL;
 END
 
 IF @v_startTime IS NULL
 BEGIN
   SET @v_startTime = DATEADD(mi, (@v_currPeriod%@v_periodPerDay) * @v_PeriodLength, DATEADD(dd, ROUND(@v_currPeriod/@v_periodPerDay,0,1), DATEADD(wk, @v_currWeek, @v_startDate)))
   SELECT @v_Duration = (sdvca.Duration * @v_periodLength) FROM [STAGINGDB].rdowner.sdvc_activity sdvca  WHERE sdvca.Id = @v_currActivity;
   SET @v_endTime = DATEADD(mi, @v_Duration, @v_startTime);
 END
 
 SET @v_prevPeriod = @v_currPeriod;
 SET @v_prevActivity = @v_currActivity;
 SET @v_prevWeek = @v_currWeek;
 SET @v_notFirstActivity = 1;
 
 FETCH NEXT FROM C1
 INTO @v_currActivity, @v_currWeek, @v_currPeriod   
END

IF @v_notFirstActivity = 1
BEGIN
  INSERT INTO @MyOutputTable
   SELECT @v_prevActivity, 1, @v_startTime, @v_endTime, @v_prevWeek
   SET @v_startTime = NULL;
   SET @v_endTime = NULL;
END

CLOSE C1
DEALLOCATE C1
RETURN
END;
GO



