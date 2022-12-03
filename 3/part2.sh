#!/bin/sh

cat input.txt | xargs -L3 | awk '{
    split($1,a,"")
    for(i=1;i<=length(a);++i) if(index($2,a[i])>0 && index($3,a[i])>0) {
        s+=index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",a[i])
        break
    }
} END {print s}'
