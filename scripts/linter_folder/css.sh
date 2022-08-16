############################################# CSS

echo -e "\n# CSS" > log/styles.md

# !choose your file type
npm run lint:scss > log/styles.log
# npm run lint:less >> log/styles.log

wc -l log/styles.log >> log/styles.md
cat log/styles.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')' | sort | uniq > log/styles.rules.uniq.log
wc -l log/styles.rules.uniq.log >> log/styles.md
cat log/styles.log | awk -F' - ' '{print $2}' | sort | uniq |less > log/styles.short.uniq.log
wc -l log/styles.short.uniq.log >> log/styles.md
cat log/styles.log | grep ':' | awk -F':' '{print $1}' |sort|uniq |less > log/styles.files.log
wc -l log/styles.files.log >> log/styles.md

cat log/styles.md >> log/log.md

# win
# grep ' ✖ ' log/styles.log | colrm 1 9 | sort | uniq | less 
# grep ' ✖ ' log/styles.log | colrm 1 9 | sort | uniq > log/styles.uniq.log
# linux
#grep ' × ' log/styles.log | colrm 1 10 | tr -s ' ' | sort | uniq | less
#grep ' × ' log/styles.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/styles.uniq.log
#grep ' ⚠ ' log/styles.log | colrm 1 10 | tr -s ' ' | sort | uniq | less
#grep -i 'src' log/styles.log | sort | uniq  > log/styles.files.log
#grep -i ' ⚠ ' log/styles.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/styles.uniq.log
#grep -iE 'Expected|Expected|invalid|:' log/styles.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/styles.uniq.log

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less
