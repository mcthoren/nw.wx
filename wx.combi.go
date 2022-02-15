#!/bin/ksh

SRC_D='/home/ghz/dev/wxcomb/'
DST_D='/var/www/htdocs/darkdata.org/ghz/dev/'

cd "${SRC_D}" || exit 1
/usr/local/bin/gnuplot wx.gnuplot
cp ${SRC_D}/* "${DST_D}"
