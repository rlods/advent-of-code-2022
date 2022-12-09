#!/bin/sh

cat input.txt | tr -d '\n' | awk '{
    split($1,a,"");l=length(a);w=sqrt(l)
    for(t=i=0;i<l;++i){
        x=i%w;y=int(i/w)
        if(x!=0&&y!=0&&x!=w-1&&y!=w-1){
            h=a[i+1];dl=dr=dt=db=rs=bs=0
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

cat input.txt \
    | tr -d '\n' \
    | awk '
{
    split($1, treeArray, "") # Convert input to array
    totalTreeCount = length(treeArray)
    gridWidth = sqrt(totalTreeCount) # Assuming a square grid
    bestScore = 0
    for (treeIndex = 0; treeIndex < totalTreeCount; ++treeIndex) {
        treeX = treeIndex % gridWidth
        treeY = int(treeIndex / gridWidth)
        if (treeX != 0 && treeY != 0 && treeX != gridWidth - 1 && treeY != gridWidth - 1) {
            # Tree is not on grid edge
            treeHeight = treeArray[treeIndex + 1]
            visibleLeftTrees = 0
            visibleRightTrees = 0
            visibleTopTrees = 0
            visibleBottomTrees = 0
            hasRightObstacle = 0
            hasBottomObstacle = 0
            for (otherTreeIndex = 0; otherTreeIndex < gridWidth; ++otherTreeIndex) {
                otherTreeX = otherTreeIndex % gridWidth
                otherTreeY = otherTreeIndex % gridWidth
                if (otherTreeX < treeX) {
                    if (treeArray[(otherTreeX + treeY * gridWidth) + 1] < treeHeight)
                        visibleLeftTrees++
                    else
                        visibleLeftTrees = 1 # Restart count
                }
                if (otherTreeX > treeX && !hasRightObstacle) {
                    visibleRightTrees++
                    hasRightObstacle = treeArray[(otherTreeX + treeY * gridWidth) + 1] >= treeHeight
                }
                if (otherTreeY < treeY) {
                    if (treeArray[(treeX + otherTreeY * gridWidth) + 1] < treeHeight)
                        visibleTopTrees++
                    else
                        visibleTopTrees = 1 # Restart count
                }
                if (otherTreeY > treeY && !hasBottomObstacle) {
                    visibleBottomTrees++
                    hasBottomObstacle = treeArray[(treeX + otherTreeY * gridWidth) + 1] >= treeHeight
                }
            }
            score = visibleLeftTrees * visibleRightTrees * visibleTopTrees * visibleBottomTrees
            if (score > bestScore)
                bestScore = score
        }
    }
    print bestScore
}'
