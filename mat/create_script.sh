#!/bin/sh

rm create_script.sql

while read table
do cat >> create_script.sql <<EOF
SELECT *
INTO rdowner.$table
FROM [dbname].rdowner.$table
WHERE 1 = 0

EOF
done < tablenames