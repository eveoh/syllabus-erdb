-- The EndDate of activities is calculated incorrectly when the activity runs until the end of the day (24:00), 
-- the date will then be set to 0:00 the same day, effectively putting the EndDate before the StartDate.
-- 
-- Compensate for this behaviour by adding one day to the DayNumber of the end date when the end time is 0:00.
--
-- This method also uses t3.DayNumber when calculating the end time, instead of using t2.DayNymber (which is
-- the day number of the *start* time).

USE [xxx]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [rdowner].[V_ACTIVITY_DATETIME]
AS
SELECT 
t1.ActivityID,
rdowner.AddTimeAndDayToDate(t2.StartTime,t2.DayNumber,t5.WeekStartDate) StartDateTime,
rdowner.AddTimeAndDayToDate(t3.EndTime, 
	CASE 
		WHEN ((DATEPART(HH,t3.EndTime)) = 0 AND (DATEPART(MI, t3.EndTime)) = 0) 
			THEN (t3.DayNumber + 1) 
			ELSE t3.DayNumber 
		END
,t5.WeekStartDate) EndDateTime,
t2.DayNumber Day,
t4.Week Week,
DENSE_RANK() OVER (PARTITION BY t1.ActivityId ORDER BY rdowner.AddTimeAndDayToDate(t2.StartTime,t2.DayNumber,t5.WeekStartDate)) Occurrence,
tr.DateTime LastChanged
FROM(
SELECT ActivityID
      ,Max(Period) MaxPeriod
      ,Min(Period) MinPeriod
      ,Max(LatestTransaction) LatestTransaction
      ,PeriodIndex
  FROM rdowner.ACTIVITY_SCHEDULEDPERIODS
  GROUP BY ActivityId, PeriodIndex) t1
  INNER JOIN rdowner.PERIODSTARTTIMES t2 
  ON t1.MinPeriod = t2.PeriodIndex
 INNER JOIN rdowner.PERIODSTARTTIMES t3 
  ON t1.MaxPeriod = t3.PeriodIndex
INNER JOIN rdowner.ACTIVITY_SCHEDULEDWEEKS t4 
	ON t1.ActivityID = t4.ActivityId 
INNER JOIN rdowner.WEEK_LABELS t5
	ON t4.Week = t5.WeekNumber
INNER JOIN rdowner.SD_Transaction tr 
	ON tr.TransNum = t1.LatestTransaction

GO
