BEGIN TRANSACTION;
DELETE FROM [dbname].rdowner.V_ACTIVITY;
INSERT INTO [dbname].rdowner.V_ACTIVITY
SELECT *
FROM [dbname].rdowner.V_ACTIVITY;

DELETE FROM [dbname].rdowner.V_ACTIVITY_DATETIME;
INSERT INTO [dbname].rdowner.V_ACTIVITY_DATETIME
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_DATETIME;

DELETE FROM [dbname].rdowner.V_GROUP;
INSERT INTO [dbname].rdowner.V_GROUP
SELECT *
FROM [dbname].rdowner.V_GROUP;

DELETE FROM [dbname].rdowner.V_ACTIVITYTYPE;
INSERT INTO [dbname].rdowner.V_ACTIVITYTYPE
SELECT *
FROM [dbname].rdowner.V_ACTIVITYTYPE;

DELETE FROM [dbname].rdowner.V_DEPARTMENT;
INSERT INTO [dbname].rdowner.V_DEPARTMENT
SELECT *
FROM [dbname].rdowner.V_DEPARTMENT;

DELETE FROM [dbname].rdowner.V_EQUIPMENT;
INSERT INTO [dbname].rdowner.V_EQUIPMENT
SELECT *
FROM [dbname].rdowner.V_EQUIPMENT;

DELETE FROM [dbname].rdowner.V_LOCATION;
INSERT INTO [dbname].rdowner.V_LOCATION
SELECT *
FROM [dbname].rdowner.V_LOCATION;

DELETE FROM [dbname].rdowner.V_LOCATIONGROUP;
INSERT INTO [dbname].rdowner.V_LOCATIONGROUP
SELECT *
FROM [dbname].rdowner.V_LOCATIONGROUP;

DELETE FROM [dbname].rdowner.V_MODULE;
INSERT INTO [dbname].rdowner.V_MODULE
SELECT *
FROM [dbname].rdowner.V_MODULE;

DELETE FROM [dbname].rdowner.V_NAMEDAVAILABILITY;
INSERT INTO [dbname].rdowner.V_NAMEDAVAILABILITY
SELECT *
FROM [dbname].rdowner.V_NAMEDAVAILABILITY;

DELETE FROM [dbname].rdowner.V_POS;
INSERT INTO [dbname].rdowner.V_POS
SELECT *
FROM [dbname].rdowner.V_POS;

DELETE FROM [dbname].rdowner.V_SECTION;
INSERT INTO [dbname].rdowner.V_SECTION
SELECT *
FROM [dbname].rdowner.V_SECTION;

DELETE FROM [dbname].rdowner.V_STAFF;
INSERT INTO [dbname].rdowner.V_STAFF
SELECT *
FROM [dbname].rdowner.V_STAFF;

DELETE FROM [dbname].rdowner.V_STUDENT;
INSERT INTO [dbname].rdowner.V_STUDENT
SELECT *
FROM [dbname].rdowner.V_STUDENT;

DELETE FROM [dbname].rdowner.V_STUDENTSET;
INSERT INTO [dbname].rdowner.V_STUDENTSET
SELECT *
FROM [dbname].rdowner.V_STUDENTSET;

DELETE FROM [dbname].rdowner.V_SUITABILITY;
INSERT INTO [dbname].rdowner.V_SUITABILITY
SELECT *
FROM [dbname].rdowner.V_SUITABILITY;

DELETE FROM [dbname].rdowner.V_GLOBAL;
INSERT INTO [dbname].rdowner.V_GLOBAL
SELECT *
FROM [dbname].rdowner.V_GLOBAL;

DELETE FROM [dbname].rdowner.V_TAG;
INSERT INTO [dbname].rdowner.V_TAG
SELECT *
FROM [dbname].rdowner.V_TAG;

DELETE FROM [dbname].rdowner.V_WEEK_LABEL;
INSERT INTO [dbname].rdowner.V_WEEK_LABEL
SELECT *
FROM [dbname].rdowner.V_WEEK_LABEL;

DELETE FROM [dbname].rdowner.V_ZONES;
INSERT INTO [dbname].rdowner.V_ZONES
SELECT *
FROM [dbname].rdowner.V_ZONES;

DELETE FROM [dbname].rdowner.V_TAG_RELATION;
INSERT INTO [dbname].rdowner.V_TAG_RELATION
SELECT *
FROM [dbname].rdowner.V_TAG_RELATION;

DELETE FROM [dbname].rdowner.V_GROUP_RELATION;
INSERT INTO [dbname].rdowner.V_GROUP_RELATION
SELECT *
FROM [dbname].rdowner.V_GROUP_RELATION;

DELETE FROM [dbname].rdowner.V_ACTIVITY_STUDENTSET;
INSERT INTO [dbname].rdowner.V_ACTIVITY_STUDENTSET
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_STUDENTSET;

DELETE FROM [dbname].rdowner.V_STUDENTSET_MODULE;
INSERT INTO [dbname].rdowner.V_STUDENTSET_MODULE
SELECT *
FROM [dbname].rdowner.V_STUDENTSET_MODULE;

DELETE FROM [dbname].rdowner.V_STUDENT_STUDENTSET;
INSERT INTO [dbname].rdowner.V_STUDENT_STUDENTSET
SELECT *
FROM [dbname].rdowner.V_STUDENT_STUDENTSET;

DELETE FROM [dbname].rdowner.V_AVOID_CONCURRENCY;
INSERT INTO [dbname].rdowner.V_AVOID_CONCURRENCY
SELECT *
FROM [dbname].rdowner.V_AVOID_CONCURRENCY;

DELETE FROM [dbname].rdowner.V_ACTIVITY_EQUIPMENT;
INSERT INTO [dbname].rdowner.V_ACTIVITY_EQUIPMENT
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_EQUIPMENT;

DELETE FROM [dbname].rdowner.V_ACTIVITY_LOCATION;
INSERT INTO [dbname].rdowner.V_ACTIVITY_LOCATION
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_LOCATION;

DELETE FROM [dbname].rdowner.V_ACTIVITY_STAFF;
INSERT INTO [dbname].rdowner.V_ACTIVITY_STAFF
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_STAFF;

DELETE FROM [dbname].rdowner.V_ACTIVITY_PARENTS;
INSERT INTO [dbname].rdowner.V_ACTIVITY_PARENTS
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_PARENTS;

DELETE FROM [dbname].rdowner.V_ACTIVITY_SECTION;
INSERT INTO [dbname].rdowner.V_ACTIVITY_SECTION
SELECT *
FROM [dbname].rdowner.V_ACTIVITY_SECTION;

DELETE FROM [dbname].rdowner.V_LOCATION_SUITABILITY;
INSERT INTO [dbname].rdowner.V_LOCATION_SUITABILITY
SELECT *
FROM [dbname].rdowner.V_LOCATION_SUITABILITY;

DELETE FROM [dbname].rdowner.V_POS_MODULE;
INSERT INTO [dbname].rdowner.V_POS_MODULE
SELECT *
FROM [dbname].rdowner.V_POS_MODULE;

DELETE FROM [dbname].rdowner.V_LOCATION_LOCATIONGROUP;
INSERT INTO [dbname].rdowner.V_LOCATION_LOCATIONGROUP
SELECT *
FROM [dbname].rdowner.V_LOCATION_LOCATIONGROUP;

COMMIT TRANSACTION;
