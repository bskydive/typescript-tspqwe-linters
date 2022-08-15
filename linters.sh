############################################## CLI UTILS
# utils to collect linter logs and dedupe for rules analysis
# see ./scripts/*.sh

less scripts/linter_folder/README.md

npm i
mkdir log
rm -rf log/*

cd scripts/linter_folder/

# ls scripts/linter_folder/
./angular.sh
./comments.sh
./css.sh
./duplicates.sh
./eslint.sh
./lines.sh
./spell.sh
./tests.sh
./tslint.sh

exit

less scripts/project_folder/README.md

cp scripts/project_folder/*.sh $project_folder/
cd $project_folder

npm i
mkdir log
rm -rf log/*

# ls scripts/project_folder/
./build.angular.sh
./git.sh
./lint.sh
./npm.sh
./webpack.sh
