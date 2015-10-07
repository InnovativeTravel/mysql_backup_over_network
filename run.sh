#!/bin/sh
NOW=$(date +"%Y%m%d_%H%M")

# config the values of the machine you want your DB to be dumped to
BASEDIR='/var/dumps'
IP='1.2.3.4'

echo 'Hello!'

for dbname in db_name_1 db_name_2 db_name_3
do
  echo "Creating back up on [$IP] for MySQL database [$dbname] into [$BASEDIR/$dbname-$NOW.gz]"
  mysqldump -u root $dbname | gzip -c | ssh luca@$IP "cat > $BASEDIR/$dbname-$NOW.gz"
done

echo 'Done. Bye!'
