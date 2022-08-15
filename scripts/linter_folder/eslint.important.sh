echo -e "\n# eslint important" > log/eslint.important.md
echo -e "\n## after manual editing of the eslint.rules.log" >> log/eslint.important.md

# manually edit the eslint.rules.important.log

grep -ef log/eslint.rules.important.log log/eslint.log > log/eslint.important.log
wc -l  log/eslint.important.log >> log/eslint.important.md
cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.important.files.log
wc -l log/eslint.important.files.log >> log/eslint.important.md

cat log/eslint.important.md >> log/log.md

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# eslint -c ${LINTER_PATH}/.eslintrc.js --resolve-plugins-relative-to ${LINTER_PATH}/ .