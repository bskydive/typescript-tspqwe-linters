############################################## CLI UTILS
# utils to collect linter logs and dedupe for rules analysis
# see ./scripts/*.sh

less scripts/linter_folder/README.md

# npm i
mkdir log
# rm -rf log/*

# ls scripts/linter_folder/
./scripts/linter_folder/lines.sh
./scripts/linter_folder/comments.sh
./scripts/linter_folder/eslint.sh
./scripts/linter_folder/css.sh
./scripts/linter_folder/tests.sh
./scripts/linter_folder/angular.sh
./scripts/linter_folder/duplicates.sh
./scripts/linter_folder/spell.sh
# ./tslint.sh

exit

less scripts/project_folder/README.md

cp scripts/project_folder/*.sh $project_folder/
cd $project_folder

npm i
mkdir log
# rm -rf log/*

# ls scripts/project_folder/
./scripts/project_folder/npm.sh
./scripts/project_folder/git.sh
./scripts/project_folder/build.angular.sh
./scripts/project_folder/webpack.sh
# ./lint.angular.sh
