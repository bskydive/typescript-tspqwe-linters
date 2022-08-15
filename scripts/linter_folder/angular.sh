
echo -e "\n# ANGULAR" > log/angular.md

grep --include=\*.ts -RiE '@component\(' src/ > log/angular.components.files.log
wc -l log/angular.components.files.log >> log/angular.md

grep --include=\*.ts -RiE '@component\(' src/ | sort | uniq -d > log/angular.components.duplicated.files.log
wc -l log/angular.components.duplicated.files.log >> log/angular.md

grep --include=\*.ts -RiE '@component\(' src/ | grep -iE '\.onpush' > log/angular.components.onpush.files.log
wc -l log/angular.components.onpush.files.log >> log/angular.md

#find src/ -type f \( -name '*component*.ts' -o -name '*pipe*.ts' -o -name '*directive*.ts'  -o -name '*spec*.ts'  -o -name '*model*.ts'  -o -name '*guard*.ts'  -o -name '*interceptor*.ts' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " component|pipe|directive"}' >> log/angular.named.files.log
grep --include=\*{component,pipe,directive,spec,model,guard,interceptor}\*.ts src/ | sort | uniq -d > log/angular.named.files.log
wc -l log/angular.named.files.log >> log/angular.md

cat log/angular.md >> log/log.md
