# scripts to run in project folder

To avoid npm dependencies installation in linter folder. 

Before run 
 * enable fullTemplateTypeCheck or strictTemplates in tsconfig.json
 * check that `npm run lint:ng` command works
 * uncomment the NX section in scripts if you use it

* run 
	```bash
		cd typescript-tspqwe-linter_folder
		./scripts/project_folder/prepare.sh "path_to_project"
		npm i # if needed
		npm i webpack-bundle-analyzer # if needed
		./scripts/project_folder/run.sh
	```
