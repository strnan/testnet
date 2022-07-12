#!/bin/bash

address=$(curl -s 185.193.17.129:26657/status | jq -r .result.validator_info.address)
numBlocks=100
min_uptime=75    #if uptime below 75%, it auto restarting quicksilver service
for((;;)); do

lastBlock=$(curl -s 185.193.17.129:26657/block | jq -r .result.block.header.height)
lastBlock=$(echo $lastBlock | bc -l)

success=0
i=0

while [ $i -lt $numBlocks ]; do
    height=$((lastBlock-i))
    if curl -s 185.193.17.129:26657/block?height=$height | grep -q $address ; then
        success=$((success+1))
    fi
    i=$((i+1))
done

uptime=$(($success*100/$numBlocks))
missing_block=$(($numBlocks-$success))
echo  $missing_block "already missed in the last" $numBlocks

if (($uptime>=$min_uptime)); then
echo $uptime
else
echo $uptime
sudo systemctl restart quicksilverd
break
fi
sleep 1
done
