# prepare project for linting
# usage
# cd typescript-tspqwe-linter
# ./scripts/project_folder/prepare.sh "path_to_project"

project_folder=$1
mkdir -p log
[[ -z $1 ]] && echo "invalid path to project in cli parameters" | tee -a log/log.project.md && exit

cp ./scripts \"${project_folder}\" || echo "run script from the typescript-tspqwe-linters folder" tee -a log/log.project.md && exit
cd ${project_folder}
# npm i

# check npm version and add scripts to package.json
# npm v7+ required to add scripts via cli

[[ `npm -v | awk -F'.' '{print $1}'` -lt 7 ]] && echo "npm version `npm -v` less than 7, add scripts manually or switch to node v15+" | tee -a log/log.project.md
[[ `npm -v | awk -F'.' '{print $1}'` -lt 7 ]] && exit

npm set-script "webpack:analyze:view" "webpack-bundle-analyzer dist/stats.json" 
# npm set-script "build" "ng build  --aot --prod",
npm set-script "build:analyze" "ng build --stats-json"
npm set-script "webpack:build" "webpack --profile --json > dist/stats.json"
npm set-script "webpack:analyze:view" "webpack-bundle-analyzer dist/stats.json"
npm set-script "lint:ng" "ng lint"

# NX
npm set-script "build-stats" "nx build name --configuration production --stats-json"

