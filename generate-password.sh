#!/bin/bash

# Password Generator Script
# Generates a [pseudo-random] password
# Ben Stokman <ben.stokman@protonmail.com>

# Usage: generate-password [flags]
# Flags:
#        [-l, --length] <ingeger-value>: defines length as a command line argument
#        [-s, --silent]: does not display intro and other messages unless nessicary

chars="!@#$%^&*()0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
digits="1234567890"
flagtraverse="none"

for i in "$@"; do
	if [ "$i" == "-l" -o "$i" == "--length" ]; then
		flagtraverse="lengthcheck"
		flagtraverselengthswitch="true"
		
	elif [ "$flagtraverse" == "lengthcheck" ]; then
		length="$i"
		flagtraverse="none"
	elif [ "$i" == "-s" -o "$i" == "--silent" ]; then
		flagtraversesilent="true"
	fi
done

if [ "$flagtraversesilent" != "true" ]; then
	echo "Welcome to a BASH password generator"
fi

if [ "$flagtraverselengthswitch" != "true" ]; then
	echo "Please enter length:"
	read length
fi

if [ "$flagtraversesilent" != "true" ]; then
	echo "Here is your password:"
fi

for i in $( seq 1 $length )
do
	echo "${chars:$(( RANDOM % ${#chars} )):1}" #
done | tr -d "\n"
echo ""

exit
