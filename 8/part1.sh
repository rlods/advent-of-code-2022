#!/bin/sh

cat input.txt | tr -d '\n' | awk '{
    split($1,a,"");l=length(a);w=sqrt(l)
    for(i=0;i<l;++i){
        x=i%w;y=int(i/w);v=x==0||y==0||x==w-1||y==w-1
        if(!v){
            c=a[(x+y*w)+1];nl=nr=nt=nb=0
            for(j=0;j<w;++j){
                x2=j%w;y2=j%w
                if(x2<x)nl=nl||a[(x2+y*w)+1]>=c
                if(x2>x)nr=nr||a[(x2+y*w)+1]>=c
                if(y2<y)nt=nt||a[(x+y2*w)+1]>=c
                if(y2>y)nb=nb||a[(x+y2*w)+1]>=c
                v=!nl||!nr||!nt||!nb
                if(!v)break
            }
        }
        t+=v
    }
    print t
}'
