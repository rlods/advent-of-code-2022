#!/bin/sh

awk -F '[^[:alnum:]]' '{s+=$1+0<=$4+0&&$2+0>=$3+0} END {print s}' input.txt
