#!/bin/sh

awk '
BEGIN {
    H = 0
    T = 9
    for (k = H; k <= T; ++k)
        x[k] = y[k] = 0
    a[0,0] = 1
} {
    for (s = 0; s < $2; ++s) {
        if      ($1 == "U") y[H]++
        else if ($1 == "D") y[H]--
        else if ($1 == "R") x[H]++
        else if ($1 == "L") x[H]--
        for (k = H+1; k <= T; ++k) {
            dx = x[k-1] - x[k]
            dy = y[k-1] - y[k]
            if (dx ** 2 + dy ** 2 > 2) {
                # (N>0) - (N<0) is a funny way to get the sign of N ie. -1, 0 or 1
                x[k] += (dx>0) - (dx<0)
                y[k] += (dy>0) - (dy<0)
                if (k == T) a[x[k],y[k]]=1
            }
        }
    }
} END {
    print length(a)
}' input.txt


# Y1=-20;Y2=20;X1=-20;X2=20
# grid=""
# for (Y=Y2;Y>=Y1;--Y) {
#     for (X=X1;X<=X2;++X) {
#         for (K=H;K<T+1;++K) {
#             if (X==x[K] && Y==y[K]) {
#                 if (K==H) grid = grid "H"
#                 else grid = grid K
#                 break
#             }
#         }
#         if (K==T+1)
#             grid = grid (X==0&&Y==0?"s":a[X,Y]?"∙":" ")
#     }
#     grid = grid "\n"
# }
# grid = grid NR
# system("tput reset")
# print grid
# system("sleep 0.03")
