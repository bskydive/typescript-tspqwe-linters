############################################# CSS

echo -e "\n# CSS" > log/css.md

# !choose your file type
npm run lint:scss > log/css.log
# npm run lint:less >> log/css.log

wc -l log/css.log >> log/css.md
cat log/css.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')' | sort | uniq > log/css.rules.uniq.log
wc -l log/css.rules.uniq.log >> log/css.md
cat log/css.log | awk -F' - ' '{print $2}' | sort | uniq |less > log/css.short.uniq.log
wc -l log/css.short.uniq.log >> log/css.md
cat log/css.log | grep ':' | awk -F':' '{print $1}' |sort|uniq |less > log/css.files.log
wc -l log/css.files.log >> log/css.md

cat log/css.md >> log/log.md

# win
# grep ' ✖ ' log/css.log | colrm 1 9 | sort | uniq | less 
# grep ' ✖ ' log/css.log | colrm 1 9 | sort | uniq > log/css.uniq.log
# linux
#grep ' × ' log/css.log | colrm 1 10 | tr -s ' ' | sort | uniq | less
#grep ' × ' log/css.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/css.uniq.log
#grep ' ⚠ ' log/css.log | colrm 1 10 | tr -s ' ' | sort | uniq | less
#grep -i 'src' log/css.log | sort | uniq  > log/css.files.log
#grep -i ' ⚠ ' log/css.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/css.uniq.log
#grep -iE 'Expected|Expected|invalid|:' log/css.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/css.uniq.log

# external linter, run in project folder
# export LINTER_PATH="coding/lint"
# stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less
