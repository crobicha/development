#!/bin/bash

cd ~/repos/itriage/aetnaboost-android

i=0
for x in $(cat git_branches_to_remove.txt); do
    if [[ 0 -eq $i ]]; then
        echo "Skipping first branch $x"
    elif [[ "develop" == $x ]]; then
        echo "Skipping branch develop"
    elif [[ "master" == $x ]]; then
        echo "Skipping branch master"
    else
        echo "Will remove branch ${i} ${x}"
        #git branch -D ${x}
    fi
    ((i=i+1))
done

