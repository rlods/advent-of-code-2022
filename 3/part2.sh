#!/bin/sh

cat input.txt | xargs -L3 | awk '{
    split($1,a,"")
    b=$2
    c=$3
    for (i=1;i<=length(a);++i) if (index(b,a[i])>0 && index(c,a[i])>0) {
        s+=index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",a[i])
        break
    }
}
END {print s}'
