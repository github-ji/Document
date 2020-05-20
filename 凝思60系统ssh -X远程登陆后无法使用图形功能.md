# 凝思60系统ssh -X远程登陆后无法使用图形功能

## 问题分类
    
用户使用
        
## 问题描述

继保用户需要经常ssh -X ip地址远程登陆其他服务器进行调试，但是在使用一些关于图形的命令时会报错
如Gtk-WARNING ** : cannot open display: dd_his1:10.0

## 解决方案

1.通过命令 echo $DISPLAY 查看当前环境变量发现其他远程连接后能打开图形的DISPLAY的输出和打不开图形的DISPLAY变量输出有差异。

2.原因：

X11本机转发使用Xauthority的方式验证。用户登录后会在家目录下创建.Xauthority文件，该文件中存放一个魔法密钥，转发端和接收端的魔法密钥需要一致，可以通过xauth命令查看。

	root@linx:~# xauth
	Using authority file /root/.Xauthority
	xauth> list
	linx/unix:10 MIT-MAGIC-COOKIE-1  	1111111111我是密钥1111111111111111111

本地的X11转发到localhost的6000+10端口（6010），xauth结果中对应主机名、平台、端口、密钥名、密钥

	查看端口状态可以用以下命令查看：
	root@linx:~# netstat -nlp | grep 6010

3.但是如果/etc/hosts文件不正确，或是其他原因会导致auth转发失败。本次南瑞继保的问题就是因为hosts文件写错，导致密钥转发失败导致，需要更改成正确的hosts文件。

## 附加信息

+ 用户单位：南瑞继保
+ 硬件型号：
+ 适用范围：
	+ 凝思6.0.60

+ 测试结果
    + 成功

## 编写人


## 审核人

