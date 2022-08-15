############################################## UNIT TEST COVERAGE

# run here or add to project package.json
#"test-coverage": "ng test --browsers=Chrome  --codeCoverage=true --watch=false",
#"test-headless": "ng test --browsers=ChromeHeadlessNoSandbox --codeCoverage=true --progress=true",

echo -e "\n# UNIT TEST COVERAGE" > ../../log/test.md
find src/ -type f -name '*spec.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " spec.ts"}' >> ../../log/test.md
#find src/ -type f \( -name '*component*.ts' -o -name '*service*.ts' -o -name '*directive*.ts' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " component|service|directive"}' >> ../../log/test.md
echo -e "`find src/ -type f -name '*spec.ts' | wc -l` *spec.ts" >> ../../log/test.md

grep --include=\*spec.ts -RiE 'xit\(|xdescribe\(' src/ >> test.disabled.log
cat test.disabled.log | wc -l >> ../../log/test.disabled.md

cat log/test.md >> ../../log/log.md

# npm run test > ../../log/test.log
# npm run test-headless > ../../log/test.log

# npm run e2e > ../../log/e2e.log > ../../log/test.log

# npm run test-coverage
# see ./coverage/index.html

# nx test --coverage
# see https://nx.dev/packages/jest#code-coverage
# add to package.json
# "test": "nx run-many --target=test --all --parallel --browsers=ChromeHeadless --codeCoverage --skip-nx-cache",

# also you can calculate spec files comapring to overall ts files lines count
# target value 1:1
