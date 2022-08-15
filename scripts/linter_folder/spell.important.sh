echo -e "\n# SPELLING FIXED" >> log/spell.important.md

# remove mistakes from log/spell.words.important.log
cp .cspell-dict-exclude.txt .cspell-dict-exclude_`date +%H.%M.%S_%d.%m.%Y`.txt
cat log/spell.words.important.log > .cspell-dict-exclude.txt

# fill dictionary
wc -l log/spell.words.important.log >> log/spell.important.md

# run again
./scripts/linter_folder/spell.sh .important

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt

