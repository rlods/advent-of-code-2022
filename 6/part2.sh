#!/bin/sh

cat input.txt | awk '{
    split($1,a,"")
    for (i=1;i<=length(a);++i){
        if (i>14 && --x[a[i-14]]==0)
            delete x[a[i-14]]
        x[a[i]]++
        if (length(x)==14)
            break
    }
    print i
}'
