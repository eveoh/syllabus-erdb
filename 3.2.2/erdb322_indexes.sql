-- Drop existing
IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.membergroups') AND NAME ='group_id')
    DROP INDEX group_id ON rdowner.membergroups;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.groups') AND NAME ='group_name_grouptype')
    DROP INDEX group_name_grouptype ON rdowner.groups;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.tag_relations') AND NAME ='tag_id')
    DROP INDEX tag_id ON rdowner.tag_relations;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.TAGS') AND NAME ='tag_name')
    DROP INDEX tag_name ON rdowner.TAGS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.activity') AND NAME ='activity_moduleid')
    DROP INDEX activity_moduleid ON rdowner.activity;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.activity') AND NAME ='activity_activitytype')
    DROP INDEX activity_activitytype ON rdowner.activity;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.pos') AND NAME ='pos_departmentid')
    DROP INDEX pos_departmentid ON rdowner.pos;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.activities_studentset') AND NAME ='ass_studentsetid')
    DROP INDEX ass_studentsetid ON rdowner.activities_studentset;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.Staff') AND NAME ='staff_hostkey')
    DROP INDEX staff_hostkey ON rdowner.Staff;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.Student_Set') AND NAME ='studentsets_hostkey')
    DROP INDEX studentsets_hostkey ON rdowner.Student_Set;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.StudentSets_Modules') AND NAME ='StudentSets_Modules')
    DROP INDEX StudentSets_Modules ON rdowner.StudentSets_Modules;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.Activity_Parents') AND NAME ='act_parents_parent')
    DROP INDEX act_parents_parent ON rdowner.Activity_Parents;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.LOCATION') AND NAME ='location_zone')
    DROP INDEX location_zone ON rdowner.LOCATION;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.POS') AND NAME ='pos_department')
    DROP INDEX pos_department ON rdowner.POS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.ACTIVITIES_LOCATION') AND NAME ='activity_locations')
    DROP INDEX activity_locations ON rdowner.ACTIVITIES_LOCATION;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.MODULE') AND NAME ='module_department')
    DROP INDEX module_department ON rdowner.MODULE;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.activities_staff') AND NAME ='activities_staff')
    DROP INDEX activities_staff ON rdowner.activities_staff;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.ACTIVITY_SCHEDULEDWEEKS') AND NAME ='activityweeks_id')
    DROP INDEX activityweeks_id ON rdowner.ACTIVITY_SCHEDULEDWEEKS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.VARIANTJTAACTS') AND NAME ='variantjtaacts_id')
    DROP INDEX variantjtaacts_id ON rdowner.VARIANTJTAACTS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.ACTIVITY_SCHEDULEDPERIODS') AND NAME ='activityperiods_id')
    DROP INDEX activityperiods_id ON rdowner.ACTIVITY_SCHEDULEDPERIODS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.SD_TRANSACTION') AND NAME ='transaction_transnum')
    DROP INDEX transaction_transnum ON rdowner.SD_TRANSACTION;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.AVOID_CONCURRENCY') AND NAME ='avoidconcurr_id')
    DROP INDEX avoidconcurr_id ON rdowner.AVOID_CONCURRENCY;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.AVOID_CONCURRENCY') AND NAME ='avoidconcurr_acid')
    DROP INDEX avoidconcurr_acid ON rdowner.AVOID_CONCURRENCY;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.STUDENT_IN_SET') AND NAME ='student_in_set_studentset')
    DROP INDEX student_in_set_studentset ON rdowner.STUDENT_IN_SET;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.SECTION_ACTIVITIES') AND NAME ='section_activities_activities')
    DROP INDEX section_activities_activities ON rdowner.SECTION_ACTIVITIES;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.EXTRACT_INFO') AND NAME ='extractinfo_finished')
    DROP INDEX extractinfo_finished ON rdowner.EXTRACT_INFO;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.POS_MODULE') AND NAME ='posmodule_coremodules')
    DROP INDEX posmodule_coremodules ON rdowner.POS_MODULE;

-- Group lookup and match indexes
create nonclustered index [group_id] on [rdowner].[membergroups] ([GROUPS], [id]) include ([LatestTransaction])
create nonclustered index [group_name_grouptype] on [rdowner].[groups] ([name], [grouptype], [id]) include ([LatestTransaction])

-- Tag lookup and match indexes
create nonclustered index [tag_id] on [rdowner].[tag_relations] ([tags], [id]) include ([LatestTransaction])
create nonclustered index [tag_name] ON [rdowner].[TAGS] ([NAME], [Id]) INCLUDE ([LatestTransaction])

-- Activity lookup on module
create nonclustered index [activity_moduleid] on [rdowner].[activity] ([modul]) include ([id])

-- Activity type matching of activity
create nonclustered index [activity_activitytype] on [rdowner].[activity] ([activity_type], [id]) include ([LatestTransaction])

-- POS lookup by departmentid
create nonclustered index [pos_departmentid] on [rdowner].[pos] ([department]) include ([id], [name], [description], [user_text_1], [user_text_2], [user_text_3], [user_text_4])

-- Activities_StudentSets lookup on Studentset
create unique nonclustered index [ass_studentsetid] on [rdowner].[activities_studentset] ([student_set], [id]) include ([LatestTransaction])

-- Staff lookup on hostkey
create nonclustered index [staff_hostkey] on [rdowner].[Staff] ([host_key])

-- Studentset lookup on hostkey
create nonclustered index [studentsets_hostkey] on [rdowner].[Student_Set] ([Host_key])

-- StudentSets_Modules lookup on Module
create nonclustered index [StudentSets_Modules] on [rdowner].[StudentSets_Modules] ([Modules], [Id]) include ([LatestTransaction])

-- Act_Parents index on ParentId
create nonclustered index [act_parents_parent] on [rdowner].[Activity_Parents] ([Parent_acts], [Id]) include ([LatestTransaction])
    
-- Location on zone
create nonclustered index [location_zone] on  [rdowner].[LOCATION] ([ZONE])

-- Pos on department
create nonclustered index [pos_department] on [rdowner].[POS] ([DEPARTMENT])
    
-- Activities of locations
create nonclustered index [activity_locations] on [rdowner].[ACTIVITIES_LOCATION] ([LOC], [Id]) include ([LatestTransaction])
    
-- Module on department
create nonclustered index [module_department] on [rdowner].[MODULE] ([DEPARTMENT])
    
-- Activities of staff
create nonclustered index [activities_staff] on [rdowner].[ACTIVITIES_STAFF] ([STAFF], [ID]) include ([LatestTransaction])
    
-- Activity scheduled weeks
create clustered index [activityweeks_id] on [rdowner].[ACTIVITY_SCHEDULEDWEEKS] ([ActivityID])

-- Variant JTA acts
create clustered index [variantjtaacts_id] on [rdowner].[VARIANTJTAACTS] ([Id])

-- Activity scheduled periods
create clustered index [activityperiods_id] ON [rdowner].[ACTIVITY_SCHEDULEDPERIODS] ([ActivityID], [PeriodIndex], [Period], [LatestTransaction])

-- Create an additional index on the SD_TRANSACTION transnum column
-- There is already a clustered index, but since Scientia chose to INNER JOIN this table in every view (instead of OUTER JOIN)
-- SQL Server always has to peek in the list of transnum's. A non-clustered index will be faster than a clustered index, since only
-- the transnum is needed.
CREATE UNIQUE NONCLUSTERED INDEX [transaction_transnum] ON [rdowner].[SD_TRANSACTION] ( [TransNum] ASC )

-- Avoid concurr
create clustered index [avoidconcurr_id] on [rdowner].[AVOID_CONCURRENCY] ([Id], [Avoid_ConcurrencyID])
create nonclustered index [avoidconcurr_acid] on [rdowner].[AVOID_CONCURRENCY] ([Avoid_ConcurrencyID], [Id]) include ([LatestTransaction])

-- Studentset size
create nonclustered index [student_in_set_studentset] on [rdowner].[STUDENT_IN_SET] ([STUDENT_SETS], [ID]) include ([LatestTransaction])

-- Sections
create nonclustered index [section_activities_activities] on [rdowner].[SECTION_ACTIVITIES] ([ACTIVITIES], [id]) INCLUDE ([LatestTransaction])

-- Extract info
create clustered index [extractinfo_finished] on [rdowner].[EXTRACT_INFO] ([ExtractFinished])

-- Pos module
create nonclustered index [posmodule_coremodules] on [rdowner].[POS_MODULE] ([CORE_MODULES], [id]) INCLUDE ([LatestTransaction])
