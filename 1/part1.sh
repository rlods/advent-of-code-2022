#!/bin/sh

cat input.txt | awk -v RS= '{for(i=1;i<=NF;i++)a[NR]+=$i} END {for(i in a) print a[i]}' | sort -n | tail -1
