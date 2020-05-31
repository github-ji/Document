#!/bin/bash
cp /mnt/pz/driver/NVIDIA-Linux-x86_64-390.48.run /opt/
cp /mnt/60-700/linx-intranet-monitor_2.5.0+Linx60_amd64.tar.gz /opt/
cd /opt
tar -xvf linx-intranet-monitor_2.5.0+Linx60_amd64.tar.gz
chmod -R 755 linx-intranet-monitor_2.5.0+Linx60_amd64
cd linx-intranet-monitor_2.5.0+Linx60_amd64
./linx.sh uninstall
./linx.sh install
cd /mnt/linx_sn_tool_new3/
./get_mac1.sh
cp /mnt/hzpeizhi/asound.conf /etc/
#cp /mnt/interfaces /etc/network/interfaces
#echo "main1" >/etc/hostname
#echo "172.20.0.41     main1">> /etc/hosts
