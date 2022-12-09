#!/bin/sh

cat input.txt | tr -d '\n' | awk '{
    split($1,a,"");l=length(a);w=sqrt(l)
    for(t=i=0;i<l;++i){
        x=i%w;y=int(i/w)
        if(x!=0&&y!=0&&x!=w-1&&y!=w-1){
            h=a[(x+y*w)+1];dl=dr=dt=db=rs=bs=0
            for(j=0;j<w;++j){
                m=j%w;n=j%w
                if(m<x)dl=a[(m+y*w)+1]<h?dl+1:1
                if(m>x&&!rs){dr++;rs=a[(m+y*w)+1]>=h}
                if(n<y)dt=a[(x+n*w)+1]<h?dt+1:1
                if(n>y&&!bs){db++;bs=a[(x+n*w)+1]>=h}
            }
            c=dl*dr*dt*db
            if(c>t)t=c
        }
    }
    print t
}'
