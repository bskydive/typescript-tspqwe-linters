##  [SOME] project details

* [disclaimer](disclaimer.md)
* [summary](summary.md)

### Spelling

There a re lot of mistakes, you should collect your own exclude file before make decisions. But after that you can find really important mistakes.

Severity: low

* Issues in: `cspell.log`
* Exclude words dictionary: `.cspell-dict-exclude.txt`
* 2 uniq words with mistakes in `spell.words.log`
* Check by: `npm run lint:spell`

Recommendations

1. Use direct web links. Indirect reference can became broken due to overtime limitations. Broken direct links much easier to detect
	* line: `index.ts:10`
	* example: bit.ly --> github.com/foo --> `This file has moved here`: https://github.com/bar
1. Use spell check in IDE to prevent refactoring/naming issues
	* https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
	* https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker-russian

### CSS Styles

There are lot of issues, but most of them are about formatting.
Select rules, that most important to you and add to stylelintrc config

Severity: low

 * 3 Issues in log/css.log
 * 1 Uniq files in log/css.files.log
 * 1 Uniq issues in log/css.short.uniq.log
 * 1 Uniq violated rules in log/css.rules.uniq.log
 * Check by: `npm run lint:css`

1. Unexpected named color "red" - use scss variables
	* rule: [color-named](https://stylelint.io/user-guide/rules/color-named)
	* line: `index.scss:4`
	* example: `border: 0 0 0px 0 solid red;`

## Copy/paste detection report

Severity: moderate

Check by: `npm run lint:cp`

Code duplicates increase hidden bugs risk, missed during refactoring.

* See [full report](log/jscpd/html/index.html)
* Duplications detection: Found 2 exact clones with 42(5.75%) duplicated lines in 10 (3 formats) files.
* jscpd found too many duplicates 10 over threshold 0.1%
* configurable threshold located in the `.jscpd.json`
* CSS: 1% 
	- Anallyzed 2 files
	- 2 exact clones with 2 duplicated lines
* HTML: 1%
	- Anallyzed 2 files
	- 2 exact clones with 2 duplicated lines
* TS: 1%
	- Anallyzed 2 files
	- 2 exact clones with 2 duplicated lines

| Format     | Files analyzed | Total lines | Total tokens | Clones found | Duplicated lines | Duplicated tokens |
| ---------- | -------------- | ----------- | ------------ | ------------ | ---------------- | ----------------- |
| typescript | 2              | 70          | 661          | 1            | 21 (30%)         | 279 (42.21%)      |
| javascript | 7              | 653         | 4056         | 1            | 21 (3.22%)       | 278 (6.85%)       |
| scss       | 1              | 8           | 49           | 0            | 0 (0%)           | 0 (0%)            |
| **Total:** | **10**         | **731**     | **4766**     | **2**        | **42 (5.75%)**   | **557 (11.69%)**  |


## React

Severity: moderate

Framework related issues

1. Configure [eslint rule plugin](https://github.com/yannickcr/eslint-plugin-react#configuration)

## Angular

Severity: moderate

Framework related issues

Hidden issues in production env

 * Build with strictTemplates and fullTemplateTypeCheck enabled
	* 0 of 5 files
	* +0% from last year
	* 1 TS error types
		* TS2322

Performance issues risk

 * Search for *.ts without onPush: (filesCountWithTemplateUrl - filesCountWithOnPush)
	* 0 of 5 files
	* +0% from last year

Unmaintainable code, async racing risks, potentionally broken unsubscribers, broken type definitions and tight coupling inheritance

 * Obsolete libraries
	* 0 of 5 files
	* +0% from last year
 * Self-made routing/store
	* 0 of 5 files
	* +0% from last year

High complexity can cause huge task estimation shifting

 * Business logic complexity
	* ngrx 
		* stores interconnection
		* actions count
		* actions chains length
	* services 
		* chains length in services
		* services chains length

## Dependencies graph

	* using nx
		* https://nx.dev/structure/dependency-graph
 	* using compodoc
	 	* https://github.com/compodoc/compodoc
	* using [dot language](https://graphviz.gitlab.io/_pages/doc/info/lang.html) and render with [graphviz](https://graphviz.gitlab.io/)
		* https://railsware.com/blog/how-to-analyze-circular-dependencies-in-es6/
	* using webpack 
		* https://www.npmjs.com/package/circular-dependency-plugin
		* https://www.npmjs.com/package/webpack-dependency-tree
		* https://webpack.js.org/configuration/stats/#root
		* https://github.com/heypoom/webpack-dep-graph
 	* Cycle dependencies
		* 0 of 5 files
		* +0% from last year
	* chains length
		* 0 of 5 files
		* +0% from last year

## backend logic

Severity: moderate

 * collect csv/xml like data about user roles, artifacts and it's interconnections
 * visualize it via yEd or graphviz like tools
 * search for the loops and long chains
 * search for the unused at the FE roles/artifacts

## code complexity

Severity: Critical

 * large code complexity and length
	* 10% - 2 issues in 1 of 5 *.ts files
	* +10% from last year
 	* 1 files with too long lines count in files and functions
 	* 1 files with too complex code

Severity: High, Moderate

Important issues with moderate or high severity
Including: no type definitions, promise, errors catch, too many lines, too comples code, banned functions, shadow vars, console.log().

 * see eslint.rules.important.log
 * 1 issues
 * 1 files
 * no type definitions
	* 1 log/eslint.type-sig.log
		* +0% from last year
	* 1 log/eslint.type-sig.files.log
		* +0% from last year

Severity: High, Moderate, Low

 * 1 issues in 1 files
 * 1 uniq issues
 * 1 uniq rules violated

## broken data types

Severity: high

Covering code with data types reduce issues count at the code editing(in IDE) stage and improve code understanding by humans. Also that allow to mitigate absent unit tests issues

1. Use an `interface` instead of a `type`
	* rule: [@typescript-eslint/consistent-type-definitions](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/consistent-type-definitions.md) [issue](https://github.com/typescript-eslint/typescript-eslint/issues/433)
	* line: `index.ts:10`
	* example: `export type TFoo = {`
	* fix: `export interface IFoo {`
1. Don't use `Function` as a type. The `Function` type accepts any function-like value. It provides no type safety when calling the function, which can be a common source of bugs. It also accepts things like class declarations, which will throw at runtime as they will not be called with `new`. If you are expecting the function to accept certain arguments, you should explicitly define the function shape 
	* rule: [@typescript-eslint/ban-types](https://github.com/typescript-eslint/typescript-eslint/blob/master/packages/eslint-plugin/docs/rules/ban-types.md#default-options)
	* line: `index.ts:10`
	* example: `setFoo: Function;`
1. Don't use `Object` as a type. The `Object` type actually means "any non-nullish value", so it is marginally better than `unknown`. - If you want a type meaning "any object", you probably want `Record<string, unknown>` instead. - If you want a type meaning "any value", you probably want `unknown` instead. The `object` type is currently hard to use ([see this issue](https://github.com/microsoft/TypeScript/issues/21732)).
	* rule: [@typescript-eslint/ban-types](https://github.com/typescript-eslint/typescript-eslint/blob/master/packages/eslint-plugin/docs/rules/ban-types.md#default-options)
	* line: `index.ts:10`
	* example: `const fooBar = (foo: Object) => {`
1. Don't use `{}` as a type. `{}` actually means "any non-nullish value".
- If you want a type meaning "any object", you probably want `Record<string, unknown>` instead.
- If you want a type meaning "any value", you probably want `unknown` instead
	* rule: [@typescript-eslint/ban-types](https://github.com/typescript-eslint/typescript-eslint/blob/master/packages/eslint-plugin/docs/rules/ban-types.md#default-options)
	* line: `index.ts:10`
	* example: `export const fooBar: Foo<{}>`
1. Missing return type on function 
	* rule: [@typescript-eslint/explicit-function-return-type](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/explicit-function-return-type.md)
	* line: `index.ts:10`
	* example: `fooBar(){`
1. Unexpected any. Specify a different type 
	* rule: [@typescript-eslint/no-explicit-any](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/no-explicit-any.md)
	* line: `index.ts:10`
	* example: `foo: any`
1. Argument should be typed with a non-any type
	* rule: [@typescript-eslint/explicit-module-boundary-types](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/explicit-module-boundary-types.md)
	* line: `index.ts:10`
	* example: `({ foo }: any) => {`
1. Missing return type on function
	* rule: [@typescript-eslint/explicit-module-boundary-types](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/explicit-module-boundary-types.md)
	* line: `index.ts:10`
	* example: `async () => {`
1. Unexpected use of undefined
	* rule: [no-undefined](https://eslint.org/docs/rules/no-undefined)
	* line: `index.ts:10`
	* example: `let foo: undefined,`

## Naming and code style guide

Severity: low

Naming is very subjectively. Creating naming guide requires advanced communicating and compromise finding skills. However, approved naming conventions gives solid code reading/understanding speed improvement and significantly reduce code changing "loops" risk during refactoring.

1. Use human readable naming instead of single chars: value, item, prop, stream, result, thread, error
1. Prefer to format code into less length size lines, more often use newlines(parameters, properties) to reduce merge conflicts
1. Comma and math/logic operators place in the end of line to make easier work in the [column selection mode](https://marketplace.visualstudio.com/items?1.temName=erikphansen.vscode-toggle-column-selection)
    * https://eslint.org/docs/rules/object-property-newline
    * https://eslint.org/docs/rules/operator-linebreak
    * https://eslint.org/docs/rules/one-var
1. use the `camelCase` naming notation.
	* rule: use `npm run lint:spell`
	* line: `index.ts:10`
	* example:
	```ts
		foobar(): ifoo{
		}
	```
	* fix:
	```ts
		fooBar(): IFoo{
		}
	```

## Syntax

Severity: moderate

1. variable is defined but never used. Unused variables, especially in `import` declarations, can slowdown code reading, review and execution.
	* rule: [@typescript-eslint/no-unused-vars](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/no-unused-vars.md)
	* line: `index.ts:10`
	* example: 
	```ts
		.catch((error: any) => {
			foo([]);
		});
	```
	* rule: [no-unused-vars](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/no-unused-vars.md)
	* line: `index.ts:10`
	* example: `interface IFoo {`
1. Missing radix parameter ParseInt()
	* rule: [radix](https://eslint.org/docs/rules/radix)
	* line: `index.ts:10`
	* example: `parseInt(foo)`
1. Unexpected empty arrow function
	* rule: [@typescript-eslint/no-empty-function](https://github.com/typescript-eslint/typescript-eslint/blob/v3.10.1/packages/eslint-plugin/docs/rules/no-empty-function.md)
	* line: `index.ts:10`
	* example: `.catch(() => {});`
1. Useless constructor. In this case you can make class `abstract` or replace it by the interface
	* rule: [no-useless-constructor](https://eslint.org/docs/rules/no-useless-constructor)
	* line: `index.ts:10`
	* example: `constructor(public full_name: string, public id: string, public email: string) {}`
1. variable is already declared in the upper scope
	* rule: [no-shadow](https://eslint.org/docs/rules/no-shadow)
	* line: `index.ts:10`
	* example: 
	```ts
		import { foo } from 'fooBar';
		//...
		const {
			foo, // <--
			bar
		} = props;

	```
1. imported multiple times
	* rule: [import/no-duplicates](https://github.com/benmosher/eslint-plugin-import/blob/v2.22.0/docs/rules/no-duplicates.md)
	* line: `index.ts:10`
	* example: 
	```ts
		import { foo } from 'fooBar';
		// ...
		import { bar } from 'fooBar';
	```
	* fix:
	```ts
		import { foo, bar } from 'fooBar';
	```
1. Arrow function used ambiguously with a conditional expression 
	* rule: [no-confusing-arrow](https://eslint.org/docs/rules/no-confusing-arrow)
	* line: `index.ts:10`
	* example: 
	```ts
		foo((bar) =>
			item
				? bar.toLowerCase().includes(item.toLowerCase())
				: true
	```
1. Unexpected console statement. Better to use logging class or service to prepare cloud/remote logging service integration and don't forgot to remove debug code from MR/PR. Also necessary logging lines can be marked for eslint skipping.
	* rule: [no-console](https://eslint.org/docs/rules/no-consoleno-console)
	* line: `index.ts:10`
	* example: `console.log(`
	* fix: 
	```ts
		// eslint-disable-next-line no-console
		console.log({
			data: {someVar: someVar},
			do: 'Parse and handle unexpected someVar value'
		});

		logger.log({
			data: {someVar: someVar},
			do: 'Parse and handle unexpected someVar value'
		})
	```
1. Unnecessary return statement. Function should return `null` instead of `undefined` or should be marked as `:void`
	* rule: [no-useless-return](https://eslint.org/docs/rules/no-useless-return)
	* line: `index.ts:10`
	* example: 
	```ts
		if (foo) {
			return;
		} else {
	```

## Sonar + eslint

Severity: moderate

Works better than ESLint, use more wide [rule set](https://rules.sonarsource.com/) for much more language count. Included in security and quality best practices. You can use corporate [sonar Qube](https://www.sonarqube.org/) and IDE plugin [sonarlint](https://marketplace.visualstudio.com/items?itemName=SonarSource.sonarlint-vscode)

1. Expected an assignment or function call and instead saw an expression. Confusing IIFE usage.
	* rule: [typescript:S905](https://rules.sonarsource.com/typescript/RSPEC-905)
	* line: `index.ts:10`
	* example: `foo?.(bar);`
1. Refactor this function to reduce its Cognitive Complexity from 12 to the 10 allowed.
	* rule: sonar [typescript:S3776](https://rules.sonarsource.com/typescript/RSPEC-3776)
	* rule: eslint ["complexity": ["warn", { "max": 10 }]](https://eslint.org/docs/rules/complexity)
	* line: `index.ts:10`
	* example(!formatted): 
	```ts
		if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		} else if (this.someVar) {
			this.someVar = !this.someVar;
		}
	```
	* fix: reduce code complexity using:
		* more complex OOP oriented data structures
		* splitting to less size files and grouping it in folders
		* splitting into smart(logic) and dumb(UI) files, for example: `*.component.ts` (UI), `*.service.ts` (logic), `*.gateway.ts` (API)
1. Remove this useless assignment to variable
	* rule: [typescript:S1854](https://rules.sonarsource.com/typescript/RSPEC-1854)
	* line: `index.ts:10`
	* example: 
	```ts
		let foo = getFoo() as any;//1
		if (!foo) {
			foo = getFoo() as any;//2
		}
	```
1. This is the default value for this type parameter, so it can be omitted.
	* rule: [typescript:S4157](https://rules.sonarsource.com/typescript/RSPEC4157)
	* line: `index.ts:10`
	* example: `foo: Foo<{}>`

## Async code

Severity: high

The most complicated to fix and search issues type, that can cause memory leaks and data loss.
You can request knowledge transfer from more experienced project teams with huge `Promise` codebase.

1. Each then() should return a value or throw
	* rule: [promise/always-return](https://github.com/xjamundx/eslint-plugin-promise/blob/HEAD/docs/rules/always-return.md)
	* line: `index.ts:10`
	* example: 
	```ts
		dispatch(foo())
			.then(() => {
				setBar([]);
			})
			.catch((e: any) => {
				setBar([]);
			});
	```
1. Prefer await to then()
	* rule: [promise/prefer-await-to-then](https://github.com/xjamundx/eslint-plugin-promise/blob/development/rules/prefer-await-to-then.js)
	* line: `index.ts:10`
	* example: 
	```ts
		dispatch(foo())
			.then(() => {
				setBar([]);
			})
			.catch((e: any) => {
				setBar([]);
			});
	```
1. Expected catch() or return; Each then() should return a value or throw
	* rule: [promise/catch-or-return](https://github.com/xjamundx/eslint-plugin-promise/blob/v4.0.1/rules/catch-or-return.js)
	* rule: [promise/always-return](https://github.com/xjamundx/eslint-plugin-promise/blob/v4.0.1/rules/always-return.js)
	* line: `index.ts:10`
	* example: 
	```ts
		foo(data)
			.then(bar)
			.then(() => {
			});
	```
1. "Promise" is not defined
	* rule: [promise/no-native](https://github.com/xjamundx/eslint-plugin-promise/blob/v4.0.1/rules/no-native.js)
	* line: `index.ts:10`
	* example: `const [foo, bar] = await Promise.all([`
1. Avoid nesting promises. That requires several `catch` blocks and slowdown code testing/refactoring
	* rule: [promise/no-nesting](https://github.com/xjamundx/eslint-plugin-promise/blob/v4.0.1/rules/no-nesting.js)
	* line: `index.ts:10`
	* example: 
	```ts
	fetch(url, headers)
		.then((response) => { // !!! 1 !!!
			// ...
			if (
				// ...
			) {
				foo.then(() => {// !!! 2 !!!
					bar.then(() => {// !!! 3 !!!
						// ...
					});
				});
			} else {
				// ...
			}
		}).catch(() => {
			// ...
		});
	```
	* fix: split into [several functions](https://philipwalton.com/articles/untangling-deeply-nested-promise-chains/) with correct naming, catching and commenting. Look to the  [rxjs](https://rxjs.dev/)


## Webpack bundle

 * see stats.jpg
 * lodash, jquery, router - are good candidates to analyze and remove

## Files and folders structure

 * `git add src;git commit 'add'`
 * CRLF should be replaced by LF in:
 	* src/index.js
 * should be removed:
	* unused some.min.js
	* unused .vscode folder
## Test coverage

Severity: high

Check by: `npm run test-coverage`

Low test code coverage increases risk of adding new production issues while fixing old.

 * See [full report](log/test.log)
 * 3 enabled tests covered 3% of functions
 * +0% from last year
 * 1 of 5 it assertions disabled
 * Statements   : 0% ( 0/0 )
 * Branches     : 0% ( 0/0 )
 * Functions    : 0% ( 0/0 )
 * Lines        : 0% ( 0/0 )

## Performance

 * chrome devtools profiler diagrams
 * lighthouse recommendations
 * too many XHR requests
 * long XHR requests

## Security

 * OWASP
 * configs/pass in repo
 * CORS/CSP setup
 * env hardening/updating
