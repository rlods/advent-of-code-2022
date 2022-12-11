#!/bin/sh

awk 'BEGIN{x=1;W=40}{
    d=$1=="addx"?2:1
    for(i=0;i<d;++i){
        ++c;t=c-x-b+1
        printf(t>0&&t<4?"#":".")
        if(c%W==0){b+=W;printf("\n")}
    }
    if($1=="addx")x+=$2
}' input.txt


# Replaced
# printf(b+x==c||b+x+1==c||b+x+2==c?"#":".")
# By
# t=c-x-b
# printf(t>0&&t<4?"#":".")

