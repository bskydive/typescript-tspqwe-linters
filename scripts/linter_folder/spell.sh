############################################## SPELLING
echo -e "\n# SPELLING" > log/spell.md

npm run lint:spell > log/spell.log
wc -l log/spell.log >> log/spell.md
#cat log/spell.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log

cat log/spell.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
wc -l log/spell.words.log >> log/spell.md

cat log/spell.words.log > log/spell.words.fixed.log
#less log/spell.words.fixed.log
echo -e "\n# SPELLING FIXED" >> log/spell.md
exit

# remove mistakes from log/spell.words.fixed.log

# fill dictionary
cat log/spell.words.fixed.log > .cspell-dict-exclude.txt
wc -l log/spell.words.fixed.log >> log/spell.md

# run again
npm run lint:spell > log/spell-excluded.log

cat log/spell-excluded.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell-excluded.words.log
wc -l log/spell-excluded.words.log >> log/spell.md

cat log/spell-excluded.log | grep -i word | awk -F':' '{print$1}' | sort | uniq > log/spell-excluded.uniq-files.log
wc -l  log/spell-excluded.uniq-files.log >> log/spell.md

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt

