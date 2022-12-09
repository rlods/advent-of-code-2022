#!/bin/sh

cat input.txt | tr -d '\n' | awk '{
    split($1,a,"");l=length(a);w=sqrt(l)
    for(t=i=0;i<l;++i){
        x=i%w;y=int(i/w)
        if(x==0||y==0||x==w-1||y==w-1)t++
        else{
            h=a[i+1];ol=or=ot=ob=0
            for(j=0;j<w;++j){
                m=j%w;n=j%w
                if(m<x&&!ol)ol=a[(m+y*w)+1]>=h
                if(m>x&&!or)or=a[(m+y*w)+1]>=h
                if(n<y&&!ot)ot=a[(x+n*w)+1]>=h
                if(n>y&&!ob)ob=a[(x+n*w)+1]>=h
            }
            t+=!(ol&&or&&ot&&ob)
        }
    }
    print t
}'

cat input.txt \
    | tr -d '\n' \
    | awk '
{
    split($1, treeArray, "") # Convert input to array
    totalTreeCount = length(treeArray)
    gridWidth = sqrt(totalTreeCount) # Assuming a square grid
    visibleTreeCount = 0
    for (treeIndex = 0; treeIndex < totalTreeCount; ++treeIndex) {
        treeX = treeIndex % gridWidth
        treeY = int(treeIndex / gridWidth)
        if (treeX == 0 || treeY == 0 || treeX == w-1 || treeY == w-1) {
            # Tree is visible because on grid edge
            visibleTreeCount++
        }
        else {
            treeHeight = treeArray[treeIndex + 1]
            hasLeftObstacle = 0
            hasRightObstacle = 0
            hasTopObstacle = 0
            hasBottomObstacle = 0
            for (otherTreeIndex = 0; otherTreeIndex < gridWidth; ++otherTreeIndex) {
                otherTreeX = otherTreeIndex % gridWidth
                otherTreeY = otherTreeIndex % gridWidth
                if (otherTreeX < treeX && !hasLeftObstacle)
                    hasLeftObstacle = treeArray[(otherTreeX + treeY * gridWidth) + 1] >= treeHeight
                if (otherTreeX > treeX && !hasRightObstacle)
                    hasRightObstacle = treeArray[(otherTreeX + treeY * gridWidth) + 1] >= treeHeight
                if (otherTreeY < treeY && !hasTopObstacle)
                    hasTopObstacle = treeArray[(treeX + otherTreeY * gridWidth) + 1] >= treeHeight
                if (otherTreeY > treeY && !hasBottomObstacle)
                    hasBottomObstacle = treeArray[(treeX + otherTreeY * gridWidth) + 1] >= treeHeight
            }
            if (!hasLeftObstacle || !hasRightObstacle || !hasTopObstacle || !hasBottomObstacle) {
                # Tree is visible from at least one side
                visibleTreeCount++
            }
        }
    }
    print visibleTreeCount
}'
