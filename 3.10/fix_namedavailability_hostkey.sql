ALTER VIEW [rdowner].[V_NAMEDAVAILABILITY]
AS
SELECT 	t1.Id, 
		t1.HOST_KEY HostKey,
		t1.NAME Name, 
		t1.DESCRIPTION Description, 
		t1.WEEK_PATTERN AS WeekInYearPattern,
		t1.WeekPatternLabel,
		t1.User_Text_1 UserText1, 
		t1.User_Text_2 UserText2, 
		t1.User_Text_3 UserText3,
		t1.User_Text_4 UserText4, 
		t1.User_Text_5 UserText5,
		tr.[DateTime] as [LastChanged] FROM 
rdowner.NAMEDAVAILABILITIES as t1
INNER JOIN rdowner.SD_Transaction tr ON tr.TransNum = t1.LatestTransaction

GO
