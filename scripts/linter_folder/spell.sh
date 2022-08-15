############################################## SPELLING
echo -e "\n# SPELLING" > log/spell.md

npm run lint:spell > log/spell.log
wc -l log/spell.log >> log/spell.md
#cat log/spell.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log

cat log/spell.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
wc -l log/spell.words.log >> log/spell.md

cat log/spell.words.log > log/spell.words.important.log

