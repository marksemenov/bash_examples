#!/usr/bin/env bash

pt="$1"
orig="\/home\/mark\/.qt\/"
repl="\/media\/windows\/.qt\/"

for word in $(grep -RIl ".*\/home\/mark\/\.qt\/5\.9\.3\/.*" $pt)
do
    echo "Fixing $(ls $word)"
    ex $word <<EOF
    :%s/$orig/$repl/g
    :wq
EOF
done

#grep -rIl ".*\/home\/mark\/\.qt\/5\.9\.3\/.*" | awk '{  }'