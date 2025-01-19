#!/bin/bash
declare -a arr=("Github", "Staging")
declare -a pass=("git!2@1212", "beta!223@")

# validate number arguments
re='^[0-9]+$'
if [[ $1 -ne 0 ]] && ! [[ $1 =~ $re ]]; then
   echo "error: Not a number" >&2
   exit 1
fi

#validate the number
n=${#arr[@]}
if [[ $1 -lt 0 ]] || [[ $1 -gt ${n} ]]; then
   echo "Enter a valid number" >&2
   exit 1
fi

#copy the pass if argument is given else get idx from user
if [[ $1 -ne 0 ]]; then
echo ${pass[$1 - 1]} | xclip -selection clipboard
else
for ((i=1; i < ${n}+1; i++))
do
echo "$i. ${arr[$i-1]}"
done
read -p "Enter index : " index
echo ${pass[${index}-1]} | xclip -selection clipboard
fi
