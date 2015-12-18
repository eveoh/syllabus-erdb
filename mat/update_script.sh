#!/bin/sh

echo 'BEGIN TRANSACTION;' > update_script.sql

while read table
do cat >> update_script.sql <<EOF
DELETE FROM [dbname].rdowner.$table;
INSERT INTO [dbname].rdowner.$table
SELECT *
FROM [dbname].rdowner.$table;

EOF
done < tablenames

echo 'COMMIT TRANSACTION;' >> update_script.sql

