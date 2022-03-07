#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#============================================================

# 修改默认IP
sed -i 's/192.168.1.1/192.168.88.8/g' package/base-files/files/bin/config_generate
 
# 修改hostname
sed -i 's/OpenWrt/XinV-2.0/g' package/base-files/files/bin/config_generate
 
# Modify the version number版本号里显示一个自己的名字（AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
sed -i 's/OpenWrt /Build $(TZ=UTC-8 date "+%Y.%m.%d") @ XinV-2.0 /g' package/lean/default-settings/files/zzz-default-settings
 
# 修改主机名字，把Xiaomi-R4A修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='XinV-2.0'' package/lean/default-settings/files/zzz-default-settings

# 拉取 darkmatter/luci-theme-jj 原作者的源码
git clone https://github.com/jerryc127/hexo-theme-butterfly package/butterfly
git clone https://github.com/coLATin/argon-mod package/argon-mod

# 删除自定义源默认的 argon 主题
rm -rf package/lean/luci-theme-argon

# 替换默认主题为 luci-theme-darkmatter
# sed -i 's/更改前的信息/更改后的信息/g' ./要修改的文件的目录（可以用本地查看）
sed -i 's/luci-theme-neobird/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile

#开启MU-MIMO
sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 修改默认wifi名称Sid为RR
sed -i 's/ssid=OpenWrt/ssid=RR/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#开启MU-MIMO
sed -i 's/mu_beamformer=0/mu_beamformer=1/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi加密方式，没有是none
sed -i 's/encryption=none/encryption=psk2/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

#wifi密码
sed -i 's/key=none/key=23456789DDop#@!/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 删除软件包
rm -rf package/lean/luci-theme-argon
