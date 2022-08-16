## Шаблон

Это шаблон, который необходимо заполнить данными, полученными при выполнении [скриптов](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/linters.sh). Для расчёта процентов придётся немного поскрипеть калькулятором.

Для унификации лучше считать процент ошибок, т.е. сколько надо исправить файлов/строк. Так проще оценивать прогресс за год.

 * простая формула: 100-(ошибок год назад*100/ошибок сейчас)
 * если за год значительно изменилось количество файлов, то необходимо использовать приведение к числу файлов: % файлов с ошибками сейчас - % файлов с ошибками год назад

### Ссылка на проект

 * []()

### Точки анализа

 * первая точка: ``
 * вторая точка(год назад): ``

### Размер проекта

 * всего 00 строк, прирост +00%/00
 * html 00 строк в 00 файлах, прирост +00%/00 строк
	* ```bash
		find src/ -type f -name '*.html' -exec wc -l {} \; | awk '{ total += $1 } END {print total " html"}'
		find src/ -type f -name '*.html' | wc -l
	```
 * 00 строк в 00 scss файлах, прирост +00%/00 строк
	* ```bash
		find src/ -type f -name '*.scss' -exec wc -l {} \; | awk '{ total += $1 } END {print total " scss"}'
		find src/ -type f -name '*.scss' | wc -l
	```
 * 00 строк в 00 ts файлах, прирост +00%/00 строк
	* ```bash
		find src/ -type f -name '*.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " ts"}'
		find src/ -type f -name '*.ts' | wc -l
	```
 * [size.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/size.sh)

### Зависимости

* размер библиотек
	* ![](./doc/webpack-stats.jpg)
	* ![](./doc/webpack-stats1.jpg)
* Граф зависимостей
	* ![](./doc/dependencies-graph.jpg)
	* Циклические зависимости
		* 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%
		* [eslint.cycle](./log/eslint.cycle.log)
		* [eslint.cycle.files](./log/eslint.cycle.files.log)
		* ```bash
			grep -ef log/eslint.rules.important.log log/eslint.log > log/eslint.important.log
			wc -l  log/eslint.important.log
			cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.important.files.log
			wc -l log/eslint.important.files.log
		```
* Самые старые библиотеки
	*

#### Ядро/хранилище
#### Библиотеки
#### Тестирование
#### Анализ кода
#### Сборка
#### Визуализация
#### Дата/Локализация
#### Авторизация
#### Разные

### Комментарии

 * 00 `TODO|FIXME` в html|css|ts файлах
	* ```bash
		find src/ -type f \( -name '*.less' -o -name '*.scss' -o -name '*.css' -o -name '*.ts' -o -name '*.html' \) -exec grep -iE 'TODO|FIXME' {} \; | wc -l
	```
 * 00% - 00 comment|JSDOC из 00 строк в html|css|ts файлах
	* [comments](./log/comments.log)
	* ```bash
		grep --include=\*.{less,scss,css,ts,html} -RiE '/\*|//' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RilE '/\*|//' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RiE '/\**' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RilE '/\**' src/ | wc -l
	```

### Эксперты

 * автор, количество коммитов
	* ```bash
		git shortlog --summary --numbered --email
	```

### Возраст проекта

 * первые коммиты
	* ```bash
		git log --reverse --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -10
	```
 * 00 коммитов всего, прирост +00% коммитов

### Ошибки компиляции

 * ошибки связывания данных в шаблонах `fullTemplateTypeCheck="true"`
 * 00% - 00 ошибок сборки в 00 из 00 `*.html|ts` файлов, +00% прирост за год
 * [errors](./log/build.errors.log)
 * [errors.files](./log/build.errors.files.log)
 * [ts-numbers](./log/build.ts-numbers.ts)

### Статический анализ

 * Использованы наборы правил ESLint
	* standard
	* plugin:@angular-eslint/recommended
	* plugin:@typescript-eslint/recommended
	* plugin:import/errors
	* plugin:import/warnings
	* plugin:import/typescript
	* plugin:promise/recommended
	* [plugin:prettier/recommended](https://www.npmjs.com/package/eslint-plugin-prettier)
	* plugin:functional/recommended
 * Большая длинна и сложность
	* много строк в функциях и файлах:
		* 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
		* [max-lines](./log/eslint.max-lines.log)
		* [max-lines.files](./log/eslint.max-lines.files.log)
		* ```bash
			cat log/eslint.log | grep -i max-lines > log/eslint.max-lines.log
			cat log/eslint.max-lines.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines.files.log
			wc -l log/eslint.max-lines.files.log
			```
	* высокая сложность функций:
		* 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
		* [complexity](./log/eslint.complexity.log)
		* [complexity.files](./log/eslint.complexity.files.log)
		* ```bash
			cat log/eslint.log | grep -i complexity > log/eslint.complexity.log
			wc -l log/eslint.complexity.log
			cat log/eslint.complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.complexity.files.log
			wc -l log/eslint.complexity.files.log
			```
 * Все типы ошибок
	* 00% - 00 ошибок(00 типов) в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
	* [all issues](./log/eslint.log)
	* [files](./log/eslint.files.log)
	* [issues](./log/eslint.issues.log)
	* [rules](./log/eslint.rules.log)
	* ```bash
		tail -n1 log/eslint.log
		cat log/eslint.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.files.log
		wc -l log/eslint.files.log
		cat log/eslint.log | awk -F':' '{print $3}' | sort | uniq > log/eslint.issues.log
		wc -l log/eslint.issues.log
		cat log/eslint.log | awk -F':' '{print $2}' | sort | uniq > log/eslint.rules.log
		wc -l log/eslint.rules.log
		```
 * TODO Важные ошибки
	* выключить в [.eslitrc](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/.eslintrc.js) неважные [типы ошибок](./log/eslint.rules.log), и посчитать заново
	* 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
	* [all issues](./log/eslint.important.log)
	* [files](./log/eslint.important.files.log)
	* [issues](./log/eslint.important.issues.log)
	* [rules](./log/eslint.important.rules.log)
	* ```bash
		tail -n1 log/eslint.important.log
		grep -ef log/eslint.rules.important.log log/eslint.log > log/eslint.important.log
		wc -l  log/eslint.important.log
		cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.important.files.log
		wc -l log/eslint.important.files.log
		cat log/eslint.important.log | awk -F':' '{print $2}' | sort | uniq > log/eslint.rules.log
		wc -l log/eslint.important.rules.log
		```
 * Покрытие типами данных
	* 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
	* [type-sig](./log/eslint.type-sig.log)
	* [type-sig.files](./log/eslint.type-sig.files.log)
	* ```bash
		cat log/eslint.log | grep -iE 'typedef|signature' > log/eslint.type-sig.log
		wc -l log/eslint.type-sig.log
		cat log/eslint.type-sig.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.type-sig.files.log
		wc -l log/eslint.type-sig.files.log
		```

### Стили
 * 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
 * [css](./log/css.log)
 * [css.rules.uniq](./log/css.rules.uniq.log)
 * [css.short.uniq](./log/css.short.uniq.log)
 * [css.files](./log/css.files.log)
 * ```bash
	npm run lint:scss > log/css.log
	# npm run lint:less >> log/css.log
	cat log/css.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')'|sort|uniq> log/css.rules.uniq.log
	wc -l log/css.rules.uniq.log
	cat log/css.log | awk -F' - ' '{print $2}' | sort | uniq |less > log/css.short.uniq.log
	wc -l log/css.short.uniq.log
	cat log/css.log | grep ':' | awk -F':' '{print $1}' |sort|uniq |less > log/css.files.log
	wc -l log/css.files.log
	```
 * TODO Важные ошибки
	* выключить в [.stylelintrc-scss.json](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/.stylelintrc-scss.json)|[.stylelintrc-less.js](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/.stylelintrc-less.js)  неважные [типы ошибок](./log/css.rules.uniq.log), и посчитать заново

### уязвимости пакетов
	* легче запустить из папки с проектом
	* ```bash
		npm audit > log/audit.log
		grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | less
		grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log
	```

### Покрытие тестами

 * 00% - 00 тестов выключено в 00 из 00 `*spec.ts` файлов, прирост +00%/00 тестов
	* [disabled](log/test.disabled.log)
	* ```bash
		find src/ -type f -name '*spec.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " spec.ts"}'
		find src/ -type f \( -name '*component*.ts' -o -name '*service*.ts' -o -name '*directive*.ts' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " component|service|directive"}'
		grep --include=\*spec.ts -RiE 'xit\(|xdescribe\(' src/ | wc -l
		```

 * 00% - 00 из 00 функций не покрыто, прирост +00%/00 ошибок
 * 00% - 00 из 00 `ts` файлов покрыты `spec.ts` файлами, прирост +00%/00 файлов
 * 00% - 00 из 00 строк `ts` покрыто в `spec` файлах грубо, прирост +00%/00 файлов
 * 00% - строк `ts` НЕ покрыто в `spec` файлах грубо, прирост +00%/00 строк

### Фреймворк Angular

 * 00% - 00 из 00 компоненты без OnPush, прирост +00%/00 компонентов
	* ```bash
		grep --include=\*.ts -RiE '@component\(' src/ | wc -l
		grep --include=\*.ts -RiE '@component\(' src/ | sort | uniq -d | wc -l
		grep --include=\*.ts -RiE '@component\(' src/ | grep -iE '\.onpush' | wc -l
		```
 * 00% - 00 из 00 `ts` файлов без постфиксов, прирост +00%/00 файлов

### Дублирование кода

 * 00% CSS: 00 клонов с 00 одинаковыми строками в 00 файлах
  	* [report](./log/jscpd-css/jscpd-report.md)
 * 00% HTML: 00 клонов с 00 одинаковыми строками в 00 файлах
  	* [report](./log/jscpd-html/jscpd-report.md)
 * 00% TS: 00 клонов с 00 одинаковыми строками в 00 файлах
  	* [report](./log/jscpd-ts/jscpd-report.md)

### Правописание

 * запускается в два этапа: до и после редактирования словаря ошибок
 * 00% - 00 ошибок в 00 из 00 css|ts|html файлах
 * [словарь исключений](./.cspell-dict-exclude.txt)
 * [spell-excluded](./log/spell-excluded.log)
 * [spell-excluded.words](./log/spell-excluded.words.log)
 * [spell-excluded.uniq-files](./log/spell-excluded.uniq-files.log)


