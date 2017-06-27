#/bin/bash

/usr/bin/sametime-connect

sleep 10

while [ `ps -eaf | grep "/opt/ibm/Sametime" | wc -l` -eq 2 ]
do
        sleep 5
done
