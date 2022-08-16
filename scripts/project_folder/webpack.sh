############################################## WEBPACK

# manually collect stats and make screenshots
# disable fullTemplateTypeCheck in tsconfig.json

echo -e "\n# WEBPACK" >> log/webpack.md
echo -e "copy stats in dist/stats.json" >> log/webpack.md
echo -e " * \![](webpack-stats.jpg)" >> log/webpack.md
echo -e " * \![](webpack-stats1.jpg)" >> log/webpack.md

cat log/webpack.md >> log/log.project.md

# "build": "ng build  --aot --prod",
# "build:analyze": "ng build --stats-json",
# "webpack:build":"webpack --profile --json > dist/stats.json",
# "webpack:analyze:view": "webpack-bundle-analyzer dist/stats.json",

# npm i webpack-bundle-analyzer
# npm run build:analyze:view
# make the screenshots

# "build-stats": "nx build name --configuration production --stats-json",
# cp ./dist/app/name ./dist
# npm run build:analyze:view


