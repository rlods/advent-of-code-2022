#!/bin/sh

# A X Rock Rock 1 3
# A Y Rock Paper 2 6
# A Z Rock Scissor 3 0
# B X Paper Rock 1 0
# B Y Paper Paper 2 3
# B Z Paper Scissor 3 6
# C X Scissor Rock 1 6
# C Y Scissor Paper 2 0
# C Z Scissor Scissor 3 3

cat input.txt | sed 's/A X/4/g;s/A Y/8/g;s/A Z/3/g;s/B X/1/g;s/B Y/5/g;s/B Z/9/g;s/C X/7/g;s/C Y/2/g;s/C Z/6/g' | awk '{s+=$1} END {print s}'
