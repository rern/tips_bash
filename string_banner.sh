#!/bin/bash

A1='  #  '
A2=' # # '
A3='#   #'
A4='#####'
A5='#   #'

B1='#### '
B2='#   #'
B3='#### '
B4='#   #'
B5='#### '

C1='  ###'
C2=' #   '
C3='#    '
C4=' #   '
C5='  ###'

string='BBC'
# string to array
for (( i=0 ; i < ${#string} ; i++ )); do
	st=${string:i:1}
	ar1[i]=${st}1
	ar2[i]=${st}2
	ar3[i]=${st}3
	ar4[i]=${st}4
	ar5[i]=${st}5
done
l1=""; l2=""; l3=""; l4=""; l5=""
for (( i=0 ; i < ${#string} ; i++ )); do
	l1=$l1"${!ar1[i]} "
	l2=$l2"${!ar2[i]} "
	l3=$l3"${!ar3[i]} "
	l4=$l4"${!ar4[i]} "
	l5=$l5"${!ar5[i]} "
done
echo "$l1"
echo "$l2"
echo "$l3"
echo "$l4"
echo "$l5"
