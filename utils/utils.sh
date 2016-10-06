#!/bin/bash

NO_MSG_FILE="Error: message file not found or has wrong permissions."

function translate() {
	msg=$(eval "echo \$$(echo $#)")
	translated=$(eval "echo $msg")
	echo $translated
}
function ask() {
  read -p "$(translate "$1" "$2" "$i18n_confirm_options") " CONFIRM;
  if [ "$CONFIRM" == "$i18n_yes_default" ] || [ "$CONFIRM" == "" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function confirm() {
  read -p "$(translate "$1" "$i18n_confirm_value") " CONFIRM;
  if [ "$CONFIRM" == "$i18n_yes_default" ] || [ "$CONFIRM" == "" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function prompt_info() {
  question=$1;
  read -p "$question" VALUE;
  if [ "$( confirm "$VALUE" )" == "true" ]; then
    echo "$VALUE"
  else
    prompt_info "$1"
  fi
}

function check_i18n() {
  lang=${LANG:=english}
  case ${lang} in
		[Pp][Tt]_[Bb][Rr]*    ) I18N_FILE=i18n/messages.pt_BR ;;
		[Ee][Nn][Gg]*         ) I18N_FILE=i18n/messages.en ;;
		*                     ) I18N_FILE=i18n/messages.en ;;
	esac
}

check_i18n

if [ -f ${I18N_FILE} -a -r ${I18N_FILE} -a -x ${I18N_FILE} ]; then
		. ./${I18N_FILE}
else
	echo ${NO_MSG_FILE}
	exit 3
fi

