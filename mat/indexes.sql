ALTER TABLE [rdowner].[V_ACTIVITY_PARENTS]
ADD CONSTRAINT [PK_Act_Parents] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [ParentID] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITY]
ADD CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITY_EQUIPMENT]
ADD CONSTRAINT [PK_Activity_Equipment] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [EquipmentID] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITY_LOCATION]
ADD CONSTRAINT [PK_Activity_Location] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [LocationID] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITY_STAFF]
ADD CONSTRAINT [PK_Activity_Staff] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [StaffID] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITY_STUDENTSET]
ADD CONSTRAINT [PK_Activity_StudentSet] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [StudentSetID] ASC
);


ALTER TABLE [rdowner].[V_ACTIVITYTYPE]
ADD CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);

ALTER TABLE [rdowner].[V_DEPARTMENT]
ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_EQUIPMENT]
ADD CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_GROUP]
ADD CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_LOCATIONGROUP]
ADD CONSTRAINT [PK_LocationGroup] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);


ALTER TABLE [rdowner].[V_LOCATION]
ADD CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);


ALTER TABLE [rdowner].[V_LOCATION_LOCATIONGROUP]
ADD CONSTRAINT [pk_locgroup] PRIMARY KEY CLUSTERED 
(
    [LocationID] ASC,
    [LocationGroupID] ASC
);


ALTER TABLE [rdowner].[V_LOCATION_SUITABILITY]
ADD CONSTRAINT [PK_Location_Suitability] PRIMARY KEY CLUSTERED 
(
    [LocationID] ASC,
    [SuitabilityID] ASC
);


ALTER TABLE [rdowner].[V_MODULE]
ADD CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);

ALTER TABLE [rdowner].[V_NAMEDAVAILABILITY]
ADD CONSTRAINT [PK_NamedAvailability] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);


ALTER TABLE [rdowner].[V_POS]
ADD CONSTRAINT [PK_POS] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);


ALTER TABLE [rdowner].[V_POS_MODULE]
ADD CONSTRAINT [PK_POS_Module] PRIMARY KEY CLUSTERED 
(
    [POSID] ASC,
    [ModuleID] ASC
);


ALTER TABLE [rdowner].[V_AVOID_CONCURRENCY]
ADD CONSTRAINT [PK_AVOID_CONCUR] PRIMARY KEY CLUSTERED 
(
    [LocationId] ASC,
    [AVOIDCONCURRENCYId] ASC
);


ALTER TABLE [rdowner].[V_SECTION]
ADD CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);

ALTER TABLE [rdowner].[V_STUDENTSET_MODULE]
ADD CONSTRAINT [PK_Studentset_Module] PRIMARY KEY CLUSTERED 
(
    [StudentSetId] ASC,
    [ModuleId] ASC
);
             
ALTER TABLE [rdowner].[V_ACTIVITY_SECTION]
ADD CONSTRAINT [PK_Activity_Section] PRIMARY KEY CLUSTERED 
(
    [ActivityID] ASC,
    [SectionID] ASC
);


ALTER TABLE [rdowner].[V_STAFF]
ADD CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_STUDENT]
ADD CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);


ALTER TABLE [rdowner].[V_STUDENTSET]
ADD CONSTRAINT [PK_StudentSets] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
);


ALTER TABLE [rdowner].[V_SUITABILITY]
ADD CONSTRAINT [PK_Suitability] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);



ALTER TABLE [rdowner].[V_TAG]
ADD CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);



ALTER TABLE [rdowner].[V_WEEK_LABEL]
ADD CONSTRAINT [PK_Week_Label] PRIMARY KEY CLUSTERED 
(
    [WeekNumber] ASC
);

ALTER TABLE [rdowner].[V_ZONES]
ADD CONSTRAINT [PK_Zones] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
);

CREATE CLUSTERED INDEX [adt_id_sdt_edt] ON [rdowner].[V_ACTIVITY_DATETIME]
(
    [ActivityID] ASC,
    [StartDateTime] ASC,
    [EndDateTime] ASC
);


CREATE CLUSTERED INDEX [group_groupid] ON [rdowner].[V_GROUP_RELATION]
(
    [GroupID] ASC,
    [Id] ASC
);

CREATE CLUSTERED INDEX [tag_tagid] ON [rdowner].[V_TAG_RELATION]
(
    [TAGID] ASC,
    [ID] ASC
);

CREATE NONCLUSTERED INDEX [act_parent] ON [rdowner].[V_ACTIVITY_PARENTS]
(
    [ParentID] ASC
)
INCLUDE (   [ActivityID]);


CREATE NONCLUSTERED INDEX [activity_moduleid] ON [rdowner].[V_ACTIVITY]
(
    [ModuleID] ASC
)
INCLUDE (   [Id]);


CREATE UNIQUE NONCLUSTERED INDEX [Activities_Locations_location] ON [rdowner].[V_ACTIVITY_LOCATION]
(
    [LocationID] ASC,
    [ActivityID] ASC
);

CREATE UNIQUE NONCLUSTERED INDEX [Activities_Locations_ID] ON [rdowner].[V_ACTIVITY_LOCATION]
(
    [ActivityID] ASC,
    [LocationID] ASC
);

CREATE UNIQUE NONCLUSTERED INDEX [Activities_Staff_Staff] ON [rdowner].[V_ACTIVITY_STAFF]
(
    [StaffID] ASC,
    [ActivityID] ASC
);

CREATE UNIQUE NONCLUSTERED INDEX [Activities_Staff_ID] ON [rdowner].[V_ACTIVITY_STAFF]
(
    [ActivityID] ASC,
    [StaffID] ASC
);


CREATE UNIQUE NONCLUSTERED INDEX [ass_studentsetid] ON [rdowner].[V_ACTIVITY_STUDENTSET]
(
    [StudentSetID] ASC,
    [ActivityID] ASC
);


CREATE NONCLUSTERED INDEX [adt_sdt_edt_id] ON [rdowner].[V_ACTIVITY_DATETIME]
(
    [StartDateTime] ASC,
    [EndDateTime] ASC
)
INCLUDE (   [ActivityID]);


CREATE NONCLUSTERED INDEX [group_id] ON [rdowner].[V_GROUP_RELATION]
(
    [Id] ASC,
    [GroupID] ASC
);

CREATE NONCLUSTERED INDEX [group_name_grouptype] ON [rdowner].[V_GROUP]
(
    [Name] ASC,
    [GroupType] ASC,
    [Id] ASC
);


CREATE NONCLUSTERED INDEX [Module_department] ON [rdowner].[V_MODULE]
(
    [DepartmentID] ASC
)
INCLUDE (   [Id],
    [HostKey],
    [Name],
    [Description],
    [Usertext1],
    [Usertext2],
    [Usertext3],
    [Usertext4]);


CREATE NONCLUSTERED INDEX [pos_departmentid] ON [rdowner].[V_POS]
(
    [DepartmentID] ASC
)
INCLUDE (   [ID],
    [Name],
    [Description],
    [Usertext1],
    [Usertext2],
    [Usertext3],
    [Usertext4]);


CREATE NONCLUSTERED INDEX [Pos_Module_Module_id] ON [rdowner].[V_POS_MODULE]
(
    [ModuleID] ASC
)
INCLUDE (   [POSID]);



CREATE NONCLUSTERED INDEX [staff_hostkey] ON [rdowner].[V_STAFF]
(
    [HostKey] ASC
);



CREATE NONCLUSTERED INDEX [Studentset_Pos_id] ON [rdowner].[V_STUDENTSET]
(
    [PosId] ASC
)
INCLUDE (   [Id],
    [Hostkey],
    [Name],
    [Description],
    [Usertext1],
    [Usertext2],
    [Usertext3],
    [Usertext4]);


CREATE NONCLUSTERED INDEX [StudentSets_department] ON [rdowner].[V_STUDENTSET]
(
    [DepartmentId] ASC
);



CREATE NONCLUSTERED INDEX [studentsets_hostkey] ON [rdowner].[V_STUDENTSET]
(
    [Hostkey] ASC
);


CREATE NONCLUSTERED INDEX [StudentSets_Modules] ON [rdowner].[V_STUDENTSET_MODULE]
(
    [ModuleId] ASC
)
INCLUDE (   [StudentSetId]);


CREATE NONCLUSTERED INDEX [tag_id] ON [rdowner].[V_TAG_RELATION]
(
    [ID] ASC,
    [TagId] ASC
);


CREATE NONCLUSTERED INDEX [tag_name] ON [rdowner].[V_TAG]
(
    [Name] ASC,
    [ID] ASC
);


create nonclustered index [locations_zone] ON [rdowner].[V_LOCATION] ([ZoneId])

create nonclustered index [avoidconcurr_acid] ON [rdowner].[V_AVOID_CONCURRENCY] ([AVOIDCONCURRENCYId]) include ([LocationId])

CREATE unique NONCLUSTERED INDEX [ss_assid] ON [rdowner].[V_ACTIVITY_STUDENTSET]
(
    [ActivityId] ASC,
    [StudentSetId] ASC
);






