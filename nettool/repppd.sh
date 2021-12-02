#!/bin/sh

/usr/bin/logger -c "断开拨号连接"

killall pppd

/usr/bin/logger -c "延时15秒"

sleep 15

/usr/bin/logger -c "重新拨号"

pppd file /tmp/ppp/options.wan0 >/dev/null 2>&1 &