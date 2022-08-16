############################################## CODE LINES
# copy project src folder to linter repo folder

echo -e "\n# SIZE" > log/size.md

#echo -E "`find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) | wc -l` less|scss|css" >> log/size.md
echo -e "`grep --include=\*\.{less,scss,css,ts,html} -R '' src/ | wc -l` all lines" >> log/size.md
echo -e "`grep --include=\*\.{less,scss,css,ts,html} -Rl '' src/ | wc -l` all files\n" >> log/size.md

#find src/ -type f -name '*.html' -exec wc -l {} \; | awk '{ total += $1 } END {print total " html"}' >> log/size.md
#echo -e "`find src/ -type f -name '*.html' | wc -l` *.html" >> log/size.md
echo -e "`grep --include=\*.html -R '' src/ | wc -l` html lines" >> log/size.md
echo -e "`grep --include=\*.html -Rl '' src/ | wc -l` html files\n" >> log/size.md

#find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " less|scss|css"}' >> log/size.md
echo -e "`grep --include=\*\.{less,scss,css} -R '' src/ | wc -l` all styles" >> log/size.md
echo -e "`grep --include=\*\.{less,scss,css} -Rl '' src/ | wc -l` all styles\n" >> log/size.md


#find src/ -type f -name '*.less' -exec wc -l {} \; | awk '{ total += $1 } END {print total " less"}' >> log/size.md
#echo -e "`find src/ -type f -name '*.less' | wc -l` *.less files" >> log/size.md
echo -e "`grep --include=\*.less -R '' src/ | wc -l` less lines" >> log/size.md
echo -e "`grep --include=\*.less -Rl '' src/ | wc -l` less files\n" >> log/size.md

#find src/ -type f -name '*.scss' -exec wc -l {} \; | awk '{ total += $1 } END {print total " scss"}' >> log/size.md
#echo -e "`find src/ -type f -name '*.scss' | wc -l` *.scss files" >> log/size.md
echo -e "`grep --include=\*.scss -R '' src/ | wc -l` scss lines" >> log/size.md
echo -e "`grep --include=\*.scss -Rl '' src/ | wc -l` scss files\n" >> log/size.md

#find src/ -type f -name '*.css' -exec wc -l {} \; | awk '{ total += $1 } END {print total " css"}' >> log/size.md
#echo -e "`find src/ -type f -name '*.css' | wc -l` *.css files" >> log/size.md
echo -e "`grep --include=\*.css -R '' src/ | wc -l` css lines" >> log/size.md
echo -e "`grep --include=\*.css -Rl '' src/ | wc -l` css files\n" >> log/size.md

#find src/ -type f -name '*.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " ts"}' >> log/size.md
#echo -e "`find src/ -type f -name '*.ts' | wc -l` *.ts files" >> log/size.md
echo -e "`grep --include=\*.ts -R '' src/ | wc -l` ts lines" >> log/size.md
echo -e "`grep --include=\*.ts -Rl '' src/ | wc -l` ts files\n" >> log/size.md

cat log/size.md >> log/log.md
