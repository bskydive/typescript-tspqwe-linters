echo -e "\n# STYLES important" > log/styles.important.md

echo -e "\n## after manual editing of the eslint.rules.log" >> log/eslint.important.md

# manually edit the log/styles.rules.important.log

grep -f log/styles.rules.important.log log/styles.log | sort | uniq > log/styles.important.log
wc -l log/styles.important.log >> log/styles.important.md

cat log/styles.important.log | awk -F' - ' '{print $2}' | sort | uniq > log/styles.important.short.log
wc -l log/styles.important.short.log >> log/styles.important.md

cat log/styles.important.log | grep ':' | awk -F':' '{print $1}' | sort | uniq > log/styles.important.files.log
wc -l log/styles.important.files.log >> log/styles.important.md

cat log/styles.important.md >> log/log.md
