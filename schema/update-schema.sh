#!/bin/sh

# Dump the schema.
pg_dump --cluster 8.4/wanna-build -s wanna-build > wanna-build.sql
git add wanna-build.sql

# Dump the roles.
sudo -u postgres pg_dumpall --cluster 8.4/wanna-build | egrep '^(GRANT.*TO.*BY|CREATE ROLE)' > roles.sql
git add roles.sql

git commit wanna-build.sql roles.sql -m 'Auto-committed schema changes.'

