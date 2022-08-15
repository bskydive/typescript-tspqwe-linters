############################################## COPY PASTE

# you need at least one commit in local git repo
# copy .jscpd* config files if you want to run in project folder
# npm i jscpd jscpd-badge-reporter
echo -e "\n# COPY PASTE" >> log/duplicates.md

echo -e "\n# All" >> log/duplicates.md
npm run lint:cp
cat log/jscpd/jscpd-report.md >> log/duplicates.md

echo -e "\n# Html" >> log/duplicates.md
npm run lint:cp-html
cat log/jscpd-html/jscpd-report.md >> log/duplicates.md

echo -e "\n# CSS" >> log/duplicates.md
npm run lint:cp-css
cat log/jscpd-css/jscpd-report.md >> log/duplicates.md

echo -e "\n# TS" >> log/duplicates.md
npm run lint:cp-ts
cat log/jscpd-ts/jscpd-report.md >> log/duplicates.md

cat log/duplicates.md >> log/log.md
