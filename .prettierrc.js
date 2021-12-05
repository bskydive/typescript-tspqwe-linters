module.exports = {
	singleQuote: true,
	trailingComma: 'es5',
	endOfLine: 'auto',
	singleQuote: true,
	trailingComma: "all",
	tabWidth: 4,
	bracketSpacing: true,
	arrowParens: "always",
	htmlWhitespaceSensitivity: "strict",
	bracketSameLine: true,
	printWidth: 120, // the only way to set multiline/newline style
	overrides: [
		{
			files: ['*.json', '*.md'],
			singleQuote: false,
			options: {
				printWidth: 180
			}
		}
	]
};

