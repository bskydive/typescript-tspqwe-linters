############################################## PACKAGE

echo -e "\n# PACKAGE" >> log/npm.md

echo -e "\n## Dependencies" >> log/npm.md
cat package.json | tr -d '",:{}' >> log/npm.md

cat log/npm.md >> log/log.md

npm audit > log/audit.log

grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | less
grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log
# edit file
exit

echo -e "\n# NPM AUDIT" >> log/audit.md
tail -n3 log/audit.log > log/audit.md
cat log/audit.md >> log/log.md
