echo -e "\n# SPELLING FIXED" >> log/spell.md

# remove mistakes from log/spell.words.important.log
cat log/spell.words.important.log > .cspell-dict-exclude.txt

# fill dictionary
wc -l log/spell.words.important.log >> log/spell.md

# run again
npm run lint:spell > log/spell-excluded.log

cat log/spell-excluded.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell-excluded.words.log
wc -l log/spell-excluded.words.log >> log/spell.md

cat log/spell-excluded.log | grep -i word | awk -F':' '{print$1}' | sort | uniq > log/spell-excluded.uniq-files.log
wc -l  log/spell-excluded.uniq-files.log >> log/spell.md

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt

