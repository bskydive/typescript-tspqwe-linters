# README

## What is it?

1. Lint libs collection and code [review template](./code-review.template.md).
1. The handy tool set to begin code conventions automation
1. [Live](https://stackblitz.com/edit/typescript-tspqwe-linters?file=README.md) linting playground(TODO)
	* [eslint](https://eslint.org/) - js/ts linter with plugins: typescript, angular, promise, react
	* [tslint](https://github.com/palantir/tslint) - still useful(finnish notation)
	* [stylelint](https://stylelint.io/) - css
	* [cspell](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) - spelling
	* [prettier](https://prettier.io/) - formatter
	* [sonar](https://www.sonarqube.org/) - code quality(TODO)

## What is it for?

1. Collect and reuse:
	* working live linters config files
	* typical code review issues based on linter rules
1. Provide an alternative to airbnb/google rule sets. Enterprise rule sets made to fit any project and reduce enabled rules as much as it possible.

## How to use with existed eslint in project

 * CLI runs from your project folder
	* `cd your_project_path`
	* workaround to fix duplicate linter versions and condigs: `rm -rf node_modules`
	* `export LINTER_PATH="coding/lint"`
	* `eslint -c ${LINTER_PATH}/.eslintrc.js --resolve-plugins-relative-to ${LINTER_PATH}/ .`
	* `stylelint --config ${LINTER_PATH}/.stylelintrc.json --syntax css-in-js ./**/*.tsx | grep ' ⚠ ' | colrm 1 10 | tr -s ' ' | sort | uniq | less`
	* `cspell -uc ${LINTER_PATH}/.cspell.json ./*.* | awk -F 'Unknown word ' '{print $2}' | tr -d '()' > .cspell-dict-exclude.txt`
 * CLI runs from linters folder
	* `cd typescript-tspqwe-linters`
	* `cp your_project_path/src ./src`
	* `npm run lint:all`
 * Disabling linter rules in IDE and CLI:
 	* `// prettier-ignore` before line/class/method
	* eslint
	```ts
	/* eslint-disable */

	/* eslint-enable */
	```
	* `tslint`
	```ts
	/* tslint:disable */
	```
 * Enable external  linters in IDE:
	* remove local eslint
		```bash
			rm .eslintrc.js
			npm rm eslint @angular-eslint/builder @angular-eslint/eslint-plugin @angular-eslint/eslint-plugin-template @angular-eslint/schematics @angular-eslint/template-parser @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-plugin-compat
		```
	* revert `package*.json` changes
	* Don't forgot to repair local `.eslintrc` before commit!
	* instal  linters globally
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
 * Find how make live cloud playground useful https://stackblitz.com/edit/typescript-tspqwe-linters
 * badges
