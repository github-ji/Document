#! /bin/bash

if [ -z "$1" ];then
	file="/usr/share/smp/linx_config"
else
	file=$1
fi

efile="/usr/share/smp/linx_config.en"
enfile="/usr/share/smp/linx_config_*.en"
gmssl="/usr/local/gmssl/bin/gmssl"


function split_en {
	rm -rf $enfile
	split -b 500 $file -d -a 4 /usr/share/smp/linx_config-
	for i in `ls /usr/share/smp/linx_config-*`;do
		tmp=`echo $i | sed 's/-/_/'`
		$gmssl pkeyutl -encrypt -in $i -pkeyopt ec_scheme:sm2 -inkey /usr/share/smp/private.pem -out ${tmp}.en

		rm -rf $i
	done

}

if [ -f "$file" ];then
	size=`ls -l $file | awk -F ' ' '{print $5}'`
	if [ $size -ge 600 ];then
		split_en
		if [ -e $efile ];then
			rm -rf $efile
		fi
	else
		$gmssl pkeyutl -encrypt -in $file -pkeyopt ec_scheme:sm2 -inkey /usr/share/smp/private.pem -out $efile
		if [ -e "/usr/share/smp/linx_config_0001.en" ];then
            rm -rf $enfile
		fi

	fi
	
	rm -f $file
fi

