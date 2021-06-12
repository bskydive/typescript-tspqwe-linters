# utils to collect linter logs and dedupe for rules analysis
mkdir log

npm run lint:ng > log/nglint.log
#grep ' warning ' log/nglint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
grep ' warning ' log/nglint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/nglint.uniq.log

npm run lint:es > log/eslint.log
# grep ' warning ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq | less
grep ' warning ' log/eslint.log | awk -F '  warning  ' '{print $2}' | tr -s " " | sort | uniq > log/eslint.uniq.log

npm run lint:ts > log/tslint.log
# grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq | less
grep WARNING: log/tslint.log | colrm 1 16 | sort | uniq > log/tslint.uniq.log

npm run lint:scss > log/scsslint.log
# grep ' ✖ ' log/scsslint.log | colrm 1 9 | sort | uniq | less # win
# grep ' ✖ ' log/scsslint.log | colrm 1 9 | sort | uniq > log/scsslint.uniq.log # win
#grep ' × ' log/scsslint.log | colrm 1 10 | tr -s ' ' | sort | uniq | less # linux
#grep ' × ' log/scsslint.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/scsslint.uniq.log # linux
#grep ' ⚠ ' log/scsslint.log | colrm 1 10 | tr -s ' ' | sort | uniq | less # linux
grep ' ⚠ ' log/scsslint.log | colrm 1 10 | tr -s ' ' | sort | uniq  > log/scsslint.uniq.log # linux

export LINTER_PATH="coding/lint"
eslint -c ${LINTER_PATH}/.eslintrc.js --resolve-plugins-relative-to ${LINTER_PATH}/ .
stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less
cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt
