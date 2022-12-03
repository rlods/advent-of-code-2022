#!/bin/sh

cat input.txt | awk '{   
    split(substr($0,1,length/2),a,"")
    b=substr($0,length/2+1)
    for (i=1;i<=length(a);++i) if (index(b,a[i])>0) {
        s+=index("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",a[i])
        break
    }
} END {print s}'
