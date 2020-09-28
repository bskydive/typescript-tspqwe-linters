# README

## What is it?

Live lint libs collection and code [review template](./code-review.md).

## What is it for?

1. Collect and reuse:
	* working live linters config files
	* typical code review issues based on linter rules
1. Provide an alternative to airbnb/google rule sets. Enterprise rule sets made to fit any project and reduce enabled rules as much as it possible.
1. Give a handy tool set to begin code conventions automation

## How to use with existed eslint in project

 * `export LINTER_PATH=./`
 * You can use `// prettier-ignore` before line/class/method
 * CLI variant works fine, but For setting linters work in IDE you should:
	* remove local eslint
		```bash
			rm .eslintrc.js
			npm rm eslint @angular-eslint/builder @angular-eslint/eslint-plugin @angular-eslint/eslint-plugin-template @angular-eslint/schematics @angular-eslint/template-parser @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-compat
		```
	* revert `package*.json` changes
	* Don't forgot to repair local `.eslintrc` before commit!
	* install linters globally
	```bash
		npm i -g \
		typescript \
		tslint \
		eslint \
		stylelint \
		npm-run-all \
		cspell
	```
	* use project related IDE config `./.vscode/*`
	* enable using global eslint in IDE

## TODO

 * sonarlint docker
 * Angular code examples
