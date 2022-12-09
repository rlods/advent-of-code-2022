#!/bin/sh

cat input.txt | awk '
BEGIN{px=py=hx=hy=tx=ty=0;a[0,0]=1}{
    for(i=0;i<$2;++i){
        px=hx;py=hy
        if($1=="R")hx++
        if($1=="L")hx--
        if($1=="U")hy--
        if($1=="D")hy++
        dx=hx-tx;adx=dx>0?dx:-dx
        dy=hy-ty;ady=dy>0?dy:-dy
        if(adx==2)
            if(ady==1){tx=px;ty=py}
            else tx+=dx+(dx>0?-1:1)
        if(ady==2)
            if(adx==1){tx=px;ty=py}
            else ty+=dy+(dy>0?-1:1)
        a[tx,ty]=1
    }
}END{print length(a)}'

cat input.txt | awk '
BEGIN {
    px = py = hx = hy = tx = ty = 0
    a[0,0]=1
}
{
    for (i = 0; i < $2; ++i) {
        px = hx
        py = hy
        if      ($1 == "R") hx++
        else if ($1 == "L") hx--
        else if ($1 == "U") hy--
        else if ($1 == "D") hy++

        dx = hx - tx
        dy = hy - ty
        adx = dx > 0 ? dx : -dx
        ady = dy > 0 ? dy : -dy

        if (adx == 2) {
            if (ady == 1) { tx = px; ty = py }
            else tx += dx + (dx > 0 ? -1 : 1)
        }
        if (ady == 2) {
            if (adx == 1) { tx = px; ty = py }
            else ty += dy + (dy > 0 ? -1 : 1)
        }
        
        a[tx,ty] = 1
    }
}
END {
    print length(a)
}'
