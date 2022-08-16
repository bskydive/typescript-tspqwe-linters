############################################## CODE LINES
# copy project src folder to linter repo folder

echo -e "\n# SIZE" > log/size.md

echo -e "\n## LINES" >> log/size.md

find src/ -type f -name '*.html' -exec wc -l {} \; | awk '{ total += $1 } END {print total " html"}' >> log/size.md

find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " less|scss|css"}' >> log/size.md
find src/ -type f -name '*.less' -exec wc -l {} \; | awk '{ total += $1 } END {print total " less"}' >> log/size.md
find src/ -type f -name '*.scss' -exec wc -l {} \; | awk '{ total += $1 } END {print total " scss"}' >> log/size.md
find src/ -type f -name '*.css' -exec wc -l {} \; | awk '{ total += $1 } END {print total " css"}' >> log/size.md

find src/ -type f -name '*.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " ts"}' >> log/size.md

echo -e "\n## FILES" >> log/size.md

echo -E "`find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) | wc -l` less|scss|css" >> log/size.md

echo -e "`find src/ -type f -name '*.html' | wc -l` *.html" >> log/size.md
echo -e "`find src/ -type f -name '*.less' | wc -l` *.less" >> log/size.md
echo -e "`find src/ -type f -name '*.scss' | wc -l` *.scss" >> log/size.md
echo -e "`find src/ -type f -name '*.css' | wc -l` *.css" >> log/size.md
echo -e "`find src/ -type f -name '*.ts' | wc -l` *.ts" >> log/size.md

cat log/size.md >> log/log.md
