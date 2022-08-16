############################################# COMMENTS

echo -e "\n# COMMENTS" > log/comments.md

#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE 'TODO|FIX' {} \;  >> log/comments.todo.log
grep --include=\*.{less,scss,css,ts,html} -RiEn 'TODO|FIX' src/ > log/comments.todo.log
wc -l log/comments.todo.log >> log/comments.md

grep --include=\*.{less,scss,css,ts,html} -RiEn 'TODO|FIX' src/ > log/comments.todo.files.log
wc -l log/comments.todo.files.log >> log/comments.md
echo >> log/comments.md

#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE '/\*|//' {} \; | wc -l >> log/comments.all.log
grep --include=\*.{less,scss,css,ts,html} -RiEn '/\*|//' src/ > log/comments.all.log
wc -l log/comments.all.log >> log/comments.md

grep --include=\*.{less,scss,css,ts,html} -RiEl '/\*|//' src/ > log/comments.all.files.log
wc -l log/comments.all.files.log >> log/comments.md
echo >> log/comments.md

#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE '/\**' {} \; | wc -l >> log/comments.jsdoc.md
grep --include=\*.{less,scss,css,ts,html} -RiE '/\**' src/ > log/commants.jsdoc.log
wc -l log/commants.jsdoc.log >> log/comments.md

grep --include=\*.{less,scss,css,ts,html} -RilE '/\**' src/ > log/commants.jsdoc.files.log
wc -l log/commants.jsdoc.files.log >> log/comments.md

cat log/comments.md >> log/log.md

