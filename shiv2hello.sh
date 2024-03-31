#!/bin/bash
# date 2020-06-04 15:58:24
# author calllivecn <calllivecn@outlook.com>

CWD=$(pwd -P)
TMP=$(mktemp -d -p "$CWD")

DEPEND_CACHE="${CWD}/depend-cache"

if [ -d "$DEPEND_CACHE" ];then
	echo "使用depend-cache ~"
	cp -rv "$DEPEND_CACHE"/* "$TMP"
else
	mkdir -v "${DEPEND_CACHE}"
	pip install --no-compile --target "$DEPEND_CACHE" -r requirements.txt
	cp -rv "$DEPEND_CACHE"/* "$TMP"
fi

NAME="djhello"
EXT=".pyz"

clean(){
	echo "clean... ${TMP}"
	rm -rf "${TMP}"
	echo "done"
}

trap clean SIGINT SIGTERM EXIT ERR

cp -rv src/* "$TMP"

shiv --site-packages "$TMP" --compressed -p '/usr/bin/python3 -sE' -o "${NAME}.pyz" -e main.main
