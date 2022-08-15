cp scripts/project_folder/*.sh $project_folder/
cd $project_folder

mkdir log
# rm -rf log/*


# ls scripts/project_folder/
./scripts/project_folder/npm.sh
./scripts/project_folder/git.sh
./scripts/project_folder/build.angular.sh
./scripts/project_folder/webpack.sh
# ./lint.angular.sh
