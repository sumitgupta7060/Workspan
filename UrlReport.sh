#!/bin/bash
#################################################################
## Email: sumit.gupta7060@gmail.com                             #
## URL report tracking script !!                                #
#################################################################

time=`date`
echo "===================================================================================" >> final.txt
echo "New report generated at $time" >> final.txt
echo "URL                      Response_Code    DNS_time        Connection_time         Total_time" >> final.txt
while read LINE
        do
        stat=`curl -o /dev/null --silent --head -m 2 -w "%{http_code}\t""%{time_namelookup}\t""%{time_connect}\t""%{time_total}"  $LINE`
        echo  "$LINE            $stat" >> final.txt
done < url.txt

cat final.txt

##For alerts we can make use of below:
mail -s "Complte URL report" user@example.com -A final.txt
echo "===================================================================================" >> noresponse.txt
echo "New report generated at $time" >> noresponse.txt
echo "URL                      Response_Code    DNS_time        Connection_time         Total_time" >> noresponse.txt
awk '$2 == "000" {print}' final.txt >> noresponse.txt
mail -s "Unreachable URLs" user@example.com -A noresponse.txt
