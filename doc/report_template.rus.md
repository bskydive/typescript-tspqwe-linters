# Шаблон

Это шаблон, который необходимо заполнить данными, полученными при выполнении [скриптов](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/linters.sh). Для расчёта процентов придётся немного поскрипеть калькулятором.

Для унификации лучше считать процент ошибок, т.е. сколько надо исправить файлов/строк. Так проще оценивать прогресс за год.

 * простая формула: ошибок сейчас*100/ошибок год назад - 100
 * если за год значительно изменилось количество файлов, то необходимо использовать приведение к числу файлов: % файлов с ошибками сейчас - % файлов с ошибками год назад

## Общие данные

 * Что это
	* краткая, критически важная информация о коде проекта
	* ссылки на jira/confluence
	* анализ кода с выводами и цифрами
	* максимально простое и удобное место для заметок о техдолге. Информацию о техдолге можно удалить после переноса в задачи JIRA.
	* файлы `./log/*`. Их необходимо вычищать по мере исправления ошибок, переноса информации в конфигурационные файлы(jscpd, eslint, cspell) и задачи JIRA
 * Зачем это
	* сохранить информацию о коде в месте, которое нельзя потерять. Если есть доступ к коду, то и к описанию он тоже есть.
	* ускорить погружение в проект новичков, а также после перерыва(другой проект, отпуск, больничный)
	* аналитика приведена для быстрой оценки состояния дел в проекте в целом
	* создание историй в JIRA из краткого описания техдолга
	* упростить поиск информации о наиболее важных направлениях работы над техдолгом. Техдолг в жире - это очень большой список, который трудно структурировать в отсутствие жировода
	* файлы `./log/*` нужны чтобы проваливаться в два клика до конкретного места в коде с проблемой. Это ускоряет создание задач и конфигурационных файлов линтеров.
 * Словарь терминов
	* таблица
		| термин  | расшифровка                                                 |
		| ------- | ----------------------------------------------------------- |
		|         |                                                             |
 * Запуск
	* установка библиотек, настройка окружения, версии
	* логины, доступ в консоль стендов
 	* сборка на прод, более детальная документация про стенды
 	* локально(ПК разработчика) angular прокси
	* проверка доступности стендов
		* простой запрос с авторизацией
		    ```bash
				curl -X 'POST' \
				'https://some.domain.ru/api/getToken' \
				-H 'accept: */*' \
				-H 'Content-Type: application/json' \
				-d '{ \
				"username": "", \
				"password": "" \
				}' \
				-o token.json

				curl -X 'GET' \
				'https://some.domain.ru/api/getSomeData' \
				-H 'accept: text/plain'
				-H 'Authorization: Bearer $(cat token.json)'
			```
		* [документация curl](https://curl.se/docs/manpage.html)
	* авторизация, SSO: [Auth0](https://auth0.com/), [keycloak](https://www.keycloak.org/)
  	* api [swagger](): онлайн и в git репе(где видно когда было обновление)
 * Структура проекта
	* домены, папки, логическое разделение
	* URL
	* подсистемы: сервисы, NGRX/Akita/Redux
	* разделение бизнес-логики между фронтом и тылом
	* старт приложения
		* Авторизация
	* внешние сервисы


## Точки анализа

 * [ссылка на проект]()
 * первая точка: ``
 * вторая точка(год назад): ``

## Размер проекта

 * всего 00 строк, прирост +00%/00
 * html 00 строк в 00 файлах, прирост +00%/00 строк
 * 00 строк в 00 scss файлах, прирост +00%/00 строк
 * 00 строк в 00 ts файлах, прирост +00%/00 строк
 * [size.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/size.sh)
 * ```bash
	grep --include=\*\.{less,scss,css,ts,html} -R '' src/ | wc -l
	grep --include=\*\.{less,scss,css,ts,html} -Rl '' src/ | wc -l
	grep --include=\*.html -R '' src/ | wc -l
	grep --include=\*.html -Rl '' src/ | wc -l
	grep --include=\*\.{less,scss,css} -R '' src/ | wc -l
	grep --include=\*\.{less,scss,css} -Rl '' src/ | wc -l
	grep --include=\*.ts -R '' src/ | wc -l
	grep --include=\*.ts -Rl '' src/ | wc -l
	```

## Зависимости

 * размер библиотек
	* ![](log/webpack-stats.jpg)
	* [stats.json](log/stats.json)
	* [report.html](log/report.html)
 * Граф зависимостей
	* ![](log/dependencies-graph.jpg)
	* Циклические зависимости
		* 00% файлов - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 файлов
		* [eslint.cycle](./log/eslint.cycle.log)
		* [eslint.cycle.files](./log/eslint.cycle.files.log)
		* ```bash
			grep -ef log/eslint.rules.important.log | wc -l
			cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq | wc -l
		```
 * Самые старые библиотеки
	* 0000 -
		* 
	* 0000 -
		* 
 * неочевидные зависимости
	* 

### Ядро
### Библиотеки
### Тестирование
### Анализ кода
### Сборка
### Визуализация
### Дата/Локализация
### Авторизация
### Разные
### уязвимости пакетов

 * 00 уязвимостей, прирост +00%
 * [npm.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/project_folder/npm.sh)
 * ```bash
	grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log | less
	grep -iE 'Path|Low|Moderate|High|Critical' log/audit.log > log/audit.parsed.log
	```

## Комментарии

 * 00 `TODO|FIXME` в 00 html|css|ts файлах, прирост +00%/00 комментариев
	* ```bash
		grep --include=\*.{less,scss,css,ts,html} -RiEl 'TODO|FIX' src/ | wc -l
	```
 * 00 `comment|JSDOC` в 00 html|css|ts файлах, прирост +00%/00 комментариев
	* [comments](./log/comments.log)
	* ```bash
		grep --include=\*.{less,scss,css,ts,html} -RiE '/\*|//' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RilE '/\*|//' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RiE '/\**' src/ | wc -l
		grep --include=\*.{less,scss,css,ts,html} -RilE '/\**' src/ | wc -l
	```

## Эксперты

 * автор, количество коммитов
	* ```bash
		git shortlog --summary --numbered --email
	```

## Возраст проекта

 * первые коммиты
	* ```bash
		git log --reverse --pretty=oneline --format='DEV: %cd #%h %s' --date=format:'%c' | head -10
	```
 * 00 коммитов всего, прирост +00%/00 коммитов

## TODO Ошибки компиляции

 * ошибки связывания данных в шаблонах `fullTemplateTypeCheck="true"`
 * 00% - 00 ошибок сборки в 00 из 00 `*.html|ts` файлов, +00% прирост за год
 * [errors](./log/build.errors.log)
 * [errors.files](./log/build.errors.files.log)
 * [ts-numbers](./log/build.ts-numbers.ts)

## Статический анализ

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
 * [eslint.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/eslint.sh)
 * Все типы ошибок
	* 00% файлов - 00 ошибок(00 типов) в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
	* [all issues](./log/eslint.log)
	* [files](./log/eslint.files.log)
	* [issues](./log/eslint.issues.log)
	* [rules](./log/eslint.rules.log)
	* ```bash
		tail -n1 log/eslint.log
		cat log/eslint.log | awk -F'(' '{print $1}' | sort | uniq | wc -l
		cat log/eslint.log | awk -F':' '{print $3}' | sort | uniq | wc -l
		cat log/eslint.log | awk -F':' '{print $2}' | sort | uniq | wc -l
		```
 * Большая длинна и сложность
	* много строк в функциях и файлах:
		* 00% файлов - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
		* [max-lines](./log/eslint.max-lines.log)
		* [max-lines.files](./log/eslint.max-lines.files.log)
		* ```bash
			cat log/eslint.log | grep -i max-lines > log/eslint.max-lines.log
			cat log/eslint.max-lines.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.max-lines.files.log
			wc -l log/eslint.max-lines.files.log
			```
	* высокая сложность функций:
		* 00% файлов - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
		* [complexity](./log/eslint.complexity.log)
		* [complexity.files](./log/eslint.complexity.files.log)
		* ```bash
			cat log/eslint.log | grep -i complexity > log/eslint.complexity.log
			wc -l log/eslint.complexity.log
			cat log/eslint.complexity.log | awk -F'(' '{print $1}' | sort | uniq > log/eslint.complexity.files.log
			wc -l log/eslint.complexity.files.log
			```
 * Покрытие типами данных
	* 00% файлов - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
	* [type-sig](./log/eslint.type-sig.log)
	* [type-sig.files](./log/eslint.type-sig.files.log)
	* ```bash
		cat log/eslint.log | grep -iE 'typedef|signature' | wc -l
		cat log/eslint.type-sig.log | awk -F'(' '{print $1}' | wc -l
		```

### TODO Важные ошибки

 * необходимо отредактировать `eslint.rules.important.log`
 * 00% - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
 * [all issues](./log/eslint.important.log)
 * [files](./log/eslint.important.files.log)
 * [issues](./log/eslint.important.issues.log)
 * [rules](./log/eslint.important.rules.log)
 * [eslint.important.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/eslint.important.sh)
 * ```bash
	tail -n1 log/eslint.important.log
	grep -ef log/eslint.rules.important.log log/eslint.log | wc -l
	cat log/eslint.important.log | awk -F'(' '{print $1}' | sort | uniq | wc -l
	cat log/eslint.important.log | awk -F':' '{print $2}' | sort | uniq | wc -l
	```

## Стили

 * 00%(файлы) - 00 ошибок в 00 из 00 `*.ts` файлов, прирост +00%/00 ошибок
 * [css](./log/css.log)
 * [css.rules.uniq](./log/css.rules.uniq.log)
 * [css.short.uniq](./log/css.short.uniq.log)
 * [css.files](./log/css.files.log)
 * [styles.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/styles.sh)
 * ```bash
	cat log/css.log | grep '(' | awk -F'(' '{print $2}' |grep -E ')$'|tr -d ')'|sort|uniq | wc -l
	cat log/css.log | awk -F' - ' '{print $2}' | sort | uniq | wc -l
	cat log/css.log | grep ':' | awk -F':' '{print $1}' |sort|uniq | wc -l
	```

### TODO Важные ошибки стилей

 * необходимо отредактировать `log/styles.rules.important.log`
 * [styles.important.log](./log/styles.important.log)
 * [styles.important.short.log](./log/styles.important.short.log)
 * [styles.important.files.log](./log/styles.important.files.log)
 * [styles.important.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/styles.important.sh)
 * ```bash
	grep -f log/styles.rules.important.log log/styles.log | sort | uniq
	cat log/styles.important.log | awk -F' - ' '{print $2}' | sort | uniq
	cat log/styles.important.log | grep ':' | awk -F':' '{print $1}' | sort | uniq
	```

## Покрытие тестами

 * 00% файлов - 00 тестов выключено в 00 из 00 `*spec.ts` файлов, прирост +00%/00 тестов
 * 00% файлов - 00 из 00 `ts` файлов покрыты `spec.ts` файлами, прирост +00%/00 файлов
 * 00% строк - 00 из 00 строк `ts` покрыто в `spec` файлах грубо, прирост +00%/00 файлов
 * 00% строк `ts` НЕ покрыто в `spec` файлах грубо, прирост +00%/00 строк
 * [test.disabled.log](./log/test.disabled.log)
 * [test.group.disabled.log](./log/test.group.disabled.log)
 * [test.assert.disabled.log](./log/test.assert.disabled.log)
 * [tests.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/tests.sh)
 * ```bash
	find src/ -type f -name '*spec.ts' -exec wc -l {} \; | awk '{ total += $1 } END {print total " spec.ts"}'
	find src/ -type f \( -name '*component*.ts' -o -name '*service*.ts' -o -name '*directive*.ts' \) -exec wc -l {} \; | awk '{ total += $1 } END {print total " component|service|directive"}'
	grep --include=\*spec.ts -RiE 'xit\(|xdescribe\(' src/ | wc -l
	```

## Фреймворк Angular

 * 00% - 00 из 00 компоненты без OnPush, прирост +00%/00 компонентов
	* ```bash
		grep --include=\*.ts -RiE '@component\(' src/ | wc -l
		grep --include=\*.ts -RiE '@component\(' src/ | sort | uniq -d | wc -l
		grep --include=\*.ts -RiE '@component\(' src/ | grep -iE '\.onpush' | wc -l
		```
 * 00% - 00 из 00 `ts` файлов без постфиксов, прирост +00%/00 файлов
 * [angular.components.files.log](./log/angular.components.files.log)
 * [angular.components.duplicated.files.log](./log/angular.components.duplicated.files.log)
 * [angular.components.onpush.files.log](./log/angular.components.onpush.files.log)
 * [angular.named.files.log](./log/angular.named.files.log)
 * [angular.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/angular.sh)
 * ```bash
	grep --include=\*.ts -RiE '@component\(' src/ | wc -l
	grep --include=\*.ts -RiE '@component\(' src/ | sort | uniq -d | wc -l
	grep --include=\*.ts -RiE '@component\(' src/ | grep -iE '\.onpush' | wc -l
	grep --include=\*.{component,pipe,directive,spec,model,module,type,interface,guard,interceptor} -R src/ | sort | uniq | wc -l
	```

## Дублирование кода

 * 00% строк HTML: 00 клонов, 00 одинаковых строк, прирост +00%/00 строк
 * [report](./log/jscpd-html/jscpd-report.md)
 * 00% строк CSS: 00 клонов, 00 одинаковых строк, прирост +00%/00 строк
 * [report](./log/jscpd-css/jscpd-report.md)
 * 00% строк TS: 00 клонов, 00 одинаковых строк, прирост +00%/00 строк
 * [report](./log/jscpd-ts/jscpd-report.md)
 * [duplicates.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/duplicates.sh)

## Правописание

 * 00% - 00 ошибок в 00 из 00 js|ts файлах, прирост +00%/00 ошибок
 * [словарь исключений](./.cspell-dict-exclude.txt)
 * [spell-excluded](./log/spell-excluded.log)
 * [spell-excluded.words](./log/spell-excluded.words.log)
 * [spell-excluded.uniq-files](./log/spell-excluded.uniq-files.log)
 * [spell.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/spell.sh)
 * ```bash
	tail -n 1 log/spell.summary.log
	cat log/spell.log | tail -n +4 | grep -v '^[[:blank:]]*$' | wc -l
	cat log/spell.issues.log | grep -i word | awk -F'(' '{print$2}' | awk -F')' '{print $1}' | sort | uniq | wc -l
	cat log/spell.log | grep -i word | awk -F':' '{print$1}' | sort | uniq | wc -l
	```

### TODO Важные ошибки правописания

 * необходимо отредактировать `log/spell.words.important.log`
 * [spell.important.sh](https://github.com/bskydive/typescript-tspqwe-linters/blob/master/scripts/linter_folder/spell.important.sh)
 * ```bash
	cat log/spell.words.important.log
	wc -l log/spell.words.important.log
	```
