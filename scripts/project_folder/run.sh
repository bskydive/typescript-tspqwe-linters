# usage
# ./scripts/project_folder/run.sh

mkdir -p log
date > log/log/log.project.md

./scripts/project_folder/npm_scripts_add.sh
./scripts/project_folder/npm.sh
./scripts/project_folder/git.sh
./scripts/project_folder/build.angular.sh # before run enable fullTemplateTypeCheck or strictTemplates in tsconfig.json
./scripts/project_folder/webpack.sh
./lint.angular.sh # before run check that `npm run lint:ng` command works
