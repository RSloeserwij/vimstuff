#!/usr/bin/env bash

get_args() {
	while [[ $# -gt 0 ]]
	do
		key=$1
	
		case $key in
			-h|--help)
				print_help
				exit 0
				;;
			-v)
				VERBOSE=1
				shift
				;;
			-a|--all)	
				ALL=1
				shift
				;;
			-i|--include)
				for plugin in $(echo $2 | tr "," "\n")
				do
					INCLUDE+=($plugin)
				done
				shift
				shift
				;;
			-x|--exclude)
				for plugin in $(echo $2 | tr "," "\n")
				do
					EXCLUDE+=($plugin)
				done
				shift
				shift
				;;
			-d|--dir)
				DIR="$2"
				shift
				shift
				;;
			-b|--backup)
				BACKUP=$2
				shift
				shift
				;;
			--no-backup)
				BACKUP=""
				shift
				;;
			-p|--prompt)
				PROMPT=-1
				shift
				;;
			-y|--yes)
				PROMPT=1
				shift
				;;
			-n|--no)
				PROMPT=0
				shift
				;;
			*)
				POSITIONAL+=($key)
				shift
				;;
		esac
	done
}

print_args() {

	if [[ $PROMPT -eq -1 ]]; then
		IDEPS="ask"
	elif [[ $PROMPT -eq 0 ]]; then
		IDEPS="no"
	elif [[ $PROMPT -eq 1 ]]; then
		IDEPS="yes"
	fi

	echo \
"PARAMETERS:
===========
POSITIONAL:   ${POSITIONAL[@]}
===========
VERBOSE:      $VERBOSE

ALL:          $ALL
INCLUDE:      ${INCLUDE[@]}
EXCLUDE:      ${EXCLUDE[@]}

DIR:          $DIR
BACKUP:       $BACKUP

INSTALL DEPS: $IDEPS
"
}

export -f get_args
export -f print_args
