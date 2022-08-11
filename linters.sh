# utils to collect linter logs and dedupe for rules analysis
mkdir log
rm -rf log/*

############################################## CODE LINES
# copy project src folder to linter repo folder

echo -e "\n# SIZE" >> log/log.md

echo -e "\n## LINES" >> log/log.md

find src/ -type f -name '*.html' -exec wc -l {} \; | awk '{ total += $1 } END {print total " html"}' >> log/log.md

find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " less|scss|css"}' >> log/log.md
find src/ -type f -name '*.less' -exec wc -l {} \; | awk '{ total += $1 } END {print total " less"}' >> log/log.md
find src/ -type f -name '*.scss' -exec wc -l {} \; | awk '{ total += $1 } END {print total " scss"}' >> log/log.md
find src/ -type f -name '*.css' -exec wc -l {} \; | awk '{ total += $1 } END {print total " css"}' >> log/log.md

find src/ -type f -name '*.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " ts"}' >> log/log.md

echo -e "\n## FILES" >> log/log.md

echo -E "`find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) | wc -l` less|scss|css" >> log/log.md

echo -e "`find src/ -type f -name '*.html' | wc -l` *.html" >> log/log.md
echo -e "`find src/ -type f -name '*.less' | wc -l` *.less" >> log/log.md
echo -e "`find src/ -type f -name '*.scss' | wc -l` *.scss" >> log/log.md
echo -e "`find src/ -type f -name '*.css' | wc -l` *.css" >> log/log.md
echo -e "`find src/ -type f -name '*.ts' | wc -l` *.ts" >> log/log.md

############################################# COMMENTS
# copy project src folder to linter repo folder

echo -e "\n# COMMENTS" >> log/comments.md

echo -e "\n## TODO count" >> log/comments.md
find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE 'TODO|FIXME' {} \; | wc -l >> log/comments.md

echo -e "\n## comment|JSDOC count" >> log/comments.md
#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE '/\*|//' {} \; | wc -l >> log/comments.md
grep --include=\*.{less,scss,css,ts,html} -RiE '/\*|//' src/ | wc -l >> log/comments.md

echo -e "\n## comment|JSDOC count FILES" >> log/comments.md
grep --include=\*.{less,scss,css,ts,html} -RilE '/\*|//' src/ | wc -l >> log/comments.md

echo -e "\n## JSDOC count" >> log/comments.md
#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE '/\**' {} \; | wc -l >> log/comments.md
grep --include=\*.{less,scss,css,ts,html} -RiE '/\**' src/ | wc -l >> log/comments.md

echo -e "\n## JSDOC count FILES" >> log/comments.md
grep --include=\*.{less,scss,css,ts,html} -RilE '/\**' src/ | wc -l >> log/comments.md

cat log/comments.md >> log/log.md

echo -e "\n## TODO list" >> log/comments.md
find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE 'TODO|FIXME' {} \; >> log/comments.md

echo -e "\n## comment|JSDOC list" >> log/comments.md
grep --include=\*.{less,scss,css,ts,html} -RiEn '/\**' src/ | wc -l >> log/comments.md


############################################## PACKAGE
# run in project folder
# edit file after copying

echo -e "\n# PACKAGE" >> log/package.md

echo -e "\n## Dependencies" >> log/package.md
cat package.json | tr -d '",:{}' >> log/package.md
# edit file package.md
exit

cat log/dependencies.md >> log/log.md

############################################# GIT
# run in project folder

echo -e "\n## GIT" >> log/git.md

echo -e "\n### first commits" >> log/git.md
git log --reverse --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -10 >> log/git.md

echo -e "\n### current commit" >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -1 >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | wc -l >> log/git.md

echo -e "\n### 1 year ago commit" >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' --before="2021-08-02 8:00" | head -1 >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' --before="2021-08-02 8:00" | wc -l >> log/git.md

echo -e "\n### authors stats" >> log/git.md
git shortlog --summary --numbered --email 
# ctrl+ins
# q
# cat >> log/git.md
# shift+ins
exit
# move *.md|log files to linter repo folder

cat log/git.md >> log/log.md


############################################# ES LINT
# copy project src folder to linter repo folder

npm run lint:es
# grep ' warning ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
#grep -iE ' warning | error ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/eslint.uniq.log
echo -e "\n# eslint" >> log/log.md
echo -e "" >> log/log.md

# all rules
cat log/eslint.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.files.log
tail -n1 log/eslint.log >> log/log.md
wc -l log/eslint.files.log >> log/log.md
cat log/eslint.log | awk -F':' '{print $3}' | sort | uniq > log/eslint.issues.log
wc -l log/eslint.issues.log >> log/log.md
cat log/eslint.log | awk -F':' '{print $2}' | sort | uniq > log/eslint.rules.log 
wc -l log/eslint.rules.log  >> log/log.md

# max-lines
cat log/eslint.log | grep -i max-lines > log/eslint.max-lines.log
wc -l log/eslint.max-lines.log >> log/log.md
cat log/eslint.max-lines.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines.files.log
wc -l log/eslint.max-lines.files.log >> log/log.md

# complexity
cat log/eslint.log | grep -i complexity > log/eslint.complexity.log
wc -l log/eslint.complexity.log >> log/log.md
cat log/eslint.complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.complexity.files.log
wc -l log/eslint.complexity.files.log >> log/log.md

# complexity and max-lines
echo -e "\n## complexity and max-lines" >> log/log.md
cat log/eslint.log | grep -iE 'max-lines|complexity' > log/eslint.max-lines-complexity.log
wc -l log/eslint.max-lines-complexity.log >> log/log.md
cat log/eslint.max-lines-complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines-complexity.files.log
wc -l log/eslint.max-lines-complexity.files.log >> log/log.md

# missed type definitions/signatures
echo -e "\n## missed type definitions/signatures" >> log/log.md
cat log/eslint.log | grep -iE 'typedef|signature' > log/eslint.type-sig.log
wc -l log/eslint.type-sig.log >> log/log.md
cat log/eslint.type-sig.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.type-sig.files.log
wc -l log/eslint.type-sig.files.log >> log/log.md

#cycle dependencies
echo -e "\n## cycle dependencies" >> log/log.md
cat log/eslint.log | grep -iE 'cycle' > log/eslint.cycle.log
wc -l log/eslint.cycle.log >> log/log.md
cat log/eslint.cycle.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.cycle.files.log
wc -l log/eslint.cycle.files.log >> log/log.md


# after manual editing of the eslint.rules.log > eslint.rules.important.log
echo -e "\n## after manual editing of the eslint.rules.log" >> log/log.md
grep -ef log/eslint.rules.important.log log/eslint.log > log/eslint.important.log
wc -l  log/eslint.important.log >> log/log.md
cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.important.files.log
wc -l log/eslint.important.files.log >> log/log.md

############################################# TS LINT

echo -e "\n# TSLINT" >> log/log.md
exit
npm run lint:ts > log/tslint.log
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq | less
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq > log/tslint.uniq.log
cat log/tslint.log | awk -F'(' '{print $1}' | sort | uniq > log/tslint.files.log
wc -l log/tslint.files.log >> log/log.md
cat log/tslint.log | awk -F':' '{print $3}' | sort | uniq > log/tslint.issues.log
wc -l log/tslint.issues.log >> log/log.md
cat log/tslint.log | awk -F':' '{print $2}' | sort | uniq > log/tslint.rules.log 
wc -l log/tslint.rules.log >> log/log.md


############################################# CSS

echo -e "\n# CSS" >> log/log.md

# !choose your file type or statistics will be doublesized
npm run lint:scss > log/css.log

npm run lint:less >> log/css.log

cat log/css.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')'|sort|uniq> log/css.rules.uniq.log
wc -l log/css.rules.uniq.log >> log/log.md
cat log/css.log | awk -F' - ' '{print $2}' | sort | uniq |less > log/css.short.uniq.log
wc -l log/css.short.uniq.log >> log/log.md
cat log/css.log | grep ':' | awk -F':' '{print $1}' |sort|uniq |less > log/css.files.log
wc -l log/css.files.log >> log/log.md

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

############################################# NPM AUDIT
# run in project folder or add all libs in package.json
# run `npm i` before

npm audit > log/audit.log

grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | less
grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log
# edit file
exit

echo -e "\n# NPM AUDIT" >> log/log.md
cat log/audit.parsed.log >> log/log.md

############################################# ANGULAR

echo -e "\n# ANGULAR" >> log/log.md
exit

# tslint
# if tslint exists, old angular lib
# npm run lint:ng 2>&1 > log/nglint.log
# grep ' warning ' log/nglint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/nglint.uniq.log


# enable fullTemplateTypeCheck or strictTemplates in tsconfig.json
# logs output don't work because all errors in stderr, copied manually
# clear console
clear
npm run build 2>&1 > log/ngbuild.log
# save console output to log/build.log
grep -iE 'error TS' log/build.log > log/build.errors.log
wc -l log/build.errors.log >> log/log.md

cat log/build.errors.log | awk -F':' '{print$1}' | sort | uniq > log/build.errors.files.log
wc -l log/build.errors.files.log >> log/log.md

grep -iE 'error TS' log/build.log | awk -F' TS' '{print$2}' | awk -F':' '{print$1}' | sort | uniq > log/build.ts-numbers.ts
wc -l log/build.ts-numbers.ts >> log/log.md
#less log/build.ts-numbers.ts


############################################## UNIT TEST COVERAGE

# run here or add to project package.json
#"test-coverage": "ng test --browsers=Chrome  --codeCoverage=true --watch=false",
#"test-headless": "ng test --browsers=ChromeHeadlessNoSandbox --codeCoverage=true --progress=true",

echo -e "\n# UNIT TEST COVERAGE" >> log/test.md
find src/ -type f -name '*spec.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " spec.ts"}' >> log/test.md
find src/ -type f \( -name '*component*.ts' -o -name '*service*.ts' -o -name '*directive*.ts' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " component|service|directive"}' >> log/test.md

cat log/test.md >> log/log.md

# npm run test > log/test.log
# npm run test-headless > log/test.log

# npm run e2e > log/e2e.log > log/test.log

# npm run test-coverage
# see ./coverage/index.html

# nx test --coverage
# see https://nx.dev/packages/jest#code-coverage
# add to package.json
# "test": "nx run-many --target=test --all --parallel --browsers=ChromeHeadless --codeCoverage --skip-nx-cache",

# also you can calculate spec files comapring to overall ts files lines count
# target value 1:1


############################################## WEBPACK

# disable fullTemplateTypeCheck in tsconfig.json
# execute in project folder or move and install all npm dependencies
echo -e "\n# WEBPACK" >> log/log.md
echo -e "copy stats in dist/stats.json" >> log/log.md
echo -e " * \![](webpack-stats.jpg)" >> log/log.md
echo -e " * \![](webpack-stats1.jpg)" >> log/log.md

# "build": "ng build  --aot --prod",
# "build:analyze": "ng build --stats-json",
# "webpack:build":"webpack --profile --json > dist/stats.json",
# "webpack:analyze:view": "webpack-bundle-analyzer dist/stats.json",

# npm i webpack-bundle-analyzer
# npm run build:analyze:view
# make the screenshots

# "build-stats": "nx build name --configuration production --stats-json",
# cp ./dist/app/name ./dist
# npm run build:analyze:view

############################################## COPY PASTE

# you need at least one commit in local git repo
# copy .jscpd* config files if you want to run in project folder
# npm i jscpd jscpd-badge-reporter
echo -e "\n# COPY PASTE" >> log/jscpd.md

echo -e "\n# All" >> log/jscpd.md
npm run lint:cp
cat log/jscpd/jscpd-report.md >> log/jscpd.md

echo -e "\n# Html" >> log/jscpd.md
npm run lint:cp-html
cat log/jscpd-html/jscpd-report.md >> log/jscpd.md

echo -e "\n# CSS" >> log/jscpd.md
npm run lint:cp-css
cat log/jscpd-css/jscpd-report.md >> log/jscpd.md

echo -e "\n# TS" >> log/jscpd.md
npm run lint:cp-ts
cat log/jscpd-ts/jscpd-report.md >> log/jscpd.md

cat log/jscpd.md >> log/log.md

############################################## SPELLING
echo -e "\n# SPELLING" >> log/log.md

npm run lint:spell > log/spell.log
#
wc -l log/spell.log >> log/log.md
#cat log/spell.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
cat log/spell.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell.words.log
wc -l log/spell.words.log >> log/log.md
cat log/spell.words.log > log/spell.words.fixed.log
#less log/spell.words.fixed.log
echo -e "\n# SPELLING FIXED" >> log/log.md
exit

# remove mistakes from log/spell.words.fixed.log

# fill dictionary
cat log/spell.words.fixed.log >> .cspell-dict-exclude.txt
wc -l log/spell.words.fixed.log >> log/log.md

# run again
npm run lint:spell > log/spell-excluded.log
cat log/spell-excluded.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell-excluded.words.log
wc -l log/spell-excluded.words.log >> log/log.md
cat log/spell-excluded.log | grep -i word | awk -F':' '{print$1}' | sort | uniq > log/spell-excluded.uniq-files.log
wc -l  log/spell-excluded.uniq-files.log >> log/log.md

############################################## CLI UTILS
exit

export LINTER_PATH="coding/lint"
eslint -c ${LINTER_PATH}/.eslintrc.js --resolve-plugins-relative-to ${LINTER_PATH}/ .
stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less
cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt
