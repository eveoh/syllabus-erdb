-- Activity lookup on usertext2
-- This is only useful for Web Room Booking timetables based on activities with the username in usertext2.
CREATE NONCLUSTERED INDEX [activity_usertext2] ON [rdowner].[ACTIVITY] ([USER_TEXT_2])
