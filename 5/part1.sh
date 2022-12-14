#!/bin/sh

cat input.txt | grep "m" | sed -r 's/move ([0-9]+) from ([0-9]+) to ([0-9]+)/\1 \2 \3/g' | awk -v w="$(cat input.txt | grep "\[" | sed 's/    / [_]/g' | sed -r 's/\[([A-Z_])\]/\1/g' | awk '{a[i++]=$0} END {for(j=i-1; j>=0;j--)print a[j]}' | rs -T -g0 | sed -r 's/\_//g' | tr '\n' ' ')" 'BEGIN {
    ORS=""
    split(w, a, " ")
} {
    for(i=0;i<$1;++i){
        a[$3]=a[$3] substr(a[$2],length(a[$2]))
        a[$2]=substr(a[$2],1,length(a[$2])-1)
    }
}
END {
    for(i=0;i<length(a);++i)
        print substr(a[i],length(a[i]))
}'