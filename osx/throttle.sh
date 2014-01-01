#!/bin/sh  
   
LIMITDOWN="10Kbytes/s"  
LIMITUP="10Kbytes/s"  
   
if [[ $EUID -ne 0 ]]; then  
 echo "This script must be run as root." 1>&2  
 exit 1  
fi  
   
ipfw pipe 1 config bw $LIMITDOWN  
ipfw pipe 2 config bw $LIMITUP  
ipfw add 1 pipe 1 tcp from any to me  
ipfw add 2 pipe 2 tcp from me to any  
