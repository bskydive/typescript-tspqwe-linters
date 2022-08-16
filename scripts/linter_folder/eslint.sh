############################################# ES LINT
# copy project src folder to linter repo folder

echo -e "\n# eslint" > log/eslint.md
npm run lint:es
# grep ' warning ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
#grep -iE ' warning | error ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/eslint.uniq.log

echo -e "\n## all rules" >> log/eslint.md
cat log/eslint.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.files.log
echo -e "`tail -n1 log/eslint.log`" >> log/eslint.md

echo -e "`tail -n +2 log/eslint.log | wc -l ` log/eslint.log" >> log/eslint.md
wc -l log/eslint.files.log >> log/eslint.md

cat log/eslint.log | awk -F':' '{print $3}' | sort | uniq > log/eslint.issues.log
wc -l log/eslint.issues.log >> log/eslint.md

cat log/eslint.log | awk -F':' '{print $2}' | awk -F' ' '{print $2}' | sort | uniq > log/eslint.rules.log 
cat log/eslint.rules.log > log/eslint.rules.important.log
wc -l log/eslint.rules.log  >> log/eslint.md

echo -e "\n## max-lines" >> log/eslint.md
cat log/eslint.log | grep -i max-lines > log/eslint.max-lines.log
wc -l log/eslint.max-lines.log >> log/eslint.md

cat log/eslint.max-lines.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines.files.log
wc -l log/eslint.max-lines.files.log >> log/eslint.md

echo -e "\n## complexity" >> log/eslint.md
cat log/eslint.log | grep -i complexity > log/eslint.complexity.log
wc -l log/eslint.complexity.log >> log/eslint.md

cat log/eslint.complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.complexity.files.log
wc -l log/eslint.complexity.files.log >> log/eslint.md

echo -e "\n## complexity and max-lines" >> log/eslint.md
cat log/eslint.log | grep -iE 'max-lines|complexity' > log/eslint.max-lines-complexity.log
wc -l log/eslint.max-lines-complexity.log >> log/eslint.md

cat log/eslint.max-lines-complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines-complexity.files.log
wc -l log/eslint.max-lines-complexity.files.log >> log/eslint.md

echo -e "\n## missed type definitions/signatures" >> log/eslint.md
cat log/eslint.log | grep -iE 'typedef|signature' > log/eslint.type-sig.log
wc -l log/eslint.type-sig.log >> log/eslint.md

cat log/eslint.type-sig.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.type-sig.files.log
wc -l log/eslint.type-sig.files.log >> log/eslint.md

echo -e "\n## cycle dependencies" >> log/eslint.md
cat log/eslint.log | grep -iE 'cycle' > log/eslint.cycle.log
wc -l log/eslint.cycle.log >> log/eslint.md

cat log/eslint.cycle.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.cycle.files.log
wc -l log/eslint.cycle.files.log >> log/eslint.md

cat log/eslint.md >> log/log.md
