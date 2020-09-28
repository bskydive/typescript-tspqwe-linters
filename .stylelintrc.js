module.exports = {
	//https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
	extends: [
		'stylelint-config-standard', // https://github.com/stylelint/stylelint-config-standard/blob/master/index.js
		'stylelint-config-recommended',
		'stylelint-config-recommended-scss',
	],
	syntax: ['scss'],
	plugins: ['stylelint-order'],
	ignoreFiles: [
		"**/*.min.*",
		"**/dist/",
		"**/vendor/",
		"/_gh_pages/",
		"node_modules",
		"*.json",
		"*.md",
		"*.ts",
		"*.js"
	],
	defaultSeverity: 'warning',
	rules: {
		// ======================================= SPACES ===================================
		'indentation': null,
		'at-rule-name-space-after': 'always',
		'at-rule-semicolon-space-before': 'never',
		'block-opening-brace-space-before': null,
		'declaration-block-semicolon-space-after': 'always-single-line',
		'media-feature-parentheses-space-inside': 'never',
		'media-feature-range-operator-space-after': 'always',
		'media-feature-range-operator-space-before': 'never',
		'selector-list-comma-space-after': 'always-single-line',
		'selector-list-comma-space-before': 'never-single-line',
		'value-list-comma-space-after': 'always',
		// ======================================= LINES =================================
		'at-rule-empty-line-before': [ // https://stylelint.io/user-guide/rules/at-rule-empty-line-before
			'always',
			{
				except: ['first-nested'],
			},
		],
		'declaration-empty-line-before': null,
		'declaration-block-semicolon-newline-after': 'always-multi-line',
		'max-empty-lines': 2,
		'max-line-length': null,
		'rule-empty-line-before': null,
		'selector-list-comma-newline-after': 'always',
		'value-list-comma-newline-after': 'never-multi-line',
		'value-list-comma-newline-before': 'never-multi-line',
		'block-closing-brace-newline-after': null,
		'block-closing-brace-empty-line-before': null,
		// ======================================= FONT ==================================
		'font-weight-notation': 'numeric',
		'font-family-name-quotes': 'always-where-recommended',
		// ======================================= UNITS =================================
		'color-named': 'never',
		'length-zero-no-unit': true,
		'number-leading-zero': 'never',
		// ======================================= VENDOR ================================
		'at-rule-no-vendor-prefix': true,
		'media-feature-name-no-vendor-prefix': true,
		'property-no-vendor-prefix': true,
		'selector-no-vendor-prefix': true,
		'value-no-vendor-prefix': true,
		// ======================================= QUOTES ================================
		'selector-attribute-quotes': 'always',
		'string-quotes': 'double',
		'function-url-quotes': 'always',
		// ======================================= SPECIFCITY ============================
		'declaration-no-important': true,
		'no-descending-specificity': null,
		'no-duplicate-selectors': true,
		'selector-max-attribute': 2,
		'selector-max-class': 4,
		'selector-max-combinators': 4,
		'selector-max-compound-selectors': 4,
		'selector-max-empty-lines': 1,
		'selector-max-id': 0,
		'selector-max-specificity': null,
		'selector-max-type': 2,
		'selector-max-universal': 1,
		'selector-no-qualifying-type': true,
		// ======================================= MISC ==================================
		'function-url-no-scheme-relative': true,
		'value-keyword-case': 'lower',
	}
}
