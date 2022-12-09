#!/bin/sh

cat input.txt | tr -d '\n' | awk '{
    split($1,a,"");l=length(a);w=sqrt(l)
    for(t=i=0;i<l;++i){
        x=i%w;y=int(i/w)
        if(x==0||y==0||x==w-1||y==w-1)t++
        else{
            h=a[(x+y*w)+1];ol=or=ot=ob=0
            for(j=0;j<w;++j){
                m=j%w;n=j%w
                if(m<x)ol=ol||a[(m+y*w)+1]>=h
                if(m>x)or=or||a[(m+y*w)+1]>=h
                if(n<y)ot=ot||a[(x+n*w)+1]>=h
                if(n>y)ob=ob||a[(x+n*w)+1]>=h
            }
            t+=!(ol&&or&&ot&&ob)
        }
    }
    print t
}'
