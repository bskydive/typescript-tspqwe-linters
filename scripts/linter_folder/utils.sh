# utils
# usage
# . ./utils.sh


getLinesFilesWriteStats() {
	# usage:
	# linesFilesWriteStats "\*.{less,scss,css,ts,html}" "text1|/\*|//" "src/" "log/comments.all" "log/comments.md" "all"
	# linesCount=$(linesFilesWriteStats "\*.{less,scss,css,ts,html}" "text1|/\*|//" "src/" "log/comments.all" "log/comments.md" "all")

	fileNames=$1 #\*.{less,scss,css,ts,html}
	pattern=$2 #text1|/\*|//
	path=$3 #src/
	logFilePrefix=$4 #log/comments.all
	summaryFile=$5 #log/comments.md
	comment=$6 #all

	grep --include=${fileNames} -RiEn ${pattern} ${path} > ${logFilePrefix}".log"
	wc -l ${logFilePrefix} >> ${summaryFile}

	grep --include=${fileNames} -RiEl ${pattern} ${path} > ${logFilePrefix}".files.log"
	wc -l ${logFilePrefix}".files.log" >> ${summaryFile}

	linesCount=`cat  ${logFilePrefix}".files.log" | wc -l`

	return ${linesCount}
}
