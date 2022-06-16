#!/bin/bash

string=01234567890abcdefgh
echo "string=01235467890abcdef"
echo
echo "echo \${string:7}"
echo ${string:7}
echo ''
echo "echo \${string:7:0}"
echo ${string:7:0}
echo 
echo "echo \${string:7:2}"
echo ${string:7:2}
echo
echo "echo \${string:7:-2}"
echo ${string:7:-2}
echo
echo "echo \${string: -7}"
echo ${string: -7}
echo
echo "echo \${string: -7:2}"
echo ${string: -7:2}
echo
echo "echo \${string: -7:-2}"
echo ${string: -7:-2}
