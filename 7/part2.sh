#!/bin/sh

cat input.txt | awk 'BEGIN{c="";l=1;p[1]=""}{
    if($1!="$"&&$1!="dir"){
        c="";for(i=1;i<=l;++i){c=c""p[i]"/";x[c]+=$1}
    }
    else if($2=="cd")
        if($3=="..")l=l-1;else if($3=="/")l=1;else{l=l+1;p[l]=$3}
}END{s=70000000;g=x["/"]-s+30000000;for(i in x)if(x[i]<s&&x[i]>=g)s=x[i];print s}'
