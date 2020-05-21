# ssh -X 报错 X11 forwarding request failed on channel 0

## 问题分类

服务配置        
## 问题描述

继保用户发现远程X远程连接his1主机连上去后，在上面起图形程序最终发现调不出图形报cannot connect to X server。

## 解决方案

1.从根本上出发，X server not connect 查看ssh -X 198.120.200.105(his1)具体信息。

	$ ssh -X 198.120.200.105
	X11 forwarding request failed on channel 0(其中查看到此处异常)

2.根据此处异常分析转发问题。

```
修改/etc/ssh/sshd_config，增加AddressFamily inet。
之后重启ssh服务即可。
```

## 附加信息

+ 用户单位：南瑞继保
+ 硬件型号：
+ 适用范围
  linx-6.0.60-700  

+ 测试结果
    + 成功

## 编写人


## 审核人

