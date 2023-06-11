#!/bin/bash

set | grep RUNNER_TOKEN | head -n 1 | awk -F= '{print $2}' > my_token.txt
gh auth login --with-token <my_token.txt
gh ext install Dedac/gh-runner
gh runner create --name gitpod-hosted-runner $OPTIONAL_ARGS >runner-creation.log
/bin/bash ./gitpod-hosted-runner/run.sh >runner.log
rm -rf gitpod-hosted-runner
rm my_token.txt
