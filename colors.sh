#!/bin/bash
NONE="\033[0m"

for COLOR in $(seq 30 48) ; do
    for STYLE in $(seq 0 7); do
        TAG="\033[${STYLE};${COLOR}m"
        STR="${COLOR}/${STYLE}"
        echo -ne "${TAG}${STR}${NONE} "
    done
    echo
done

for G in $(seq 0 30 255) 255 ; do
  FG="\033[38;2;0;${G};0m"
  echo -ne "${FG}${G}${NONE} "
done
echo

for R in $(seq 0 30 255) 255 ; do
  BG="\033[48;2;${R};0;0m"
  echo -ne "${BG}${R}${NONE} "
done
echo
