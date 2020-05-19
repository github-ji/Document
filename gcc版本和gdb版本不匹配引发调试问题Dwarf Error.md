gcc版本和gdb版本不匹配引发调试问题Dwarf Error

## 问题分类

+ 服务配置
## 问题描述

- 继保定制系统，6.0.60 20190610 gcc版本和gdb版本不匹配引发调试问题Dwarf Error。

## 解决方案

1.查看问题（确认为版本问题）。

```
Dwarf Error: wrong version in compilation unit header (is 4, shoule be 2)
```
2.查看gcc版本和gdb版本。

```
gcc -v
	4.8.5
gdb -v
	7.0.1
```
3.查找gcc 4.8.5所匹配的gdb版本。

```
http://www.linx-info.com/download/others/60/amd64/gcc_gdb/4.8/
	gcc-4.8_4.8.5linx_amd64.deb
	gdb-7.10
```
4.gdb更替测试。

```
echo $PATH(查看/usr/local/bin和/usr/bin/哪个在前面默认是local的在前面)
mv gdb-7.10 /usr/local/bin/gdb
cd /usr/local/bin
chown root:root gdb
chmod -R 755 gdb
gdb -v
	7.10  这样子就正常可以使用了。
如果默认是/usr/bin/在前面没有看到7.10在上面基础上再做几步。
cd /usr/bin/
mv gdb gdb-7.0.1
gdb -v
	7.10
```

5.gdb完整替换。（如果出现不能定位问题的话可使用）

```
http://www.linx-info.com/download/others/60/amd64/gcc_gdb/5.3/gdb-7_7.10linx_amd64.deb
dpkg -i gdb-7_7.10linx_amd64.deb
添加一下路径把/usr/local/gdb-7.10添加到PATH的最前面，/usr/local/bin下的gdb先删除。
```



## 附加信息

- 用户单位：南瑞继保
- 硬件型号：
- 适用范围
  - linx-6.0.60
- 测试结果
  - 成功

##     编写人

##     审核人

