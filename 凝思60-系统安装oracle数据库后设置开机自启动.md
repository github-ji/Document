# 凝思60-系统安装oracle数据库后设置开机自启动

## 问题分类
    
用户使用
        
## 问题描述

oracle数据库安装完成以后，数据库厂家不会设置开机自启动，需要我们手动设置。因为oracle开启关闭的速度很慢！！如果不设置自启动会导致在重启系统的时候，系统已经关闭但是数据库还没关闭，致使数据异常甚至在开机硬盘自检的时候过不去，重启失败。

## 解决方案

通过脚本的方式将数据库开启关闭命令添加到init.d内，并设置成自启动。

1.首先需要测试oracle数据库本身的开启和关闭命令是否可用。
	
	root用户开启数据库命令
	/etc/init.d/init.ohasd run &
	./users/oracle/app/11.2/grid/bin/crsctl start crs
	#如命令不对，具体命令请联系oracle现场工程师确认

	切换到数据库用户查看数据库状态
	su - grid 
	crs_stat -t 
	
	root用户关闭数据库命令
	./users/oracle/app/11.2/grid/bin/crsctl stop crs 

	
2.如果通过oracle本身的命令可以做到开启关闭数据库那么用脚本的方式把该命令添加到系统/etc/init.d内
	
	vi /etc/init.d/oracle11g-rac

	#!/bin/bash
	### begin init info
	# provides:          oracle11g-rac
	# required-start:    $local_fs $remote_fs $network $syslog $binding_raw_device 
	# required-stop:     $local_fs $remote_fs $network $syslog $binding_raw-device
	# default-start:     2 3 4 5
	# default-stop:      0 1 6
	# x-interactive:     true
	# short-description: start/stop oracle server
	### end init info

	. /lib/lsb/init-functions

	case "$1" in
        start)
                echo -n "Starting oracle 11g rac..."
		sleep 10
		/users/oracle/app/11.2/grid/bin/crsctl start crs&
                dd if=/var/tmp/.oracle/npohasd of=/dev/null bs=1024 count=1&
                ;;

        stop)
                echo -n "Stopping oracle 11g rac..."
		/users/oracle/app/11.2/grid/bin/crsctl stop crs&
                ;;

        restart)
                $0 stop
                sleep 1
                $0 start
                ;;


        *)
                echo "Usage: $0 {start|stop|restart}"
                exit 1
                ;;

	esac


	#End

3.然后通过命令测试脚本是否可用
	
	/etc/init.d/oracle11g-rac start | stop 

	如不可用请检查路径等内容
	
4.将我们自己写的开启关闭数据库命令设置成自启动

	chkconfig oracle11g-rac on 
	chkconfig --list | grep oracle11g-rac	

	如果发现 2345 为on开启的状态，则说明设置成功

5.如果发现chkconfig oracle11g-rac on命令报错，则可能是启动顺序有错，需要手动修改。
	
	rc2.d rc3.d ...rc5.d 是各个启动级别的配置文件
	里面的S代表开启 K代表关闭 后面的数字大小代表优先顺序
	需要我们根据实际情况手动修改


## 附加信息

+ 用户单位：南瑞继保
+ 硬件型号：
+ 适用范围
  
	凝思60系统

+ 测试结果
    + 成功

## 编写人


## 审核人

