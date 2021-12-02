#!/bin/sh
# 自动检查线路是否正常，连续30秒不正常就重启 Openwrt 重新拨号
# 本脚本以湖北移动dns服务器ip为检测标准,如需其他运营商或者地区,请选择修改ip地址,如114.114.114.114或者119.29.29.29,尽量不要用8.8.8.8之类的地址

PING='ping -c 5 211.137.64.163|grep -v grep|grep "64 bytes" |wc -l'

if [ ${PING} -ne 0 ];then
    exit 0
else
    /etc/init.d/network restart
fi

sleep 30

PING2='ping -c 5 211.137.64.163|grep -v grep|grep "64 bytes" |wc -l'

if [ ${PING2} -ne 0 ];then
    exit 0
else
    reboot -nf
fi

### 将文件放到/usr/share/ 目录
### crontab -e
### 添加内容 1-59/5 * * * * /usr/share/net_watchdog.sh
### reboot -nf 为强制不保存信息重启 如不正常可修改为 reboot
