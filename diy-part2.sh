#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# Lab 4 - Yeu cau 1: thay "W I R E L E S S   F R E E D O M" tren banner bang ten nhom.
# GROUP_NAME duoc truyen tu workflow (input group_name), mac dinh "NHOM 10".
BANNER_FILE=package/base-files/files/etc/banner
GROUP_NAME="${GROUP_NAME:-NHOM 1}"
# Chi giu ky tu an toan cho sed, viet hoa, chen dau cach giua cac ky tu giong banner goc
SAFE_NAME=$(printf '%s' "$GROUP_NAME" | tr -cd 'A-Za-z0-9 _.-' | tr '[:lower:]' '[:upper:]')
SPACED_NAME=$(printf '%s' "$SAFE_NAME" | sed -e 's/\(.\)/\1 /g' -e 's/ *$//')
if grep -q 'W I R E L E S S   F R E E D O M' "$BANNER_FILE"; then
	sed -i "s/W I R E L E S S   F R E E D O M/${SPACED_NAME}/" "$BANNER_FILE"
	echo "Banner updated with group name: $SAFE_NAME"
	cat "$BANNER_FILE"
else
	echo "WARNING: khong tim thay chuoi WIRELESS FREEDOM trong $BANNER_FILE" >&2
fi
