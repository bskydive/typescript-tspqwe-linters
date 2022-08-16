

mkdir -p log
# rm -rf log/*
date > log/log.md

# ls scripts/linter_folder/
./scripts/linter_folder/size.sh
./scripts/linter_folder/comments.sh
./scripts/linter_folder/eslint.sh
./scripts/linter_folder/styles.sh
./scripts/linter_folder/tests.sh
./scripts/linter_folder/angular.sh
./scripts/linter_folder/duplicates.sh
./scripts/linter_folder/spell.sh
# ./scripts/linter_folder/tslint.sh

# manually edit the eslint.rules.important.log
# ./scripts/linter_folder/eslint.important.sh

# remove mistakes from log/spell.words.important.log
# ./scripts/linter_folder/spell.important.sh

