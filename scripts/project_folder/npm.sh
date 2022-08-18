############################################## PACKAGE

echo -e "\n# PACKAGE" > log/npm.md

echo -e "\n## Dependencies" >> log/npm.md
cat package.json | tr -d '",:{}' >> log/npm.dependencies.log
# manually refine and move libs from log/npm.dependencies.log to report/README

echo -e "\n## NPM AUDIT" >> log/npm.md
npm audit > log/audit.log
tail -n3 log/audit.log >> log/npm.md

grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | tr -dc '[:print:]\n' | tr -d '[90m[39m' > log/audit.parsed.log
wc -l log/audit.parsed.log >> log/audit.md

cat log/npm.md >> log/log.project.md
