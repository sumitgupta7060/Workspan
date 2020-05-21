# Workspan
Scripting Challenge

The script UrlReport.sh is made to gather serveral URL related reports at every 30 mins of interval. This is achieved using CRONTAB.

Add below entries to crontab (cmd: crontab -e)

0/30 * * * * sh /path/to/script/UrlReport.sh

Key points of script:

Firstly, the date & time is recorded when ever the script runs and updated to a dynamic output file: final.txt & noresponse.txt

Using CURL command we are recording the data of several URLs present in url.txt file.

Options used with curl command: 
-o /dev/null throws away the usual output
--silent throws away the progress meter
--head makes a HEAD HTTP request, instead of GET
-m maximum time in seconds that you allow the whole operation to take.
-w Defines what to display on stdout after a completed and successful operation. 
"%{http_code}" prints the required status code
"%{time_namelookup}" prints the DNS time taken
"%{time_connect}" prints the connection time taken
"%{time_total}" prints the total time taken

final.txt file has the complete report of URLs present in the url.txt file. The same file gets appended on next script run as well.

noresponse.txt has the list of URLs which did not responded. The same file gets appended on next script run as well.

========================================================================================================================================
The script covers below aspects:

This script will be executed periodically -> using crontab
List of URLs is kept in a text file -> url.txt
You choose report format -> currently using text file to store the output but .csv format can also be replaced to view on MS excel.
You choose programming language -> using shell scripting
Design report format such that long term trends can be analyzed  -> Output files are made dynamic and are updated with proper date & time.
Demonstrate/ Propose methods of analyzing long term trends -> Proposing to find average time taken/response code from previous output. Use New relic or Grafana for visual data. 
Demonstrate/ Propose methods of setting up monitoring from different regions of the world -> Poposing to use could technologies to achieve this. Cloudwatch/firewall/forwarding rules.
Demonstrate how alerts can be generated -> Currently triggering email when ever script runs, apart from this, we can make use of Zabbix or New Relic as well.
Consider scaling of this tool to monitor  1000s of URLs -> url.txt is generic and dynamic on which many urls can be added.
Bonus: measure response time for these sites along with long term trends -> Script stores all the data over long term tend. Sample output has been attached.
