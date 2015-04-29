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
 * `3.2.2/fix_endtime-before-starttime.sql`: Fixes end time of activities that end at 0:00.

Version 3.10/3.11
-----------------

 * Please use the indexing script from version 3.2.2: `3.2.2/erdb322_indexes.sql`, no further bugfixes are necessary.
