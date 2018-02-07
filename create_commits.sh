#!/bin/bash

counter=1
while [ $counter -le 10 ]
do
	echo $counter >> change.txt
	((counter % 5 == 0)) && echo "API_KEY=$(echo -n $counter | shasum -a 1 | awk '{print $1}')" > config.env
	git add --all
	git commit -m "update number $counter"
	((counter++))
done
