#!/usr/bin/env bash

PERMISSION=$EUID

if [[ $PERMISSION == 0 ]]; then
    echo -e "Congratulation... You are root!.."
else
    echo -e "YOU ARE NOT ROOT!.."
fi
