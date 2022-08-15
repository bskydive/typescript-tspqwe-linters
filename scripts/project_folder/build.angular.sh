############################################# BUILD ANGULAR

# enable fullTemplateTypeCheck or strictTemplates in tsconfig.json
# logs output don't work because all errors in stderr, copied manually
# clear console
clear
npm run build 2>&1 > log/build.angular.log
# save console output to log/build.angular.log
grep -iE 'error TS' log/build.angular.log > log/build.angular.errors.log
wc -l log/build.angular.errors.log >> log/build.angular.md

cat log/build.angular.errors.log | awk -F':' '{print$1}' | sort | uniq > log/build.angular.errors.files.log
wc -l log/build.angular.errors.files.log >> log/build.angular.md

grep -iE 'error TS' log/build.angular.log | awk -F' TS' '{print$2}' | awk -F':' '{print$1}' | sort | uniq > log/build.angular.ts-numbers.ts
wc -l log/build.angular.ts-numbers.ts >> log/build.angular.md
#less log/build.angular.ts-numbers.ts


