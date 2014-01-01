#!/bin/sh  
   
if [[ $EUID -ne 0 ]]; then  
 echo "This script must be run as root." 1>&2  
 exit 1  
fi  
   
ipfw delete 1  
ipfw delete 2  
