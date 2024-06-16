# Take database pg dump into "latest.dump" file

pg_dump -h <host> -p <port> -U <user> -d <database> --clean --if-exists --format=c -v > latest.dump

# Restore to a new database server
# **Important**: This script will drop and recreate the database at the destination. So,
# make sure that this is what you want to do. The database that will be created is the one
# that you gave as -d <database> argument in the "pg_dump". 

pg_restore -h <host> -p <port> --create --clean --format=c latest.dump
