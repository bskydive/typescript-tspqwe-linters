echo -e "\n## lint" > log/lint.angular.md
# if tslint exists, old angular lib

npm run lint:ng 2>&1 > log/lint.angular.log
grep ' warning ' log/lint.angular.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/lint.angular.uniq.log

wc -l log/angular.lint.uniq.log >> lint.angular.md
cat lint.angular.md >> log/log.project.md


