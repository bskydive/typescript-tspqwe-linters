module.exports = {
	root: true,
	extends: [
		'standard',
		'plugin:@angular-eslint/recommended',
		'plugin:@typescript-eslint/recommended',
		'plugin:import/errors',
		'plugin:import/warnings',
		'plugin:import/typescript',
		'plugin:promise/recommended',
		'plugin:prettier/recommended', // https://www.npmjs.com/package/eslint-plugin-prettier
		'plugin:functional/recommended',
	],
	env: {
		browser: true,
		node: true,
	},
	parser: '@typescript-eslint/parser', // https://github.com/typescript-eslint/typescript-eslint#readme
	parserOptions: {
		// https://www.npmjs.com/package/@typescript-eslint/parser
		project: [
			'./tsconfig.eslint.json', // uncomment after move to project folder
		],
	},
	plugins: [
		'@typescript-eslint',
		'import',
		'node',
		'promise',
		'prettier',
		'functional',
	],
	settings: {
		import: {
			// https://www.npmjs.com/package/eslint-plugin-import
			extensions: [
				'.js',
			],
			parsers: {
				'@typescript-eslint/parser': [
					'.ts',
				],
			},
			// ignore: '.(scss|less|css)$',
			// 'core-modules': [ 'node' ],
		},
	},
	overrides: [
		/**
		 * This extra piece of configuration is only necessary if you make use of inline
		 * templates within Component metadata, e.g.:
		 *
		 * @Component({
		 *  template: `<h1>Hello, World!</h1>`
		 * })
		 * ...
		 *
		 * It is not necessary if you only use .html files for templates.
		 */
		{
			files: ['*.component.ts'],
			parser: '@typescript-eslint/parser',
			parserOptions: {
				ecmaVersion: 2020,
				sourceType: 'module',
			},
			plugins: ['@angular-eslint/template'],
			processor: '@angular-eslint/template/extract-inline-html',
		},
		{
			// ================================================================================= TypeScript
			files: ['*.ts'], // enable the rule specifically for TypeScript files
			rules: {
				'@typescript-eslint/require-await': 'error',
				'@typescript-eslint/promise-function-async': [
					'warn',
					{
						// https://github.com/typescript-eslint/typescript-eslint/blob/v4.0.1/packages/eslint-plugin/docs/rules/promise-function-async.md#options
						allowedPromiseNames: ['Thenable'],
						checkArrowFunctions: true,
						checkFunctionDeclarations: true,
						checkFunctionExpressions: true,
						checkMethodDeclarations: true,
					},
				],
				'@typescript-eslint/ban-types': 'warn',
				'@typescript-eslint/no-empty-function': ['warn', { allow: [] }], // https://eslint.org/docs/rules/no-empty-function#options-74
				'@typescript-eslint/consistent-type-definitions': 'warn',
				'@typescript-eslint/consistent-type-assertions': 'warn',
				'@typescript-eslint/explicit-function-return-type': [
					// https://github.com/typescript-eslint/typescript-eslint/blob/v4.0.1/packages/eslint-plugin/docs/rules/explicit-function-return-type.md#options
					'warn',
					{
						allowExpressions: true,
						allowTypedFunctionExpressions: true,
						allowHigherOrderFunctions: true,
						allowConciseArrowFunctionExpressionsStartingWithVoid: true,
					},
				],
				'@typescript-eslint/explicit-module-boundary-types': [
					// https://github.com/typescript-eslint/typescript-eslint/blob/v4.0.1/packages/eslint-plugin/docs/rules/explicit-module-boundary-types.md#options
					'warn',
					{
						allowArgumentsExplicitlyTypedAsAny: false, // If true, the rule will not report for arguments that are explicitly typed as `any`
						allowDirectConstAssertionInArrowFunctions: true, // If true, body-less arrow functions that return an `as const` type assertion will not require an explicit return value annotation. You must still type the parameters of the function.
						allowedNames: [], // An array of function/method names that will not have their arguments or their return values checked.
						allowHigherOrderFunctions: true, // If true, functions immediately returning another function expression will not require an explicit return value annotation. You must still type the parameters of the function.
						allowTypedFunctionExpressions: true, // If true, type annotations are also allowed on the variable of a function expression rather than on the function arguments/return value directly.
					},
				],
				'@typescript-eslint/no-explicit-any': 'warn',
				'@typescript-eslint/naming-convention': [
					// https://github.com/typescript-eslint/typescript-eslint/blob/master/packages/eslint-plugin/docs/rules/naming-convention.md#enforce-that-interface-names-do-not-begin-with-an-i
					'warn',
					{
						selector: 'interface',
						format: ['PascalCase'],
						prefix: ['I'],
					},
					{
						selector: 'typeAlias',
						format: ['PascalCase'],
						prefix: ['T'],
					},
					{
						selector: 'variable',
						modifiers: ['const'],
						format: ['UPPER_CASE'],
					},
				],
				'one-var': [
					// combine var declaration in one https://eslint.org/docs/rules/one-var
					'warn',
					{
						separateRequires: true,
						const: 'never',
						let: 'never',
						var: 'consecutive', // too many issues in old code
					},
				],
				'no-unused-vars': 'off', // dedupe
				'@typescript-eslint/no-unused-vars': 'warn',
				'no-extra-semi': 'off',
				'@typescript-eslint/no-extra-semi': 'warn',

				// ================================================== ASYNC =============================================================
				'promise/prefer-await-to-callbacks': 'off', // fires on RxJS ()=>{} https://github.com/xjamundx/eslint-plugin-promise/blob/development/rules/prefer-await-to-callbacks.js

				// ================================================== ANGULAR ==========================================================

				// '@angular-eslint/directive-class-suffix': ['off'],
				// '@angular-eslint/no-input-rename': ['off'],
				// '@angular-eslint/no-output-native': ['off'],
				'@angular-eslint/directive-selector': [
					'warn',
					// { type: 'attribute', prefix: 'app', style: 'camelCase' },
				],
				'@angular-eslint/component-selector': [
					'error',
					// { type: 'element', prefix: 'app', style: 'kebab-case' },
				],
				'@angular-eslint/no-output-on-prefix': 'warn',
				'@typescript-eslint/no-inferrable-types': [
					'warn',
					{
						ignoreParameters: false,
						ignoreProperties: false,
					},
				], // Disallows explicit type declarations for variables or parameters initialized to a number, string, or boolean https://github.com/typescript-eslint/typescript-eslint/blob/v4.0.1/packages/eslint-plugin/docs/rules/no-inferrable-types.md
			},
		},
		{
			// ====================================================== MODEL ============================================================
			files: ['*.model.ts'],
			rules: {
				camelcase: ['off'], // sometimes API model using Weird_Naming https://eslint.org/docs/rules/camelcase
				complexity: ['warn', { max: 20 }], // models using a lot of `if` https://eslint.org/docs/rules/complexity
				'prettier/prettier': ['off'], // models requires less formatting https://github.com/prettier/eslint-plugin-prettier
			},
		},
		{
			// ====================================================== JS ===============================================================
			files: ['*.js'],
			rules: {
				'one-var': [
					// too many issues in libs. combine var declaration in one https://eslint.org/docs/rules/one-var
					'warn',
					{
						separateRequires: true,
						const: 'consecutive',
						let: 'consecutive',
						var: 'consecutive',
					},
				],
				'@typescript-eslint/no-empty-function': ['warn', { allow: ['functions'] }], // https://eslint.org/docs/rules/no-empty-function#options-74,
				'@typescript-eslint/no-this-alias': 'warn',
				'no-unused-vars': 'warn',
				'@typescript-eslint/no-unused-vars': 'off', // dedupe
				'no-extra-semi': 'warn',
				'@typescript-eslint/no-extra-semi': 'off', // dedupe
			},
		},
	],
	rules: {
		// ========================================================== COMMON ==========================================================
		quotes: 'off',
		'quote-props': 'off',
		'no-extra-parens': 'off', //! conflicts with  Unnecessary parentheses around expression.
		// 'no-extra-parens': ['warn', 'all'], // https://eslint.org/docs/rules/no-extra-parens
		'dot-location': 'off', // Expected dot to be on same line as object.
		'import/no-unresolved': 'off', // don't work with Angular @alias
		// 'import/no-unresolved': ['warn', { commonjs: true, amd: true }],
		'accessor-pairs': 'off',
		'no-use-before-define': 'off', // fires on typescript interfaces

		yoda: 'warn', // if ("red" === color)  https://eslint.org/docs/rules/yoda
		'new-parens': 'warn', // require parentheses when invoking a constructor with no arguments 
		"no-restricted-imports": ["warn", { "paths": ["untilDestroyed", "lodash", "jquery", "uirouter"] }],
		'import/no-cycle': [1, { maxDepth: 1 }], // https://github.com/import-js/eslint-plugin-import/blob/HEAD/docs/rules/no-cycle.md#importno-cycle

		// ========================================================== STYLE ===========================================================

		'new-cap': 'off', //  violates @Input(). A function with a name starting with an uppercase letter should only be used as a constructor.
		// 'trailing-comma': 'warn', // deprecated
		semi: 'off',

		'comma-dangle': [
			// https://eslint.org/docs/rules/comma-dangle
			'warn',
			{
				arrays: 'always-multiline', // is for array literals and array patterns of destructuring. (e.g. let [a,] = [1,];)
				objects: 'always-multiline', // is for object literals and object patterns of destructuring. (e.g. let {a,} = {a: 1};)
				imports: 'always-multiline', // is for import declarations of ES Modules. (e.g. import {a,} from "foo";)
				exports: 'always-multiline', // is for export declarations of ES Modules. (e.g. export {a,};)
				functions: 'ignore', // conflict with prettier. is for function declarations and function calls. (e.g. (function(a,){ })(b,);)
			},
		],

		// ========================================================== PRETTIER

		'prettier/prettier': ['off', {}, { usePrettierrc: true }], // can't fit to eslint rules. https://github.com/prettier/eslint-plugin-prettier

		// ========================================================== NEWLINE

		'newline-after-var': 'off', // replaced with padding-line-between-statements https://eslint.org/docs/rules/newline-after-var
		'newline-before-return': 'off', // replaced with padding-line-between-statements https://eslint.org/docs/rules/newline-before-return
		'linebreak-style': ['off'],
		'max-len': ['off'],
		'no-multiple-empty-lines': 'off',

		'object-curly-newline': [
			// conflicts with prettier. line breaks inside curly braces `{}`  https://eslint.org/docs/rules/object-curly-newline
			'off',
			{
				// increase minProperties to match prettier formatter, that align only to overall line width
				ObjectExpression: { multiline: true, consistent: true, minProperties: 3 }, //  object literals
				ObjectPattern: { multiline: true, consistent: true, minProperties: 3 }, // object patterns of destructuring assignments
				// ImportDeclaration: { multiline: false, consistent: false, minProperties: 3 },
				ExportDeclaration: { multiline: true, minProperties: 3 },
			},
		],
		'object-property-newline': [
			//  conflicts with prettier. Object properties must go on a new line. Reduce merge conflicts  https://eslint.org/docs/rules/object-property-newline
			'off',
			{ allowAllPropertiesOnSameLine: false }
		],
		'function-paren-newline': ['warn', 'consistent'], // https://eslint.org/docs/rules/function-paren-newline
		'padding-line-between-statements': [
			'warn',
			{ blankLine: 'always', prev: ['const', 'let', 'var'], next: '*' },
			{ blankLine: 'any', prev: ['const', 'let', 'var'], next: ['const', 'let', 'var'] },
			{ blankLine: 'always', prev: ['*'], next: ['return'] },
		], // replace newline-after-var, newline-before-return https://eslint.org/docs/rules/padding-line-between-statements
		'function-call-argument-newline': ['warn', 'consistent'], // https://eslint.org/docs/rules/function-call-argument-newline
		'operator-linebreak': 'warn', // '&&' should be placed at the end of the line.
		'brace-style': ['warn', '1tbs', { allowSingleLine: true }], // newline in `if` braces https://eslint.org/docs/rules/brace-style
		'padded-blocks': [
			// newline in curly braces blocks https://eslint.org/docs/rules/padded-blocks
			'warn', {
				blocks: 'never', // require or disallow padding within block statements
				classes: 'never', // require or disallow padding within classes
				switches: 'never', // require or disallow padding within switch statements
			},
			{ "allowSingleLineBlocks": true }, // allows single-line blocks
		],

		// ========================================================== SPACES

		'no-tabs': 'off',
		indent: 'off',
		'semi-spacing': 'off', // no space after semicolon
		'no-multi-spaces': 'off',
		'space-before-function-paren': 'off',
		'no-tabs': 'off',
		'spaced-comment': 'off',
		'no-trailing-spaces': 'off',
		'lines-between-class-members': 'off',
		'eol-last': 'off',
		'object-curly-spacing': 'off',
		'object-curly-even-spacing': 'off',

		'space-before-blocks': 'warn', // too many, use auto format
		'block-spacing': 'warn',
		'no-lone-blocks': 'warn',
		'space-infix-ops': 'warn',
		curly: 'warn', // Expected { after 'if' condition
		'comma-spacing': 'warn', // missing whitespace
		'arrow-spacing': 'warn',
		'key-spacing': 'warn',
		'space-in-parens': 'warn',
		camelcase: [
			'warn',
			{
				properties: 'always', // (default) enforces camelcase style for property names
				ignoreDestructuring: false, // (default) enforces camelcase style for destructured identifiers
				ignoreImports: false, // (default) enforces camelcase style for ES2015 imports
				ignoreGlobals: false, // (default) enforces camelcase style for global variables
				// "ignoreGlobals": true, // does not enforce camelcase style for global variables
				allow: [], // (string[]) list of properties to accept. Accept regex.
			},
		], // https://eslint.org/docs/rules/camelcase
		'keyword-spacing': 'warn',
		'array-bracket-spacing': 'warn',

		// ======================================================================== ASYNC =========================================================

		// 'promise/no-native': 'off', // violates forEach error in eslint logs

		'promise/catch-or-return': 'error',
		'promise/always-return': 'error',
		'promise/no-nesting': 'error',
		'promise/prefer-await-to-then': 'warn', // https://github.com/xjamundx/eslint-plugin-promise/blob/development/docs/rules/prefer-await-to-then.md
		'promise/no-return-wrap': 'error',
		'promise/param-names': 'error',
		'promise/no-callback-in-promise': 'error',
		'promise/avoid-new': 'error',
		'promise/no-new-statics': 'error',
		'promise/no-return-in-finally': 'error',
		'promise/valid-params': 'error',
		'promise/prefer-await-to-callbacks': 'warn', // https://github.com/xjamundx/eslint-plugin-promise/blob/development/rules/prefer-await-to-callbacks.js
		'promise/no-promise-in-callback': 'warn',
		'require-await': 'error',
		'no-return-await': 'error',
		'no-async-promise-executor': 'error',
		'no-await-in-loop': 'error',
		'prefer-promise-reject-errors': 'error',

		// ======================================================================== TYPES ===========================================================

		'no-useless-constructor': 'off', // check only body, not arguments. Not suitable for DI https://eslint.org/docs/rules/no-useless-constructor
		'handle-callback-err': 'off',
		'prefer-const': 'off',
		'@typescript-eslint/typedef': [ // https://github.com/typescript-eslint/typescript-eslint/blob/main/packages/eslint-plugin/docs/rules/typedef.md
			"error",
			{
				arrayDestructuring: true,
				arrowParameter: true,
				memberVariableDeclaration: true,
				objectDestructuring: true,
				parameter: true,
				propertyDeclaration: true,
				variableDeclaration: true,
				variableDeclarationIgnoreFunction: false,
			}],
		'functional/immutable-data': ['off', {
			assumeTypes: true,
			ignoreClass: "fieldsOnly",
			ignoreImmediateMutation: true,
		}], // https://github.com/jonaskello/eslint-plugin-functional/blob/master/docs/rules/immutable-data.md
		'functional/no-expression-statement': 'off',
		'functional/no-class': 'off',
		'functional/no-this': 'off',
		'functional/no-let': 'off',
		'functional/no-this-expression': 'off',
		'functional/prefer-readonly-type': 'off',
		'functional/functional-parameters': 'off',
		'functional/no-return-void': 'off',
		'functional/no-conditional-statement': 'off',
		'functional/no-throw-statement': 'off',
		'functional/no-loop-statement': 'off',
		'functional/no-mixed-type':'off',
		'functional/no-promise-reject':'off',
		'functional/no-try-statement': 'off',
		'functional/no-method-signature': 'warn',
		'functional/prefer-tacit':'off', // a = () => false
		'getter-return': 'warn',
		radix: 'warn',
		'no-unused-labels': 'warn',
		'no-unused-expressions': 'warn',
		'no-undefined': 'warn', // undefined can be overwritten or shadowed. null is a keyword that always produces the same value. https://eslint.org/docs/rules/no-undefined
		'no-undef': 'off', // can't resolve angular modules https://eslint.org/docs/rules/no-undef
		complexity: ['warn', { max: 10 }], // https://eslint.org/docs/rules/complexity
		'max-depth': ["error", 4], // https://eslint.org/docs/rules/max-depth
		'max-params': ["error", 5], // https://eslint.org/docs/rules/max-params
		'max-statements': ["error", 10], // https://eslint.org/docs/rules/max-statements
		'max-lines': ["error", { "max": 400, "skipBlankLines": true, "skipComments": true }], // https://eslint.org/docs/rules/max-lines
		'max-lines-per-function': ["error", { "max": 50, "skipBlankLines": true, "skipComments": true }], //https://eslint.org/docs/rules/max-lines-per-function
		'unicode-bom': 'warn', // Unexpected Unicode BOM (Byte Order Mark)
		'no-unmodified-loop-condition': 'warn',
		'wrap-iife': ['error', 'any'], // https://eslint.org/docs/rules/wrap-iife
		'import/export': 'warn', // Multiple exports of name
		'no-array-constructor': 'warn',
		'no-extra-bind': 'warn',
		'no-prototype-builtins': 'warn',
		'import/no-duplicates': 'warn',
		'import/first': 'warn',
		'no-useless-return': 'warn',
		'no-console': 'warn',
		eqeqeq: 'warn', // always `===`
		'no-shadow': 'warn', // https://eslint.org/docs/rules/no-shadow
		'no-multi-assign': 'warn', // https://eslint.org/docs/rules/no-multi-assign
		'no-self-assign': 'warn',
		'no-confusing-arrow': 'warn', // https://eslint.org/docs/rules/no-confusing-arrow Arrow function used ambiguously with a conditional
		'no-cond-assign': 'warn',
		'no-return-assign': 'warn',
		'no-dupe-args': 'error',
		'no-dupe-class-members': 'warn',
		'no-dupe-keys': 'error',
		'no-control-regex': 'warn',
		'no-useless-escape': 'warn',
		'dot-notation': 'warn',
		'no-mixed-operators': 'warn',
		'no-new-object': 'warn',
		'no-case-declarations': 'warn',
		'no-unneeded-ternary': 'warn',
		'no-extra-boolean-cast': 'warn',
		'no-var': 'warn',
	},
};
