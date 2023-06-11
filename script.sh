#!/bin/bash

set | grep RUNNER_TOKEN | head -n 1 | awk -F= '{print $2}' > my_token.txt
gh auth login --with-token <my_token.txt
gh ext install Dedac/gh-runner
gh runner create --name gitpod-hosted-runner1 $EXTRA_ARGS >runner-creation.log
/bin/bash ./gitpod-hosted-runner1/run.sh >runner.log
rm my_token.txt
