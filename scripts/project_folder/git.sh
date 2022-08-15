############################################# GIT


echo -e "\n## GIT" >> log/git.md

echo -e "\n### first commits" >> log/git.md
git log --reverse --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -10 >> log/git.md

echo -e "\n### current commit" >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -1 >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | wc -l >> log/git.md

echo -e "\n### 1 year ago commit" >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' --before="2021-08-02 8:00" | head -1 >> log/git.md
git log --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' --before="2021-08-02 8:00" | wc -l >> log/git.md

echo -e "\n### authors stats" >> log/git.md
git shortlog --summary --numbered --email 
# ctrl+ins
# q
# cat >> log/git.md
# shift+ins
exit
# move *.md|log files to linter repo folder

cat log/git.md >> log/log.md
