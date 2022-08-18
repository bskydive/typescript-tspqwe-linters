echo -e "\n## lint" > log/lint.angular.md

# for old angular version with tslint
#npm run lint:ng 2>&1 > log/lint.angular.log
npm run lint:ng 2>log/lint.angular.log || echo "npm run lint:ng failed" | tee -a log/log.project.md && exit
grep ' warning ' log/lint.angular.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/lint.angular.uniq.log

wc -l log/angular.lint.uniq.log >> lint.angular.md
cat lint.angular.md >> log/log.project.md


