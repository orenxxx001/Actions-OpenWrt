#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#============================================================

# 更改默认密码
sed -i 's/root::0:0:99999:7:::/root:$1$MhPcOOTE$DOOyDUwKjP9xnoSfaczsk.:19058:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认IP
sed -i 's/192.168.1.1/192.168.88.8/g' package/base-files/files/bin/config_generate

# 修改hostname
sed -i 's/OpenWrt/XinV-2.0/g' package/base-files/files/bin/config_generate

# Modify the version number版本号里显示一个自己的名字（AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /Build $(TZ=UTC-8 date "+%Y.%m.%d") @ XinV-2.0 /g' package/lean/default-settings/files/zzz-default-settings

# 修改主机名字，把XinV-2.0修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='XinV-2.0'' package/lean/default-settings/files/zzz-default-settings

# 删除自定义源默认的 argon、bootstrap 主题
rm -rf package/lean/luci-theme-argon
rm -rf package/lean/luci-theme-bootstrap

# 添加主题
git clone darkmatter git://github.com/apollo-ng/luci-theme-darkmatter.git package/lean/luci-theme-darkmatter

# 替换默认主题为 luci-theme-darkmatter
# sed -i 's/更改前的信息/更改后的信息/g' ./要修改的文件的目录（可以用本地查看）
sed -i 's/luci-theme-bootstrap/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-neobird/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile

# 更改SSID、密码
sed -i "s/WPAPSK1=.*/WPAPSK1=23456789DDop/g" package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i "s/WPAPSK1=.*/WPAPSK1=23456789DDop/g" package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/SSID1=.*/SSID1=RR-2G/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/SSID1=.*/SSID1=RR-5G/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/AuthMode=.*/AuthMode=WPAPSKWPA2PSK/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/AuthMode=.*/AuthMode=WPAPSKWPA2PSK/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/EncrypType=.*/EncrypType=AES/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/EncrypType=.*/EncrypType=AES/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat
