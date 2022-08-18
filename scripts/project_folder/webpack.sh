############################################## WEBPACK

# manually collect stats and make screenshots
# disable fullTemplateTypeCheck in tsconfig.json

echo -e "\n# WEBPACK" >> log/webpack.md
echo -e " * \![](webpack-stats.jpg)" >> log/webpack.md

cat log/webpack.md >> log/log.project.md

# npm i webpack-bundle-analyzer
npm run build:analyze:view
# make the screenshots

# NX

# cp ./dist/app/name ./dist
# npm run build:analyze:view


