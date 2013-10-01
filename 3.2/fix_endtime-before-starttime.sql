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
SELECT	t1.ID ActivityId, 
		[rdowner].AddTimeAndDayToDate(t1.StartTime,t1.DayIndex,t3.WeekStartDate) StartDateTime,
		[rdowner].AddTimeAndDayToDate(t1.EndTime,
			CASE 
				WHEN ((DATEPART(HH,t1.EndTime)) = 0 AND (DATEPART(MI, t1.EndTime)) = 0) 
					THEN (t1.DayIndex + 1) 
					ELSE t1.DayIndex 
				END
		,t3.WeekStartDate) EndDateTime,
		t1.DayIndex Day,
		t2.Week,
		tr.[DateTime] as [LastChanged] 
FROM  rdowner.ACTIVITYPERIODTIMES as t1 
INNER JOIN rdowner.ACTIVITY_SCHEDULEDWEEKS t2 
	ON t1.ID = t2.ActivityId 
INNER JOIN rdowner.WEEK_LABELS t3
	ON t2.Week = t3.WeekNumber
INNER JOIN rdowner.SD_Transaction tr 
	ON tr.TransNum = t1.LatestTransaction
	
GO
