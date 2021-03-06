#!/bin/sh
#
# Copyright (C) 2007 OpenWrt.org
#
#

board_name=""
status_led=""
status_led2=""
sys_mtd_part=""
brcm63xx_has_reset_button=""
ifname=""

brcm63xx_detect() {
	board_name=$(awk 'BEGIN{FS="[ \t:/]+"} /system type/ {print $4}' /proc/cpuinfo)

	if [ "$board_name" = "96358VW" ] && [ -n "$(swconfig dev eth1 help 2>/dev/null)" ]; then
		board_name="DVAG3810BN"
	fi

	case "$board_name" in
	96328avng)
		status_led="96328avng::power"
		ifname=eth0
		;;
	96328A-1241N)
		brcm63xx_has_reset_button="true"
		status_led="96328A-1241N:green:power"
		ifname=eth0
		;;
	RTA770BW)
		brcm63xx_has_reset_button="true"
		status_led="RTA770BW:green:diag"
		ifname=eth0
		;;
	RTA770W)
		brcm63xx_has_reset_button="true"
		status_led="RTA770W:green:diag"
		ifname=eth0
		;;
	96328A-1441N1)
		brcm63xx_has_reset_button="true"
		status_led="96328A-1441N1:green:power"
		ifname=eth0
		;;
	963281TAN)
		status_led="963281TAN::power"
		ifname=eth0
		;;
	963281T_TEF)
		brcm63xx_has_reset_button="true"
		status_led="963281T_TEF:green:power"
		ifname=eth0
		;;
	96348GW)
		status_led="96348GW:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth1
		;;
	AR1004G)
		status_led="AR1004G:green:power"
		brcm63xx_has_reset_button="true"
		;;
	CVG834G_E15R3921)
		status_led="CVG834G:green:power"
		ifname=eth0
		;;
	GW6000)
		brcm63xx_has_reset_button="true"
		ifname=eth1
		;;
	GW6200)
		status_led="GW6200:green:line1"
		status_led2="GW6200:green:tel"
		brcm63xx_has_reset_button="true"
		ifname=eth1
		;;
	HW556*)
		status_led="HW556:red:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	96348GW-11)
		status_led="96348GW-11:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth1
		;;
	CT536_CT5621)
		status_led="CT536_CT5621:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	SPW500V)
		status_led="SPW500V:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	AW4139 |\
	AW4339U)
		status_led="dsl-274xb:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	96358-502V)
		status_led="spw303v:green:power+adsl"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	V2110)
		status_led="V2110:power:green"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	CPVA642)
		status_led="CPVA642:green:power:"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	D-4P-W)
		status_led="D-4P-W:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	NB6)
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	"F@ST2504n")
		status_led="fast2504n:green:ok"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	'F@ST2704V2')
		status_led="F@ST2704V2:green:power"
		brcm63xx_has_reset_button="true"
		ifname=eth0
		;;
	*)
		;;
	esac
}

brcm63xx_detect
