############################################## SPELLING
echo -e "\n# SPELLING" > log/spell.md

npm run lint:spell 2>log/spell.summary.log > log/spell.log
tail -n 1 log/spell.summary.log >> log/spell.md

cat log/spell.log | tail -n +4 | grep -v '^[[:blank:]]*$'> log/spell.issues.log
wc -l log/spell.issues.log >> log/spell.md
#cat log/spell.issues.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log

cat log/spell.issues.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
wc -l log/spell.words.log >> log/spell.md

cat log/spell.words.log > log/spell.words.important.log

cat log/spell.md >> log/log.md
