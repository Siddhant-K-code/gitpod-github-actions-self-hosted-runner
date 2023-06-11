#!/bin/bash

set | grep RUNNER_TOKEN | head -n 1 | awk -F= '{print $2}' >my_token.txt
gh auth login --with-token <my_token.txt
gh ext install Dedac/gh-runner
gh runner create --name $1 $OPTIONAL_ARGS >runner-creation.log
/bin/bash ./$1/run.sh >runner.log
rm -rf $1
rm my_token.txt
