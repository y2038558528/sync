wget -P /usr/local https://ghproxy.com/https://github.com/fatedier/frp/releases/download/v0.38.0/frp_0.38.0_linux_arm64.tar.gz
cd /usr/local
tar -zxvf frp_0.38.0_linux_arm64.tar.gz  -C /usr/local/ 
mv frp_0.38.0_linux_arm64 frp
cd systemd
wget https://raw.githubusercontent.com/y2038558528/sync/main/frpc.service
wget https://raw.githubusercontent.com/y2038558528/sync/main/frps.service
cp /usr/local/frp/systemd/frpc.service /lib/systemd/system/
cp /usr/local/frp/systemd/frps.service /lib/systemd/system/
