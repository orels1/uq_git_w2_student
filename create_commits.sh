#!/bin/bash

counter=1
while [ $counter -le 500 ]
do
	echo $counter >> change.txt
	((counter % 5 == 0)) && echo "API_KEY=$(echo -n $counter | shasum -a 1 | awk '{print $1}')"
	git add change.txt
	git commit -m "update number $counter"
	((counter++))
done
