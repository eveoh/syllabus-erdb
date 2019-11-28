IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.SAME_TIME_ACTS') AND NAME ='sametimeacts_id')
    DROP INDEX sametimeacts_id ON rdowner.SAME_TIME_ACTS;

IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id('rdowner.SAME_TIME_ACTS') AND NAME ='sametimeacts_staid')
    DROP INDEX sametimeacts_staid ON rdowner.SAME_TIME_ACTS;

create clustered index [sametimeacts_id] on [rdowner].[SAME_TIME_ACTS] ([Id], [SAME_TIME_ACTS])
create nonclustered index [sametimeacts_staid] on [rdowner].[SAME_TIME_ACTS] ([SAME_TIME_ACTS], [Id]) include ([LatestTransaction])