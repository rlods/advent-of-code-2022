#!/bin/sh

awk -F '[^[:alnum:]]' '{s+=$1-$3>=0&&$2-$4<=0||$3-$1>=0&&$4-$2<=0}END{print s}' input.txt
