#!/bin/bash
#===============================================================================
#
#          FILE:  iconv.sh
# 
#         USAGE:  ./iconv.sh 
# 
#   DESCRIPTION:  convert utf8 to gbk
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  12/10/2008 03:40:55 PM CST
#      REVISION:  ---
#===============================================================================
cp Ch4.tex t.tex
iconv -f utf8 -t gbk -o Ch4gbk.tex Ch4.tex
mv Ch4gbk.tex Ch4.tex
