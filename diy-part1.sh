#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add luci-theme-darkmatter
sed -i '$a src-git darkmatter https://github.com/apollo-ng/luci-theme-darkmatter.git' feeds.conf.default

# 更改SSID、密码
sed -i "s/WPAPSK1=.*/WPAPSK1=23456789DDop#@！/g" package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i "s/WPAPSK1=.*/WPAPSK1=23456789DDop#@！/g" package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/SSID1=.*/SSID1=RR-2G/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/SSID1=.*/SSID1=RR-5G/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/AuthMode=.*/AuthMode=WPAPSKWPA2PSK/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/AuthMode=.*/AuthMode=WPAPSKWPA2PSK/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat
sed -i 's/EncrypType=.*/EncrypType=AES/g' package/lean/mt/drivers/mt_wifi/files/mt7603.dat
sed -i 's/EncrypType=.*/EncrypType=AES/g' package/lean/mt/drivers/mt_wifi/files/mt7615.dat

