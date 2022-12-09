#!/bin/sh

cat input.txt | awk '
BEGIN {
    H = 0
    T = 1
    x[H] = y[H] = x[T] = y[T] = 0
    a[0,0] = 1
} {
    for (k=0; k<$2; ++k) {
        if      ($1=="R") x[H]++
        else if ($1=="L") x[H]--
        else if ($1=="U") y[H]++
        else if ($1=="D") y[H]--
        s2 = (x[H] - x[T]) ** 2 + (y[H] - y[T]) ** 2
        if (s2 > 2) {
            s = sqrt(s2)
            if      (y[H]==y[T]) d=x[H]>x[T]?"⮕":"⬅"
            else if (x[H]==x[T]) d=y[H]>y[T]?"⬆":"⬇"
            else if (y[H]>y[T])  d=x[H]>x[T]?"⬈":"⬉"
            else                 d=x[H]>x[T]?"⬊":"⬋"  
        
            if      (d=="⮕") x[T]++
            else if (d=="⬅") x[T]--
            else if (d=="⬆") y[T]++
            else if (d=="⬇") y[T]--
            else if (d=="⬈") {x[T]++; y[T]++}
            else if (d=="⬉") {x[T]--; y[T]++}
            else if (d=="⬊") {x[T]++; y[T]--}
            else if (d=="⬋") {x[T]--; y[T]--}
            a[x[T],y[T]]=1
        }
    }
} END {
    print length(a)
}'

# print("\033[2J")
# Y1=-5;Y2=5;X1=-5;X2=5
# for (Y=Y2;Y>=Y1;--Y) {
#     for (X=X1;X<=X2;++X) {
#         if      (X==x[H] && Y==y[H]) printf("H")
#         else if (X==x[T] && Y==y[T]) printf("T")
#         else if (X==0 && Y==0)       printf("s")
#         else                         printf(".")
#     }
#     printf("\n")
# }
# printf("\n")
# system("sleep 0.3");