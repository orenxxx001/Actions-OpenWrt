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

# 修改主机名，把XinV-2.0修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/set system.@system[-1].hostname='OpenWrt'/i\set system.@system[-1].hostname='XinV-2.0'' package/base-files/files/bin/config_generate

# 替换默认主题为 luci-theme-darkmatter
sed -i 's/luci-theme-bootstrap/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile


wifi_name='RR'
wifi_encryption='psk2'
wifi_password='23456789DDop'

echo "修改wifi名称"
sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "修改wifi加密方式"
sed -i "s/none/$wifi_encryption/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "修改wifi加密密码"
sed -i '/set wireless.default_radio${devidx}.encryption=none/aset wireless.default_radio${devidx}.key=$wifi_password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
