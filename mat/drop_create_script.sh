#!/bin/sh

rm drop_create_script.sql

while read table
do cat >> drop_create_script.sql <<EOF
DROP TABLE rdowner.$table;
GO

SELECT *
INTO rdowner.$table
FROM [dbname].rdowner.$table
WHERE 1 = 0;
GO
EOF
done < tablenames