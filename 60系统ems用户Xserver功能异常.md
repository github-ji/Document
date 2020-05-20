# 南瑞科技60系统ems用户Xserver功能异常

## 问题分类
    
用户使用
        
## 问题描述

用户发现自己的软件无法启动图形功能，xhost +提示No protocol specified

## 解决方案

1.修改用户配置文件.cshrc 将XAUTHORITY加上注释

	vi /users/ems/.cshrc
	
	#setenv XAUTHORITY /users/ems.Xauthority

	cd /users/ems
	source .cshrc 

2.重新开一个终端后，输入用户图形命令发现正常。

## 附加信息

+ 用户单位：南瑞科技
+ 硬件型号：曙光
+ 适用范围
  linx-6.0.60-700  

+ 测试结果
    + 成功

## 编写人


## 审核人

