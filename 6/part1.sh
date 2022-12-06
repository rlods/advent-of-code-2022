#!/bin/sh

cat input.txt | awk '{
    split($1,a,"")
    for (i=1;i<=length(a);++i){
        if (i>4 && --x[a[i-4]]==0)
            delete x[a[i-4]]
        x[a[i]]++
        if (length(x)==4)
            break
    }
    print i
}'
