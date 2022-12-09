#!/bin/sh

cat input.txt | awk '
BEGIN {
    H = 0
    T = 9
    for (i=H; i<=T; ++i)
        x[i]=y[i]=0
    a[0,0]=1
} {
    for (k=0; k<$2; ++k) {
        if      ($1=="U") y[H]++
        else if ($1=="D") y[H]--
        else if ($1=="R") x[H]++
        else if ($1=="L") x[H]--
        for (i=H+1; i<=T; ++i) {
            dx = x[i-1] - x[i]
            dy = y[i-1] - y[i]
            if (dx ** 2 + dy ** 2 > 2) {
                if (dx == 0)
                    if (dy > 0) y[i]++ # ⬆
                    else        y[i]-- # ⬇
                else if (dy == 0)
                    if (dx > 0) x[i]++ # ⮕
                    else        x[i]-- # ⬅
                else if (dy > 0)
                    if (dx > 0) { x[i]++; y[i]++ } # ⬈
                    else        { x[i]--; y[i]++ } # ⬉
                else
                    if (dx > 0) { x[i]++; y[i]-- } # ⬊
                    else        { x[i]--; y[i]-- } # ⬋  
                
                if (i==T)
                    a[x[i],y[i]]=1
            }
        }
    }
} END {
    print length(a)
}'

# Y1=-20;Y2=20;X1=-20;X2=20
# for (Y=Y2;Y>=Y1;--Y) {
#     for (X=X1;X<=X2;++X) {
#         for (o=H;o<T+1;++o) {
#             if (X==x[o] && Y==y[o]) {
#                 if (o==H) printf("H")
#                 else printf(o)
#                 break
#             }
#         }
#         if (o==T+1)
#             printf(X==0&&Y==0?"s":".")
#     }
#     printf("\n")
# }
# printf("\n")
