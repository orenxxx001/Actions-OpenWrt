#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#============================================================


# 更改默认密码---》可用
sed -i 's/root::0:0:99999:7:::/root:$1$MhPcOOTE$DOOyDUwKjP9xnoSfaczsk.:19058:0:99999:7:::/g' package/base-files/files/etc/shadow

# 修改默认IP---》可用
sed -i 's/192.168.1.1/192.168.88.8/g' package/base-files/files/bin/config_generate

# 修改hostname---》可用
sed -i 's/OpenWrt/XinV-2.0/g' package/base-files/files/bin/config_generate

# Modify the version number版本号里显示一个自己的名字（AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）---》可用
sed -i 's/OpenWrt /Build $(TZ=UTC-8 date "+%Y.%m.%d") @ XinV-2.0 /g' package/lean/default-settings/files/zzz-default-settings

# 替换默认主题为 luci-theme-darkmatter
sed -i 's/luci-theme-bootstrap/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-argon/luci-theme-darkmatter/g' feeds/luci/collections/luci/Makefile
