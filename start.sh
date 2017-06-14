#/bin/bash

/usr/bin/sametime-connect

while [ `ps -a | grep sametime | wc -l` -eq 1 ]
do
        sleep 5
done
