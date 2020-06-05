#!/bin/bash
# date 2020-06-04 15:18:25
# author calllivecn <c-all@qq.com>

CWD=$(pwd -P)

TMP=$(mktemp -d -p "$CWD")

clean(){
	echo "clean... ${TMP}"
	rm -rf "${TMP}"
	echo "done"
}

trap clean SIGINT SIGTERM EXIT ERR

# move
cp -rv src/* "${TMP}"

pip3 install --no-compile --target "${TMP}/" django

python3 -m zipapp "$TMP/" -c -m "manage:main" -o djhello.pyz


