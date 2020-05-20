#!/bin/bash

if [ -z "$1" ];then
	dst="/usr/share/smp/linx_config"
else
	dst=$1
fi

efile="/usr/share/smp/linx_config.en"
enfile="/usr/share/smp/linx_config_*.en"
gmssl="/usr/local/gmssl/bin/gmssl"


function decode_files {
	for i in `ls /usr/share/smp/linx_config_*.en`;do
		tmp=`echo $i | sed 's/.en//g' | sed 's/\/usr\/share\/smp\///g'`
		$gmssl pkeyutl -decrypt -in $i -pkeyopt ec_scheme:sm2 -inkey /usr/share/smp/private.pem -out $HOME/$tmp
		cat $HOME/$tmp >> $dst
		rm -rf $HOME/$tmp

	done
	

}

if [ -e "/usr/share/smp/linx_config_0001.en" ];then	
	decode_files
else
	$gmssl pkeyutl -decrypt -in $efile -pkeyopt ec_scheme:sm2 -inkey /usr/share/smp/private.pem -out $dst
fi

