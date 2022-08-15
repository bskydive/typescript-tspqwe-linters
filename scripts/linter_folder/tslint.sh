############################################# TS LINT

echo -e "\n# TSLINT" > ../../log/tslint.md

npm run lint:ts > ../../log/tslint.log
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq | less
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq > ../../log/tslint.uniq.log
cat log/tslint.log | awk -F'(' '{print $1}' | sort | uniq > ../../log/tslint.files.log
wc -l log/tslint.files.log >> ../../log/tslint.md
cat log/tslint.log | awk -F':' '{print $3}' | sort | uniq > ../../log/tslint.issues.log
wc -l log/tslint.issues.log >> ../../log/tslint.md
cat log/tslint.log | awk -F':' '{print $2}' | sort | uniq > ../../log/tslint.rules.log 
wc -l log/tslint.rules.log >> ../../log/tslint.md

cat log/tslint.md >> ../../log/log.md

