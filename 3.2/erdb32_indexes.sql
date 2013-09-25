-- Group lookup and match indexes
create nonclustered index [group_id] on [rdowner].[group_relations] ([GROUPS], [id])
create nonclustered index [group_name_grouptype] on [rdowner].[groups] ([name], [grouptype]) include ([id])

-- Tag lookup and match indexes
create nonclustered index [tag_id] on [rdowner].[tag_relations] ([id], [tags])
create nonclustered index [tag_name] on [rdowner].[tags] ([name]) include ([id])

-- Activity lookup on module
create nonclustered index [activity_moduleid] on [rdowner].[activity] ([modul]) include ([id])

-- Activity type matching of activity
create nonclustered index [activity_activitytype] on [rdowner].[activity] ([activity_type]) include ([id], [LatestTransaction])

-- POS lookup by departmentid
create nonclustered index [pos_departmentid] on [rdowner].[pos] ([department]) include ([id], [name], [description], [user_text_1], [user_text_2], [user_text_3], [user_text_4])

-- Activities_StudentSets lookup on Studentset
create nonclustered index [ass_studentsetid] on [rdowner].[activities_studentset] ([student_set]) include ([id])

-- Staff lookup on hostkey
create nonclustered index [staff_hostkey] on [rdowner].[Staff] ([host_key])

-- Studentset lookup on hostkey
create nonclustered index [studentsets_hostkey] on [rdowner].[Student_Set] ([Host_key])

-- StudentSets_Modules lookup on Module
create nonclustered index [StudentSets_Modules] on [rdowner].[StudentSets_Modules] ([Modules]) include ([Id])

-- Act_Parents index on ParentId
create nonclustered index [act_parents_parent] on [rdowner].[Activity_Parents] ([Parent_acts]) include ([Id])
    
-- Location on zone
create nonclustered index [location_zone] on  [rdowner].[LOCATION] ([ZONE])

-- Pos on department
create nonclustered index [pos_department] on [rdowner].[POS] ([DEPARTMENT])
    
-- Activities of locations
create nonclustered index [activity_locations] on [rdowner].[ACTIVITIES_LOCATION] ([LOC]) include ([Id], [LatestTransaction])
    
-- Module on department
create nonclustered index [module_department] on [rdowner].[MODULE] ([DEPARTMENT])
    
-- Activities of staff
create nonclustered index [activities_staff] on [rdowner].[ACTIVITIES_STAFF] ([STAFF])
    
-- Activity scheduled weeks
create clustered index [activityweeks_id] on [rdowner].[ACTIVITY_SCHEDULEDWEEKS] ([ActivityID])

-- Variant JTA acts
create clustered index [variantjtaacts_id] on [rdowner].[VARIANTJTAACTS] ([Id])

-- Activityperiodtimes    
create clustered index [activityperiodtimes_id] ON [rdowner].[ACTIVITYPERIODTIMES] ([ID], [LatestTransaction])

-- Tag relations on tags
create nonclustered index [tag_relations_tags] on [rdowner].[tag_relations] ([tags]) include ([id],[LatestTransaction])

-- Activities on studentset
create nonclustered index [activities_studentset] on [rdowner].[activities_studentset] ([student_set]) include ([id],[LatestTransaction])

