#!/bin/sh

awk 'BEGIN{C[20]=C[60]=C[100]=C[140]=C[180]=C[220]=x=1}{
    d=$1=="addx"?2:1
    for(i=0;i<d;++i){++c;if(c in C)s+=c*x}
    if($1=="addx")x+=$2
}
END{print s}' input.txt