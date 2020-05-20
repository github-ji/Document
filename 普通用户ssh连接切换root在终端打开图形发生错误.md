#普通用户ssh连接切换root在终端打开图形发生错误

## 问题分类
    
+ 服务配置
     
## 问题描述

+ 南瑞继保定制版V6.0.60系统普通用户连接上切换root用户在终端打开图形发生错误

## 解决方案


1、登陆用户打开终端执行cat /etc/issue确定版本信息

	Linx 6.0.60-700 NARITECH-NS5000 TS 1.0.0.20180821

2、通过ssh -X 普通用户@IP地址连接，在切换root用户su - root，例如执行firefox打开火狐浏览器发生错误

	root@Linx:~#firefox
	Error:cannot open display: localhost:10.0

3、在终端执行xauth list命令把回显的值复制

	root@Linx:~#xauth list
	Linx/unix:0 MIT-MAGIC-COOKIE-1 af76bc97f1e9202a734dba66f2de6c

4、执行xauth add粘贴xauth list回显值

	root@Linx:~#xauth add Linx/unix:0 MIT-MAGIC-COOKIE-1 af76bc97f1e9202a734dba66f2de6c

5、再次执行firefox,可以在本地显示远端的界面，例如打开了火狐浏览器

 
## 附加信息

+ 用户单位：南瑞继保
+ 硬件型号：未知
+ 适用范围
    + linx-6.0.60
+ 测试结果
    + 成功

## 编写人


## 审核人

