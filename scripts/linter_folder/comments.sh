############################################# COMMENTS

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
