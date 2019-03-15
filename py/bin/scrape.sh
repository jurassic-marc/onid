log_file=/home/marc/git/onid/py/log/scrape_$(date +%F).log

echo -n "Number of scrapes: $1 " " Time between scrapes: $2 \n" >> $log_file

for i in $(seq 1 $1); do echo -n "Count: $i \t" "`date` \t" "Scraping... \n" >> $log_file; python ../src/scrape.py; sleep $2; done

