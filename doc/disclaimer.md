##  [SOME] project disclaimer

* [summary](summary.md)
* [details](details.md)

### What is it?

Typical recommendations list for open source project release preparation.

Issues was found during static code analysis tools with extended rule set. To detect founded issues automatically in project was added the corresponding rule set. For triggered rules was collected and commented all unique issue types.

Described issues and recommendations should not be fixed mandatory(in any way), and does not guarantee the success. This is additional information for decision making process.

The most useful part is in the code analysis tools configuration. Any linter rules can be used as code style guide because it's maintained by community of programmers.

* `package.json` - the scripts section
* `.cspell-dict-exclude.txt`
* `.cspell.json`
* `.eslintrc.js`
* `tsconfig.eslint.json`
* `.vscode\settings.json`

The full issues list is in the `log` folder: cspell.log, eslint.log, tslint.log

### What to do next?

1. collect issues with `npm run lint:* > log/*.log` commands
1. filter log files with `linters.sh` example commands
1. repeat collecting after `git checkout` to some one year ago commit
1. introduce team with issues, collect feedback, discuss the typical issues and issues resolving methods
1. find additional info in similar project or communities for issues, that cannot be approved by all team members
1. make a task list and calculate estimation time to resolve that tasks
1. make a plan to resolve issues by types using severity or estimation
	* Milestone 1
	* Milestone 2
	* Milestone 3
1. mark next milestone issue types(eslint rules) as `error` or `warn` in the `.eslintrc.js`
	* rules, that can be resolved in short time mark as `error`
	* rules, that require long estimation time to resolve mark as `warn`
	* after resolving all detected by single rule issues mark as `error`. 
	* modify/add the [eslint --fix](https://eslint.org/docs/user-guide/command-line-interface#fixing-problems) command/script. For that you can make separate `.eslintrc.fix.js` only with rules in `error` state
1. resolve issues
1. celebrate the milestone termination

### Common recommendations

Severity: High

1. Cover all code units(files, modules, functions, etc) with tests. Collaboration is very hard without unit testing, especially with external teams.
1. License information: [LICENSE.md](https://docs.github.com/en/free-pro-team@latest/github/creating-cloning-and-archiving-repositories/licensing-a-repository)
1. [License checker](fossa.io)
1. Add contributors list
1. Add contribution guide, issue & PR templates
1. Add project goals
1. Add use cases

Severity: moderate

1. Use unit test code coverage calculation tools: [codecov](https://codecov.io/pricing), [coveralls](https://coveralls.io/pricing)
1. Add real data calculation conditions: 
	* hardware(CPU, RAM, STORAGE)
	* OS architecture(32/64/...) and version
	* browser version
	* input and output data size and type
	* expectable overall calculation time in described conditions(1Tb animal pictures data for the 1 hour using win10x64/Chrome 84/core i7x4/8GB ram)
1. Add CI/CD configuration: [gitlab](https://docs.gitlab.com/ee/ci/yaml/README.html), [Bitbucket](https://www.atlassian.com/continuous-delivery/tutorials), [GitHub](https://docs.github.com/en/free-pro-team@latest/actions)
1. Use code quality tools: [sonarcloud](https://sonarcloud.io/pricing), [code inspector](https://www.code-inspector.com/pricing), [codeclimate](https://codeclimate.com/velocity/pricing/)

Severity: low

1. Follow the [preparation checklist](https://github.com/amilajack/project-checklist)
1. Follow [README](https://github.com/matiassingers/awesome-readme) best practices
1. Add code style guide
1. Add live example on [stackblitz](https://stackblitz.com/), [gitlab pages](https://docs.gitlab.com/ee/user/project/pages/), [github pages](https://guides.github.com/features/pages/), [heroku](https://www.heroku.com/free)
1. Add screenshots
1. Add link to KB/docs
1. Add [svg badges](https://shields.io/)
1. Exclude(comment with TODO or disable) fake tests to reduce testing time
