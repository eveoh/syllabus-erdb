Scientia ERDB index and fix scripts
===================================

This repository contains various SQL Server/T-SQL scripts to fix the Scientia ERDB and improve its performance. The scripts to execute depend on the version of the ERDB.

See the [MyTimetable wiki](https://wiki.eveoh.nl/x/SIA3) for more information.

Version 3.1.x
-------------
 
 * `3.1/erdb31_indexes.sql`: Adds various missing indexes to the ERDB to improve read performance by factor 2-10.
 * `3.1/erdb31_adt_fix.sql`: Fixes the missing last `ActivityDateTimes` entry.
 * `3.1/erdb31_tables.sql`: Adds an `Act_GParents` table containing grandparent/parent - child relationships. Necessary for MyTimetable to display JTA/Variant activities correctly. Also requires a change in `transform.xml` to include the view in the Scheduled Extract.
 * `3.1/erdb31_index_merge.sql`: Some example indexes to add when using MyTimetable merge functionality. Please consult our suport department for more information on this.

Version 3.2.0
-------------

 * `3.2/erdb32_indexes.sql`: Adds various missing indexes to the ERDB to improve read performance by factor 2-5.
 * `3.2/fix_endtime-before-starttime.sql`: Fixes end time of activities that end at 0:00. 

Version 3.2.2
-------------

 * `3.2.2/erdb322_indexes.sql`: Adds various missing indexes to the ERDB to improve read performance by factor 2-5. 
 * `3.2.2/erdb322_indexes_merging.sql`: Indexes required when using data source merging, based on name column.
 * `3.2.2/erdb322_indexes_merging_hostkey.sql`: Indexes required when using data source merging, based on host key column.
 * `3.2.2/fix_endtime-before-starttime.sql`: Fixes end time of activities that end at 0:00.
 * `3.2.2/fix_pooledresources.sql`: Fixes the pooled resources if more than 1 resource is attached to an activity.
 * `3.2.2/erdb322_wrb_index.sql` *(optional)*: Adds an index to speed up lookup of activities based on the usertext2 column. This is only useful for Web Room Booking timetable activities with the username in usertext2.

Version 3.10
------------

 * Please use the indexing script from version 3.2.2: `3.2.2/erdb322_indexes.sql` (and optionally `3.2.2/erdb322_wrb_index.sql`).
 * The pooled resources fix from 3.2.2 is relevant for this version as well.
 * fix_namedavailability_hostkey.sql: adds the HostKey field to the NamedAvailability view, required for MyTimetable 4.0

Version 3.11
------------

 * Please use the indexing script from version 3.2.2: `3.2.2/erdb322_indexes.sql` (and optionally `3.2.2/erdb322_wrb_index.sql`),
 * Apply the bugfix from `3.11/fix-departments-view.sql` to the SDB. It corrects an error in the `DerivedIntegrationViews.sql` file which leads to errors during department extraction.
 * The pooled resources fix from 3.2.2 is relevant for this version as well.
