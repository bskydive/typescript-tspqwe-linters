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
