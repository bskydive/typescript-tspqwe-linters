############################################## SPELLING
# for second run we should get the new file name from command line parameter
postfix=""
[[ -z ${1} ]] || postfix=${1}


echo -e "\n# SPELLING${postfix}" > log/spell${postfix}.md

npm run lint:spell 2>log/spell${postfix}.summary.log > log/spell${postfix}.log
tail -n 1 log/spell${postfix}.summary.log >> log/spell${postfix}.md

cat log/spell${postfix}.log | tail -n +4 | grep -v '^[[:blank:]]*$'> log/spell${postfix}.issues.log
wc -l log/spell${postfix}.issues.log >> log/spell${postfix}.md
#cat log/spell${postfix}.issues.log | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell${postfix}.words.log

cat log/spell${postfix}.issues.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq > log/spell${postfix}.words.log
wc -l log/spell${postfix}.words.log >> log/spell${postfix}.md

cat log/spell${postfix}.log | grep -i word | awk -F':' '{print$1}' | sort | uniq > log/spell${postfix}.files.log
wc -l  log/spell${postfix}.files.log >> log/spell${postfix}.md

cat log/spell${postfix}.words.log > log/spell${postfix}.words.important.log

cat log/spell${postfix}.md >> log/log.md
