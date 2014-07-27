-- Example indexes to add when using MyTimetable merge functionality
-- In this case, module/staff/studentset/location/zone timetables are in use
-- and merging is done using the name field of these timetables.

CREATE INDEX [module_name] ON [rdowner].[Module] ([Name])
CREATE INDEX [staff_name] ON [rdowner].[Staff] ([Name])
CREATE INDEX [studentsets_name] ON [rdowner].[StudentSets] ([Name])
CREATE INDEX [zones_name] ON [rdowner].[Zones] ([Name])
CREATE INDEX [locations_name] ON [rdowner].[Locations] ([Name])
CREATE INDEX [departments_name] ON [rdowner].[Departments] ([Name])
