echo -e "\n## lint" > log/lint.md
# if tslint exists, old angular lib

npm run lint:ng 2>&1 > log/lint.log
grep ' warning ' log/lint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/angular.lint.uniq.log

wc -l log/angular.lint.uniq.log >> lint.md
wc -l log/angular.lint.uniq.log >> log/log.md

