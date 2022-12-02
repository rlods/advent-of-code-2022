#!/bin/sh

# A X Rock Lose 0 3
# A Y Rock Draw 3 1
# A Z Rock Win 6 2
# B X Paper Lose 0 1
# B Y Paper Draw 3 2
# B Z Paper Win 6 3
# C X Scissor Lose 0 2
# C Y Scissor Draw 3 3
# C Z Scissor Win 6 1

cat input.txt | sed 's/A X/3/g;s/A Y/4/g;s/A Z/8/g;s/B X/1/g;s/B Y/5/g;s/B Z/9/g;s/C X/2/g;s/C Y/6/g;s/C Z/7/g' | awk '{s+=$1} END {print s}'
