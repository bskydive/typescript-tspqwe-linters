# utils to collect linter logs and dedupe for rules analysis
mkdir log
rm -rf log/*

npm run lint:ng 2>&1 > log/nglint.log
#grep ' warning ' log/nglint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
grep ' warning ' log/nglint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/nglint.uniq.log

# eslint
npm run lint:es
# grep ' warning ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
#grep -iE ' warning | error ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/eslint.uniq.log
cat log/eslint.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.files.log
wc -l log/eslint.files.log
cat log/eslint.log | awk -F':' '{print $3}' | sort | uniq > log/eslint.issues.log
wc -l log/eslint.issues.log
cat log/eslint.log | awk -F':' '{print $2}' | sort | uniq > log/eslint.rules.log 
wc -l log/eslint.rules.log 

cat log/eslint.log | grep -i max-lines > log/eslint.max-lines.log
cat log/eslint.max-lines.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines.files.log
wc -l log/eslint.max-lines.files.log

cat log/eslint.log | grep -i complexity > log/eslint.complexity.log
wc -l log/eslint.complexity.log
cat log/eslint.complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.complexity.files.log
wc -l log/eslint.complexity.files.log

# complexity and max-lines
cat log/eslint.log | grep -iE 'max-lines|complexity' > log/eslint.max-lines-complexity.log
wc -l log/eslint.max-lines-complexity.log
cat log/eslint.max-lines-complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines-complexity.files.log
wc -l log/eslint.max-lines-complexity.files.log

# missed type definitions/signatures
cat log/eslint.log | grep -iE 'typedef|signature' > log/eslint.type-sig.log
wc -l log/eslint.type-sig.log
cat log/eslint.type-sig.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.type-sig.files.log
wc -l log/eslint.type-sig.files.log

#cycle dependencies
cat log/eslint.log | grep -iE 'cycle' > log/eslint.cycle.log
wc -l log/eslint.cycle.log
cat log/eslint.cycle.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.cycle.files.log
wc -l log/eslint.cycle.files.log


# after manual editing of the eslint.rules.log
grep -ef log/eslint.rules.important.log log/eslint.log > log/eslint.important.log
wc -l  log/eslint.important.log
cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.important.files.log
wc -l log/eslint.important.files.log


npm run lint:ts > log/tslint.log
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq | less
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq > log/tslint.uniq.log
cat log/tslint.log | awk -F'(' '{print $1}' | sort | uniq > log/tslint.files.log
wc -l log/tslint.files.log
cat log/tslint.log | awk -F':' '{print $3}' | sort | uniq > log/tslint.issues.log
wc -l log/tslint.issues.log
cat log/tslint.log | awk -F':' '{print $2}' | sort | uniq > log/tslint.rules.log 
wc -l log/tslint.rules.log




npm run lint:scss > log/css.log
npm run lint:less > log/css.log
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

cat log/css.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')'|sort|uniq> log/css.rules.uniq.log
wc -l log/css.rules.uniq.log
cat log/css.log | awk -F' - ' '{print $2}' | sort | uniq |less > log/css.short.uniq.log
wc -l log/css.short.uniq.log
cat log/css.log | grep ':' | awk -F':' '{print $1}' |sort|uniq |less > log/css.files.log
wc -l log/css.files.log

npm audit > log/audit.log
# 
grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | less
grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log

# clear console
clear
npm run build
# save console output to log/build.log
grep -iE 'error TS' log/build.log > log/build.errors.log
wc -l log/build.errors.log
less log/build.errors.log
cat log/build.errors.log | awk -F':' '{print$1}' | sort | uniq > log/build.errors.files.log
wc -l log/build.errors.files.log
grep -iE 'error TS' log/build.log | awk -F' TS' '{print$2}' | awk -F':' '{print$1}' | sort | uniq > log/build.ts-numbers.ts
wc -l log/build.ts-numbers.ts
less log/build.ts-numbers.ts

# disable fullTemplateTypeCheck in tsconfig.json
npm run build:analyze
# watch stats

npm run test > log/test.log
# npm run test-headless

npm run e2e > log/e2e.log
# 

npm run test-coverage
# 

npm run lint:cp
npm run lint:cp-html
npm run lint:cp-css
npm run lint:cp-ts
# 

npm run lint:spell > log/spell.log
#
cat log/spell.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
less log/spell.words.log
cat >> log/spell.words.log .cspell-dict-exclude.txt

# remove mistakes from .cspell-dict-exclude.txt
# run again
npm run lint:spell > log/spell.log
cat log/spell.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
less log/spell.words.log


find src/ -type f -name '*.html' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'
find src/ -type f -name '*.less' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'
find src/ -type f -name '*.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total}'


export LINTER_PATH="coding/lint"
eslint -c ${LINTER_PATH}/.eslintrc.js --resolve-plugins-relative-to ${LINTER_PATH}/ .
stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less
cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt
