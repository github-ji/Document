## 60系统安装openoffice
## 问题分类

+ 服务配置

## 问题描述

+ 东大金智需要在60系统上安装openoffice软件打开表格

## 解决方案
1、查看系统版本
    
    cat  /etc/issue
        linx 6.0.60 20181220 \n \l
    
2、解压压缩包

    tar xvf openoffice3-deb.tar.gz -C /opt
    
3、配下载源，(在/etc/apt/sources.list添加如下行)

    deb file:/opt/ openoffice3-deb/
    
4、更新源以及下载

    apt-get update 
    apt-get install openoffice.org openoffice.org-help-zh-cn openoffice.org-l10n-zh-cn
        备注：如果apt-get install 遇到“系统已安装某某软件包，请执行apt-get -f install”这种错误
    
## 附加信息

+ 用户单位：东大金智
+ 硬件型号：无
+ 适用范围
    + linx-6.0.60
+ 测试结果
    + 成功

## 编写人

## 审核人

