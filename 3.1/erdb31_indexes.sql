-- Group lookup and match indexes
create clustered index [group_groupid] on [rdowner].[group_relations] ([groupid], [id])
create nonclustered index [group_id] on [rdowner].[group_relations] ([id], [groupid])
create nonclustered index [group_name_grouptype] on [rdowner].[groups] ([name], [grouptype], [id])

-- Tag lookup and match indexes
create clustered index [tag_tagid] on [rdowner].[tag_relations] ([tag_id], [id])
create nonclustered index [tag_id] on [rdowner].[tag_relations] ([id], [tag_id])
create nonclustered index [tag_name] on [rdowner].[tags] ([name], [id])

-- Activity lookup on module
create nonclustered index [activity_moduleid] on [rdowner].[activities] ([module_id]) include ([id])

-- ADT lookup on id, start and enddate
create clustered index [adt_id_sdt_edt] on [rdowner].[activitydatetimes] ([id], [startdatetime], [enddatetime])
create nonclustered index [adt_sdt_edt_id] on [rdowner].[activitydatetimes] ([startdatetime], [enddatetime]) include ([Id])

-- POS lookup by departmentid
create nonclustered index [pos_departmentid] on [rdowner].[pos] ([department_id]) include ([id], [name], [description], [usertext1], [usertext2], [usertext3], [usertext4])

-- Activities_StudentSets lookup on Studentset
create nonclustered index [ass_studentsetid] on [rdowner].[activities_studentsets] ([studentset_id]) include ([activity_id])

-- Staff lookup on hostkey
create nonclustered index [staff_hostkey] on [rdowner].[Staff] ([Hostkey])

-- Studentset lookup on hostkey
create nonclustered index [studentsets_hostkey] on [rdowner].[StudentSets] ([Hostkey])

-- StudentSets_Modules lookup on Module
create nonclustered index [StudentSets_Modules] on [rdowner].[StudentSets_Modules] ([Module]) include ([Id])
