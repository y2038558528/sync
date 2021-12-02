#!/bin/sh

#检测网络链接畅通

function network()

{

#超时时间

local timeout=5

#目标网站

local target=www.qq.com

#获取响应状态码

local ret_code=`curl -I -s --connect-timeout ${timeout} ${target} -w %{http_code} | tail -n1`

if [ "x$ret_code" = "x200" ]; then

#网络畅通

return 1

else

#网络不畅通

return 0

fi

return 0

}

#第1次检测

network

first_check=$?

#睡眠60秒

sleep 60

#第2次检测

network

second_check=$?

if [[ $first_check -eq 0 && $second_check -eq 0 ]];then

/usr/bin/logger -c "无法连接互联网，准备重新拨号！"

#执行脚本1重新拨号

/bin/sh /usr/share/repppd.sh

exit -1

fi

/usr/bin/logger -c "网络正常"

exit 0