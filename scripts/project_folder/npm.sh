############################################## PACKAGE

echo -e "\n# PACKAGE" >> log/npm.md

echo -e "\n## Dependencies" >> log/npm.md
cat package.json | tr -d '",:{}' >> log/npm.md

echo -e "\n## NPM AUDIT" >> log/npm.md
npm audit > log/audit.log
grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log
#wc -l log/audit.parsed.log >> log/audit.md
tail -n3 log/audit.log >> log/npm.md

cat log/npm.md >> log/log.project.md
