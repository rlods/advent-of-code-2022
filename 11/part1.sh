#!/bin/sh

awk -v R=20 '
BEGIN{M=0}
/S/{for(i=3;i<=NF;++i)I[M]=I[M] $i}
/O/{O[M]=$5;V[M]=$6}
/T/{D[M]=$4}
/tr/{T[M]=$6}
/fa/{F[M]=$6;++M}
END{
   for(r=1;r<=R;++r)for(m=0;m<M;++m){
        split(I[m],it,",");delete I[m]
        for(i=1;i<=length(it);++i){
            v=it[i]
            x=V[m]=="old"?v:V[m]
            if(O[m]=="+")v+=x;else v*=x
            v=int(v/3)
            d=!(v%D[m])
            if(d)I[T[m]]=I[T[m]]?I[T[m]]","v:v
            else I[F[m]]=I[F[m]]?I[F[m]]","v:v
            C[m]++
        }
    }
    m1=m2=0
    for(m=0;m<M;++m)
        if(C[m]>m1){m2=m1;m1=C[m]}
        else if(C[m]>m2)m2=C[m]
    print m1*m2
}' input.txt
