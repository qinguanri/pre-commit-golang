#!/usr/bin/env bash
#
# Capture and print stdout/stderr, since golint doesn't use proper exit codes
#
set -e
golint_cmd=`which golint`
if [ "$golint_cmd" == "" ]; then
    golint_cmd="golint"
fi

exec 5>&1
for file in "$@"; do
    output="$(golint_cmd "$file" 2>&1 | tee /dev/fd/5)"
    [[ -z "$output" ]]
done
