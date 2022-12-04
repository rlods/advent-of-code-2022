#!/bin/sh

awk -F '[^[:alnum:]]' '{s+=$1-$4<=0&&$2-$3>=0} END {print s}' input.txt
