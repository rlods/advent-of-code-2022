#!/bin/sh

awk 'BEGIN{x=1}{
    d=$1=="addx"?2:1
    for(i=0;i<d;++i){
        if(c%240==0){b=0;printf("\033c")}
        ++c;t=c-x-b+1
        printf(t>0&&t<4?"#":".")
        if(c%40==0){b+=40;printf("\n")}
    }
    if($1=="addx")x+=$2
}' input.txt


# Replaced
# printf(b+x==c||b+x+1==c||b+x+2==c?"#":".")
# By
# t=c-x-b
# printf(t>0&&t<4?"#":".")

