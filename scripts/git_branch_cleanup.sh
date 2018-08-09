#!/bin/bash

# TODO: Ignore lines starting with * - the current branch

FILE="git_branches_to_remove.txt"


cd ~/repos/itriage/aetnaboost-android

if [[ -e $FILE ]]; then
    echo "Will remove the following local branches:"
    cat $FILE

    read -n1 -r -p "Press Y to confirm..." key

    if [[ "$key" = 'y' || "$key" = 'Y' ]]; then

        i=0
        for x in $(cat git_branches_to_remove.txt); do
            if [[ "develop" == $x ]]; then
                echo "Skipping branch develop"
            elif [[ "master" == $x ]]; then
                echo "Skipping branch master"
            else
                git branch -D ${x}

            #if [[ 0 -eq $i ]]; then
            #    echo "Skipping first branch (current branch) $x"
            #el
            fi
            ((i=i+1))
        done

        rm $FILE
    else
        echo "Aborting"
        exit
    fi
else
    git branch | tr '*' ' ' > $FILE
    vim $FILE
    echo "Edit $FILE and run script again to remove branches"
fi

