#!/bin/sh

B=`cat input.txt | grep "\[" | sed 's/    / [_]/g' | sed -r 's/\[([A-Z_])\]/\1/g' | awk '{a[i++]=$0} END {for(j=i-1; j>=0;j--)print a[j]}' | rs -T -g0 | sed -r 's/\_//g' | awk '{print "w"NR"=\""$0"\""}' | tr '\n' ';'`
E=`cat input.txt | grep "\[" | sed 's/    / [_]/g' | sed -r 's/\[([A-Z_])\]/\1/g' | awk '{a[i++]=$0} END {for(j=i-1; j>=0;j--)print a[j]}' | rs -T -g0 | sed -r 's/\_//g' | awk '{print "substr(w"NR",length(w"NR"))"}' | tr '\n' ' '`
P=`cat input.txt | grep "m" | sed -r 's/move ([0-9]+) from ([0-9]+) to ([0-9]+)/\1 \2 \3/g' | awk -v b="$B" -v e="$E" 'BEGIN {print "END {"b} {print "for(i=0;i<"$1";++i){w"$3"=w"$3" substr(w"$2",length(w"$2"));w"$2"=substr(w"$2",1,length(w"$2")-1)}"} END {print "print "e"}"}'`
awk "$P" < /dev/null
