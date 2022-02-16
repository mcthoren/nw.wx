#!/bin/ksh

SRC_D='/home/ghz/repos/nw.wx'
DST_D='/var/www/htdocs/darkdata.org/ghz/nw.wx'
LOCK="${DST_D}/nw.wx.lock"

[ -e "${LOCK}" ] && {
	echo "$0: lock exists" | logger
	exit 1
}

cd "${SRC_D}" || exit 1
/usr/local/bin/gnuplot wx.gnuplot
cp ${SRC_D}/* "${DST_D}"

rm "${LOCK}"
