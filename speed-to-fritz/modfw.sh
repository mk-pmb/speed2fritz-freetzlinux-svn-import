#!/bin/bash
##########################################################################
# function set_model()
# Sets the model dependent parameters
# SPMOD ist the only parameter to be changed according to your hardware 
# Values for SPMOD: "500" (for SI W500V)
#                   "501" (for SP W501V)
#                   "503" (for SP W503V)
#                   "701" (for SP W701V)
#                   "721" (for SP W721V)
#                   "900" (for SP W900V)
#                  "7240" (for AVM 7270)
#                "7270v3" (for AVM 7270v3)
#                     "*" (for Any user TYPE)

##########################################################################
function set_model()
{
if [ "$SRC2_IMG" ]; then
 export FILENAME_FBIMG_2_PATH="$(get_item "$SRC2_IMG" "1")"
 export MIRROR_FBIMG_2_PATH="$(get_item "$SRC2_IMG" "2")"
 export FBIMG_2_PATH="$(get_item "$SRC2_IMG" "0")"
 export FBIMG_2="$(echo $FBIMG_2_PATH | sed -e "s/.*\///")"
fi
#image name may be changed by the skript if zip files are used, see file includefunctions
if [ "$TCOM_IMG" ]; then
 export FILENAME_SPIMG_PATH="$(get_item "$TCOM_IMG" "1")" 
 export MIRROR_SPIMG_PATH="$(get_item "$TCOM_IMG" "2")"
 export SPIMG_PATH="$(get_item "$TCOM_IMG" "0")"
 export SPIMG="$(echo $SPIMG_PATH | sed -e "s/.*\///")"
fi
export FILENAME_FBIMG_PATH="$(get_item "$AVM_IMG" "1")" 
export MIRROR_FBIMG_PATH="$(get_item "$AVM_IMG" "2")"
export FBIMG_PATH="$(get_item "$AVM_IMG" "0")"
export FBIMG="$(echo $FBIMG_PATH | sed -e "s/.*\///")"
case "$1" in
"500")
	export SPNUM="500"
	export HWID="91"
	export CLASS="Sinus"
#	export FBMOD="7150"
#	export FBHWRevision="76"
	[ "$FBMOD" == "" ] && export FBMOD="7150"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	export HWID="101"
	export PROD="DECT_W500V"
    	export CONFIG_PRODUKT="Fritz_Box_$PROD"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ar7_8MB_xilinx_1eth_0ab_pots_wlan_dect_35998"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_IsdnNT="0" 
	export CONFIG_IsdnTE="0" 
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="0" 
	export CONFIG_UsbStorage="0"
	export CONFIG_UsbWlan="0"
	export CONFIG_UsbPrint="0"
	export CONFIG_Debug="0"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_AB_COUNT="0"
	export CONFIG_ETH_COUNT="1"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="y"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	export CONFIG_Pots="1"
	export kernel_size="7798784"
	export CONFIG_ATA_FULL="y"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 
	[ "$CONFIG_TR064" == "" ] && export CONFIG_TR064="n"
	[ "$CONFIG_TR069" == "" ] && export CONFIG_TR069="n"
	[ "$HOSTNAME" == "" ] && export HOSTNAME="fritz.box"
	[ "$NEWNAME" == "" ] && export NEWNAME="FRITZ!Box Fon WLAN Sinus W 500V"
	;;
"501")
	export HWID="93"
	export SPNUM="501"
#	export FBMOD="7140"
#	export FBHWRevision="107"
	[ "$FBMOD" == "" ] && export FBMOD="7140"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	export HWID="101"
	export CLASS="Speedport"
	export PROD="SpeedportW501V"
    	export CONFIG_PRODUKT="Fritz_Box_$PROD"
	export NEWNAME="FRITZ!Box Fon WLAN ${CLASS} W ${SPNUM}V"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ar7_4MB_1eth_2ab_pots_wlan_28776"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_IsdnNT="0" 
	export CONFIG_IsdnTE="0" 
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="0" 
	export CONFIG_UsbStorage="0"
	export CONFIG_UsbWlan="0"
	export CONFIG_UsbPrint="0"
	export CONFIG_Debug="0"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="n"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="1"
        export CONFIG_jffs2_size="3"
	export CONFIG_RAMSIZE="16"
	export CONFIG_ROMSIZE="4"
	export CONFIG_DECT="n"
	export CONFIG_TAM="n"
	export CONFIG_TAM_MODE="0"
	#Mailer2 must be off for older firmwars 
	export CONFIG_MAILER2="n"
	export CONFIG_Pots="1"
	export kernel_size="3866624"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_AB_COUNT="0"
	  export CONFIG_ATA_FULL="y"
	  export CONFIG_Pots="0"
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 
	export CONFIG_EXPERT="y"
	export CONFIG_FONGUI2="n"
	export CONFIG_IPONE="n"
	export CONFIG_FON_HD="y"
	export CONFIG_CAPI_TE="n"
	export CONFIG_CAPI_XILINX="n"
	export CONFIG_USB_HOST_AVM="n"
	export CONFIG_USB_PRINT_SERV="n"
	export CONFIG_USB_STORAGE="n"
	export CONFIG_USB_WLAN_AUTH="n"
	export CONFIG_WLAN_WMM="n"
	export CONFIG_WLAN_WPS="n"
	;;
"701"|"707")
	export SPMOD="707"
	export CLASS="Speedport"
	export SPNUM="701"
	export PROD="SpeedportW701V"
    	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	[ "$FBMOD" == "" ] && export FBMOD="7170"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ar7_8MB_xilinx_4eth_2ab_isdn_pots_wlan_13200"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_IsdnNT="0" 
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="0" 
	export CONFIG_UsbStorage="0"
	export CONFIG_UsbWlan="0"
	export CONFIG_UsbPrint="0"
	export CONFIG_Debug="0"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="n"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	export CONFIG_IsdnTE="1"
	export CONFIG_Pots="1"
	export kernel_size="7798784"
#aditional not in use on W701 but on 7170	
	export CONFIG_DSL_UR8="n"
        export CONFIG_EXPERT="y"
	export CONFIG_GDB="n"
	export CONFIG_GDB_FULL="n"	
	export CONFIG_IPONE="y"
	export CONFIG_LABOR_DSL="y"
	export CONFIG_RELEASE="2"
	export CONFIG_SERVICEPORTAL_URL="none"
	export CONFIG_USB_HOST_AVM="n"
	export CONFIG_USB_STORAGE="y"
	export CONFIG_USB_PRINT_SERV="n"
	export CONFIG_USB_STORAGE="n"
	export CONFIG_USB_STORAGE_USERS="n"
	export CONFIG_USB_WLAN_AUTH="y"
	export CONFIG_VDSL="n"
	export CONFIG_WLAN="n"
	export CONFIG_WLAN_1130TNET="n"
	export CONFIG_WLAN_1350TNET="n"
	export CONFIG_WLAN_GREEN="n"
	export CONFIG_WLAN_IPTV="n"
	export CONFIG_WLAN_MADWIFI="n"
	export CONFIG_WLAN_OPENWIFI="n"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 

    ;;
"721")
	export SPMOD="721"
	export CLASS="Speedport"
	export SPNUM="721"
	export PROD="SpeedportW721V"
    	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBMOD" == "" ] && export FBMOD="7170"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	export HWID="134"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ar7_8MB_xilinx_4eth_2ab_isdn_pots_wlan_13200"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_IsdnNT="0" 
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="0" 
	export CONFIG_UsbStorage="0"
	export CONFIG_UsbWlan="0"
	export CONFIG_UsbPrint="0"
	export CONFIG_Debug="0"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="n"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	#is TE Terminal Equipt
	export CONFIG_IsdnTE="1"
	export CONFIG_Pots="1"
	export kernel_size="7798784"
#additional, not in use on W701 but on 7170
	export CONFIG_DSL_UR8="y"
        export CONFIG_EXPERT="y"
	export CONFIG_GDB="n"
	export CONFIG_GDB_FULL="n"
	export CONFIG_IPONE="y"
	export CONFIG_LABOR_DSL="y"
	export CONFIG_RELEASE="2"
	export CONFIG_SERVICEPORTAL_URL="none"
	export CONFIG_USB_HOST_AVM="n"
	export CONFIG_USB_STORAGE="y"
	export CONFIG_USB_PRINT_SERV="n"
	export CONFIG_USB_STORAGE="n"
	export CONFIG_USB_STORAGE_USERS="n"
	export CONFIG_USB_WLAN_AUTH="y"
	export CONFIG_VDSL="y"
	export CONFIG_VINAX="y"
	export CONFIG_VLYNQ="y"
	export CONFIG_VLYNQ0="0"
	export CONFIG_VLYNQ1="0"
#	export CONFIG_VLYNQ_PARAMS=""
	export CONFIG_WLAN="n"
	export CONFIG_WLAN_1130TNET="n"
	export CONFIG_WLAN_1350TNET="n"
	export CONFIG_WLAN_GREEN="n"
	export CONFIG_WLAN_IPTV="n"
	export CONFIG_WLAN_MADWIFI="n"
	export CONFIG_WLAN_OPENWIFI="n"
	export CONFIG_ATA="y" #no ATA possible with this harware  
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA_FULL="y"
#	  export CONFIG_DSL="n" # removes internet via LAN1 
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 
    ;;
    
"503")
	export SPMOD="503"
	export CLASS="Speedport"
	export SPNUM="503"
	export PROD="SpeedportW503V"
    	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="122"
	[ "$FBMOD" == "" ] && export FBMOD="7270"
	export HWID="136"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ur8_8MB_xilinx_4eth_2ab_isdn_pots_wlan_25488"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_IsdnNT="0" 
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="0" 
	export CONFIG_UsbStorage="0"
	export CONFIG_UsbWlan="0"
	export CONFIG_UsbPrint="0"
	export CONFIG_Debug="0"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="n"
	export CONFIG_DECT2="n"
	export CONFIG_DECT_MONI="n"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	#is TE Terminal Equipt
	export CONFIG_IsdnTE="1"
	export CONFIG_Pots="1"
	export kernel_size="7798784"

	export CONFIG_DSL_UR8="y"
	export CONFIG_CAPI_NT="n"
        export CONFIG_EXPERT="y"
	export CONFIG_GDB="n"
	export CONFIG_GDB_FULL="n"
	export CONFIG_IPONE="y"
	export CONFIG_LABOR_DSL="y"
	export CONFIG_RELEASE="2"
	export CONFIG_SERVICEPORTAL_URL="none"
	export CONFIG_REMOTE_HTTPS="n"
	export CONFIG_MEDIASERVER="n"
	export CONFIG_MEDIASRV="n"
	export CONFIG_USB_HOST="n"
	export CONFIG_USB_HOST_AVM="n"
	export CONFIG_USB_STORAGE="n"
	export CONFIG_USB_PRINT_SERV="n"
	export CONFIG_USB_STORAGE="n"
	export CONFIG_USB_STORAGE_USERS="n"
	export CONFIG_USB_WLAN_AUTH="n"
	export CONFIG_VDSL="n"
	export CONFIG_VINAX="n"
	export CONFIG_VLYNQ="y"
	export CONFIG_VLYNQ0="0"
	export CONFIG_VLYNQ1="0"
	export CONFIG_VLYNQ_PARAMS=" "
	export CONFIG_WLAN_SAVEMEM="n"
	export CONFIG_WLAN_TCOM_PRIO="y"
	export CONFIG_WLAN_TXPOWER="y"
	export CONFIG_WLAN_WMM="y"
	export CONFIG_WLAN_WDS="y"

	export CONFIG_WLAN="y"
	export CONFIG_WLAN_1130TNET="n"
	export CONFIG_WLAN_1350TNET="n"
	export CONFIG_WLAN_GREEN="n"
	export CONFIG_WLAN_IPTV="y"
	export CONFIG_WLAN_MADWIFI="y"
	export CONFIG_WLAN_OPENWIFI="n"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 
    ;;

"900"|"907") 
	export SPMOD="907"
	export CLASS="Speedport"
	export SPNUM="900"
	export PROD="DECT_W900V" 
    	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBMOD" == "" ] && export FBMOD="7170"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	export HWID="102"
	export HWRevision="${HWID}.1.1.0"
	export CONFIG_INSTALL_TYPE="ar7_8MB_xilinx_4eth_2ab_isdn_nt_te_pots_wlan_usb_host_dect_37264"
	export CONFIG_XILINX="y"
	export CONFIG_BOX_FEEDBACK="n"
	export CONFIG_LED_NO_DSL_LED="n"
	export CONFIG_DECT_ONOFF="n"
	export CONFIG_VOL_COUNTER="y"
	export CONFIG_TR064=""
	export CONFIG_TR069=""
	export CONFIG_UsbWlan="0"
	export CONFIG_Debug="0"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="y"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	export CONFIG_Pots="1"
	#has S0 NT
	export CONFIG_IsdnNT="1"
	export CONFIG_IsdnTE="1"
	export CONFIG_Usb="1" 
	export CONFIG_UsbHost="1" 
	export CONFIG_UsbStorage="1"
	export CONFIG_UsbPrint="1"

	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
	  export CONFIG_LABOR_DSL="n"
	fi 
	export kernel_size="7798784"
	;;
"920") 
	export SPMOD="920"
	export CLASS="Speedport"
	export SPNUM="920"
	export PROD="DECT_W920V" 
    	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBMOD" == "" ] && export FBMOD="7270"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="139"
	export HWID="135"
	export HWRevision="${HWID}.1.0.6"
	#export CONFIG_INSTALL_TYPE="ur8_16MB_xilinx_4eth_2ab_isdn_nt_te_pots_wlan_mimo_usb_host_dect_40456"
	export CONFIG_INSTALL_TYPE="ur8_16MB_xilinx_4eth_2ab_isdn_nt_te_pots_wlan_mimo_usb_host_dect_multiannex_13589"
	export CONFIG_XILINX="y"
	export CONFIG_jffs2_size="132"
	export CONFIG_RAMSIZE="64"
	export CONFIG_ROMSIZE="16"
	export CONFIG_DIAGNOSE_LEVEL="1"
#	export CONFIG_DIAGNOSE_LEVEL="0"
	#----dsl menu selection
	export CONFIG_ATA_FULL="n"
	export CONFIG_DSL_UR8="n"
	export CONFIG_DSL="y"
	export CONFIG_LABOR_DSL="y"
	export CONFIG_VDSL="y"
	export CONFIG_VINAX="y"
# 	export CONFIG_VLYNQ0="3"
	export CONFIG_VINAX_TRACE="n"
	export CONFIG_LIBZ="y"
#	export CONFIG_LIBZ="n"
#	export CONFIG_VOL_COUNTER="y"
	export CONFIG_VOL_COUNTER="n"
	export CONFIG_PROV_DEFAULT="y"
#	export CONFIG_TAM_ONRAM="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
#	  export CONFIG_DSL="n"
	  export CONFIG_DSL_MULTI_ANNEX="n"
	  export CONFIG_VDSL="n"
 	  export CONFIG_LABOR_DSL="n"
	fi 
	#----
	export CONFIG_LED_NO_DSL_LED="y"
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_MAILER="y"
	export CONFIG_UPNP="y"
	export CONFIG_DECT="y"
	export CONFIG_TAM="y"
	export CONFIG_TAM_MODE="1"
	export CONFIG_MAILER2="y"
	export CONFIG_Pots="1"
	export CONFIG_IsdnNT="1"
	export CONFIG_IsdnTE="1"
	export CONFIG_Usb="1" 
	export CONFIG_UsbHost="1" 
	export CONFIG_UsbStorage="1"
	export CONFIG_UsbPrint="1"
#	export kernel_start="0x90010000"
	export kernel_start="0x90020000"
	export kernel_size="16121856"
#	export filesystem_start="0x90000000"
#	export filesystem_size="0"
	export urlader_start="0x90000000"
#	export urlader_size="65536"
	export urlader_size="131072"

	# needs differnet tool
	export MKSQUASHFS_TOOL="mksquashfs3-lzma"
	export MKSQUASHFS_OPTIONS+=" -no-progress -no-exports -no-sparse"
	export MKSQUASHFS="${TOOLS_DIR}/${MKSQUASHFS_TOOL}"
	;;
"7270v3")
	export CLASS=""
	export SPNUM=""
	export PROD="7270plus" 
	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$NEWNAME" == "" ] && export NEWNAME="FRITZ!Box Fon WLAN 7270 v3"
	[ "$FBMOD" == "" ] && export FBMOD="7270"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="139"
	export HWID="145"
	export HWRevision="${HWID}.1.0.6"
	export CONFIG_INSTALL_TYPE="ur8_16MB_xilinx_4eth_2ab_isdn_nt_te_pots_wlan_usb_host_dect_plus_55266"
	export CONFIG_jffs2_size="132"
	export CONFIG_RAMSIZE="64"
	export CONFIG_ROMSIZE="16"
	export CONFIG_DIAGNOSE_LEVEL="1"
	export CONFIG_DECT_14488="y"
	export CONFIG_ATA_NOPASSTHROUGH="y"
	export CONFIG_PROV_DEFAULT="y"
	export CONFIG_FON_IPPHONE="y"
	export CONFIG_VERSION_MAJOR="74"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
	  export CONFIG_VDSL="n"
 	  export CONFIG_LABOR_DSL="n"
	fi 
	#----
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_Pots="1"
	export CONFIG_IsdnNT="1"
	export CONFIG_IsdnTE="1"
	export CONFIG_Usb="1" 
	export CONFIG_UsbHost="1" 
	export CONFIG_UsbStorage="1"
	export CONFIG_UsbPrint="1"
	export kernel_start="0x90020000"
	export kernel_size="16121856"
	export urlader_start="0x90000000"
	export urlader_size="131072"

	# needs different tool
	export MKSQUASHFS_TOOL="mksquashfs3-lzma"
	export MKSQUASHFS_OPTIONS+=" -no-progress -no-exports -no-sparse"
	export MKSQUASHFS="${TOOLS_DIR}/${MKSQUASHFS_TOOL}"
	;;
"7240v2")
	export SPMOD="$1"
	export CLASS=""
	export SPNUM=""
	export PROD="7240"
	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$NEWNAME" == "" ] && export NEWNAME="FRITZ!Box Fon WLAN 7240"
	[ "$FBMOD" == "" ] && export FBMOD="7270"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="139"
	export HWID="144"
	export HWRevision="${HWID}.1.0.6"
	export CONFIG_INSTALL_TYPE="ur8_16MB_xilinx_4eth_2ab_dect_isdn_pots_wlan_33906"
	export CONFIG_jffs2_size="132"
	export CONFIG_RAMSIZE="64"
	export CONFIG_ROMSIZE="16"
#	export CONFIG_DIAGNOSE_LEVEL="1"
	export CONFIG_DECT_14488="y"
	export CONFIG_ATA_NOPASSTHROUGH="y"
	export CONFIG_PROV_DEFAULT="y"
	export CONFIG_FON_IPPHONE="y"
	export CONFIG_CAPI_NT="n"
	export CONFIG_VERSION_MAJOR="73"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
	  export CONFIG_VDSL="n"
 	  export CONFIG_LABOR_DSL="n"
	fi 
	#----
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="4"
	export CONFIG_Pots="1"
	export CONFIG_IsdnNT="0"
	export CONFIG_IsdnTE="0"
	export CONFIG_Usb="1" 
	export CONFIG_UsbHost="1" 
	export CONFIG_UsbStorage="1"
	export CONFIG_UsbPrint="1"
	export kernel_start="0x90020000"
	export kernel_size="16121856"
	export urlader_start="0x90000000"
	export urlader_size="131072"

	# needs different tool
	export MKSQUASHFS_TOOL="mksquashfs3-lzma"
	export MKSQUASHFS_OPTIONS+=" -no-progress -no-exports -no-sparse"
	export MKSQUASHFS="${TOOLS_DIR}/${MKSQUASHFS_TOOL}"
	;;
"7141")
	export SPMOD="$1"
	export CLASS=""
	export SPNUM=""
	export PROD="7141"
	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$NEWNAME" == "" ] && export NEWNAME="FRITZ!Box Fon WLAN 7141"
	[ "$FBMOD" == "" ] && export FBMOD="7170"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="94"
	export HWID="108"
	export HWRevision="${HWID}.1.0.6"
	export CONFIG_INSTALL_TYPE="ar7_8MB_xilinx_1eth_2ab_isdn_te_pots_wlan_usb_host_49780"
	export CONFIG_jffs2_size="32"
	export CONFIG_RAMSIZE="32"
	export CONFIG_ROMSIZE="8"
	export CONFIG_ATA_NOPASSTHROUGH="n"
	export CONFIG_FON_IPPHONE="y"
	export CONFIG_CAPI="y"
	export CONFIG_CAPI_NT="n"
	export CONFIG_CAPI_POTS="y"
	export CONFIG_CAPI_TE="y"
	export CONFIG_VERSION_MAJOR="40"
	if [ "$ATA_ONLY" = "y" ]; then
	  export CONFIG_ATA="n"  
	  export CONFIG_ATA_FULL="y"
	  export CONFIG_VDSL="n"
 	  export CONFIG_LABOR_DSL="n"
	fi 
	#----
	export CONFIG_AB_COUNT="2"
	export CONFIG_ETH_COUNT="1"
	export CONFIG_Pots="1"
	export CONFIG_IsdnNT="0"
	export CONFIG_IsdnTE="0"
	export CONFIG_Usb="0" 
	export CONFIG_UsbHost="1" 
	export CONFIG_UsbStorage="1"
	export CONFIG_UsbPrint="1"
	export kernel_size="7798784"
	;;

*)
	export SPMOD="$1"
	export CLASS=""
	export SPNUM=""
	export PROD="$1" 
	export CONFIG_PRODUKT="Fritz_Box_${PROD}"
	[ "$FBMOD" == "" ] && export FBMOD="$1"
	[ "$FBHWRevision" == "" ] && export FBHWRevision="139"
	export HWID="139"
	export HWRevision="${HWID}.1.0.6"
	PROD2="${PROD:0:2}"
	export kernel_size="7798784"
	if [ "$PROD2" == "72" ]; then
	    # 72XX firmwares needs differnet tool
	    export MKSQUASHFS_TOOL="mksquashfs3-lzma"
	    export MKSQUASHFS_OPTIONS+=" -no-progress -no-exports -no-sparse"
	    export MKSQUASHFS="${TOOLS_DIR}/${MKSQUASHFS_TOOL}"
	    export kernel_size="16121856"
	fi
	;;
	
esac

return 0
}
# menuconfig uses Firmware.conf as Firmwareconfigfile and export must be adjusted
eval "$(sed -e 's|EXPORT_|export |' $HOMEDIR/${firmwareconf_file_name})"
echo "Firmware configuration taken from: ${firmwareconf_file_name}"
. $inc_DIR/includefunctions
# make sure Annex is set to A or B (muli uses B as default)
[ "$ANNEX" != "B" ] && [ "$ANNEX" != "A" ] && echo "Commandline annex parameter -x is: '$ANNEX' but must be 'A' or 'B'" && exit 0  
export kernel_args="annex=${ANNEX}" 
#[ "$CONFIG_DSL_MULTI_ANNEX" == "y" ] && export kernel_args="console=ttyS0,38400"
export CONFIG_ANNEX="${ANNEX}"
# set above variables according to your hardware
set_model "$SPMOD"
# set service portal url
export CONFIG_SERVICEPORTAL_URL="http://www.avm.de/de/Service/Service-Portale/Service-Portal/index.php?portal=FRITZ!Box_Fon_WLAN_$FBMOD"
echo
echo
echo
echo "********************************************************************************"
echo -e "\033[1mSpeed-to-Fritz version: ${MODVER}\033[0m"
echo "--------------------------------------------------------------------------------"
# ensure that scripts in sh_DIR, sh2_dir are executable because svn does not store unix metadata ;(
chmod +x "$sh_DIR"/* "$sh2_DIR"/*
# ensure that certain directories are in place
mkdir -p "$FWNEWDIR" "$FWORIGDIR"
#START
# delete privias Firmware of 11500 if needed
$sh2_DIR/del_zip "${AVM_DSL_7170_11500}" "${AVM_DSL_7270_11500}" "13014" 
# delete privias Firmware of 13014 if needed
$sh2_DIR/del_zip "${AVM_AIO_7170_13014}" "${AVM_AIO_7270_13014}" "13014" 
# extract source
. $inc_DIR/get_workingbase
# move avm to $OEM
[ "$MOVE_AVM_to_OEM" = "y" ] && $sh_DIR/move_avm_to_OEM.sh
# create backup for final compare
[ "$DO_FINAL_DIFF" = "y" ] || [ "$DO_FINAL_KDIFF3_2" = "y" ] || [ "$DO_FINAL_KDIFF3_3" = "y" ] && mkdir -p "${TEMPDIR}" && cp -fdpr "${FBDIR}"/*  --target-directory="${TEMPDIR}"  
# do a compare of AVM and AVM 2nd
[ "$TYPE_LOCAL_MODEL" == "y" ] && [ "$DO_KDIFF3_3" = "y" ] && kdiff3 "${FBDIR}" "${FBDIR_2}"
# do a compare of TCOM and AVM
[ "$TYPE_LOCAL_MODEL" != "y" ] && [ "$DO_KDIFF3_2" = "y" ] && kdiff3 "${SPDIR}" "${FBDIR}"
# do a compare of source 1 (TCOM) , 2 (AVM) and 3
[ "$TYPE_LOCAL_MODEL" != "y" ] && [ "$DO_KDIFF3_3" = "y" ] && kdiff3 "${SPDIR}" "${FBDIR_2}" "${FBDIR}"
# do a compare of avm and 3
[ "$DO_DIFF" = "y" ] && ./0diff "${FBDIR}" "${FBDIR_2}" "./logAVMto3"
# do a compare of tcom and 3
[ "$DO_DIFF_TCOM" = "y" ] && ./0diff "${SPDIR}" "${FBDIR_2}" "./logTCOMto3"
#
[ "$DO_NOT_STOP_ON_ERROR" = "n" ] && exec 2>"${HOMEDIR}/${ERR_LOGFILE}" || rm -f "${HOMEDIR}/${ERR_LOGFILE}"
# get version from etc/.version into variables
. $inc_DIR/getversion
# get produkt from etc/default.F* into variables FBMOD, CONFIG_PRODUKT and CONFIG_SORCE
. $inc_DIR/getprodukt
# save some variabels to incl_var
. $sh2_DIR/settings
#print some Hardware setting found in the two firmwares in use
$sh2_DIR/dedect_HW
# make sure all is set to correct rights
[ ${FAKEROOT_ON} = "n" ] && chmod -R 777 .
#[ ${FAKEROOT_ON} = "y" ] && $FAKEROOT_TOOL chmod -R 755 .
echo "********************************************************************************"
echo -e "\033[1mPhase 3:\033[0m Copy sources."
echo "********************************************************************************"
 echo "${SPMOD}/////////////////////////////////////////////////////////////////////////////"
# Flashing original firmware image ...
if [ "$ORI" != "y" ]; then
 #prepare for use of Freetz Firmware 
 [ "$MOVE_ALL_to_OEM" = "y" ] && $sh_DIR/move_all_to_OEM.sh "${SRC}" || $sh_DIR/remake_link_avm.sh "${SRC}"
 # Please dont add conditions on models in any external file
 #enable ext2
 [ "$ENABLE_EXT2" = "y" ] && $sh2_DIR/patch_ext2 "${SRC}" "${DST}"
 case "$SPMOD" in
 "920")
 . Speedport920;;
 "907")
 . Speedport907;;
 "707")
 . Speedport707;;
 "721")
 . Speedport721;;
 "500")
 . Speedport500;;
 "501")
 . Speedport501;;
 "503")
 . Speedport503;;
 "7141")
 . SxAVMx7141;;
 "7240v2")
 . SxAVMx7240v2;;
 "7270v3")
 . SxAVMx7270v3;;
 *)
 . SxxxAVM;;
 esac
  #bug in home.js, causes mailfunction with tcom firmware, status page is empty  
 $sh_DIR/fix_homebug.sh
  #add missing files for tr064
 [ "$CONFIG_TR064" = "y" ] && $sh_DIR/copy_tr064_files.sh
 #remove help 
 [ "$REMOVE_HELP" = "y" ] && $sh_DIR/rmv_help.sh "${SRC}"
 #Add modinfo
 $sh_DIR/add_modinfobutton.sh "${SRC}"
 #relace banner
 [ $COPY_HEADER = "y" ] && $sh_DIR/rpl_header.sh "${SRC}"
 #add addons
 if [ "$COPY_ADDON_TMP" = "y" ]; then
 	find ./addon/tmp/squashfs-root/ | while read file; do
		file="${file##./addon/tmp/squashfs-root/}"
		file="${SRC}"/"$file"
		[ -d "$file" ] || rm -f "$file"
	done
 	cp -fdpr  ./addon/tmp/squashfs-root/*  --target-directory="${SRC}"
 fi
 #patch p_maxTimeout on intenet page
 [ "$SET_PMAXTIMEOUT" = "y" ] && $sh_DIR/patch_pmaxTimeout.sh "${SRC}" "${OEMLIST}"
 #patch download url and add menuitem support
 [ "$ADD_SUPPORT" = "y" ] && $sh2_DIR/patch_url "${SRC}" "${OEMLIST}"
 #add dsl expert pages support
 [ "$ADD_DSL_EXPERT_MNUE" = "y" ] && $sh_DIR/add_dsl_expert.sh "${SRC}" "${OEMLIST}"
 #add omlinecounter pages 
 [ "$ADD_ONLINECOUNTER" = "y" ] && $sh_DIR/add_onlinecounter.sh "${SRC}" "${OEMLIST}"
 #replace assistent menuitem with enhanced settings 
 [ "$RPL_ASSIST" = "y" ] && $sh2_DIR/rpl_ass_menuitem "${SRC}" "${OEMLIST}" 
 #tam bugfix remove tams    
 $sh_DIR/patch_tam.sh "${SRC}"
 #gsm page    
 [ "$DO_GSM_PATCH" = "y" ] && $sh_DIR/disply_gsm.sh "${SRC}" "${OEMLIST}"
 #enable all providers
 [ "$SET_ALLPROVIDERS" = "y" ] && $sh_DIR/set_allproviders.sh
 #set expert view    
 [ "$SET_EXPERT" = "y" ] && $sh_DIR/set_expertansicht.sh
 # reverse phonebook lookup
 [ "$DO_LOOKUP_PATCH" = "y" ] && $sh2_DIR/patch_fc "${SRC}"
 # remove tcom and some other oem dirs and add link instead to enable other brands.
 $sh2_DIR/add_tcom_link "${SRC}"
 #add kaid for xbox 
 [ "$ADD_KAID" = "y" ] && $sh2_DIR/add_kaid
 #exchange kernel 
 if [ "$XCHANGE_KERNEL" = "y" ]; then 
 	echo "-- Take Speedport kernel for new image"
 	cp -rfv "${SPDIR}/kernel.raw" "${FBDIR}/kernel.raw"
 elif [ "$SRC2_KERNEL" = "y" ]; then
 	echo "-- Take kernel from 2nd AVM source for new image"
	cp -rfv "${FBDIR_2}/kernel.raw" "${FBDIR}/kernel.raw"
 #else
 #	echo "-- Take AVM kernel for new image"
 fi
 #remove signature
 $sh_DIR/rmv_signatur.sh "${SRC}"
 #remove autoupdate tab
 $sh_DIR/remove_autoupdatetab.sh "${SRC}"
 # patch update pages 
 $sh_DIR/patch_tools.sh "${SRC}"
 # update modules dependencies
 [ "$UPDATE_DEPMOD" = y ] && $sh_DIR/update-module-deps.sh "${SRC}" "${KernelVersion}"
 #export download links
 $HOMEDIR/extract_rpllist.sh	
 #packing takes place on SPDIR
 export SPDIR="${FBDIR}"
 echo "${SPMOD}/////////////////////////////////////////////////////////////////////////////"
 echo "********************************************************************************"
 echo -e "\033[1mPhase 9:\033[0m Patch install."
 echo "********************************************************************************"
else
 #add addons
 export OEM="tcom"
 [ "$COPY_ADDON_TMP_to_ORI" = "y" ] &&  cp -fdpr  ./addon/tmp/squashfs-root/*  --target-directory="${DST}"
 #exchange kernel
 [ "$XCHANGE_KERNEL" = "y" ] && cp -rfv "${FBDIR}/kernel.raw" "${SPDIR}/kernel.raw"
 [ "$SRC2_KERNEL" = "y" ] && cp -rfv "${FBDIR_2}/kernel.raw" "${FBDIR}/kernel.raw"
 echo "Assembling original TCOM Firmware for transfer via FTP and Webinterface ..."
 echo
 echo "Some changes are made to the original tar file, so it can be used on "
 echo "Speedports with AVM Web GUI to flash back to the original T-COM firmware."
 echo "This is always a downgrade, and depending on the amount of difference it is"
 echo "not for sure that it will work in every case, if the router is rebooting after"
 echo "a downgrade via webinterface, you must use a recover tool or CLEAR_ENV"
 echo "${SPMOD}/////////////////////////////////////////////////////////////////////////////"
 # patch update pages 
 $sh_DIR/patch_tools.sh "${DST}"
fi
## patch portrule to enable forwarding to box itself 
[ "$PATCH_PORTRULE" == "y" ] && subscripts2/patch_portrule "${SRC}"
#dont set kernel annex args, if it is a multi annex firmware
#make firmware installable via GUI
readConfig "DSL_MULTI_ANNEX" "DSL_MULTI_ANNEX" "${SRC}/etc/init.d"
[ "$DSL_MULTI_ANNEX" == "y" ] && export kernel_args="console=ttyS0,38400"
$sh_DIR/patch_install.sh "${SPDIR}"
. $inc_DIR/testerror
[ ${FAKEROOT_ON} = "n" ] && chmod -R 777 "${FBDIR}"
echo "********************************************************************************"
echo -e "\033[1mPhase 10:\033[0m Pack and deliver."
echo "********************************************************************************"
#do a final compare
exec 2> /dev/null
[ "$DO_FINAL_DIFF" = "y" ] && ./0diff "${SPDIR}" "${TEMPDIR}" "./logFINALtoAVM"
[ "$DO_FINAL_DIFF_SRC2" = "y" ] && ./0diff "${SPDIR}" "${FBDIR_2}" "./logFINALto3"
[ "$TYPE_LOCAL_MODEL" != "y" ] && [ "$DO_FINAL_KDIFF3_2" = "y" ] && kdiff3 "${SPDIR}" "${TEMPDIR}"
[ "$DO_FINAL_KDIFF3_3" = "y" ] && kdiff3 "${SPDIR}" "${FBDIR_2}" "${TEMPDIR}"
#[ "$TYPE_LOCAL_MODEL" == "y" ] && [ "$DO_FINAL_KDIFF3_3" = "y" ] && kdiff3 "${SPDIR}" "${TEMPDIR}"
[ "$DO_NOT_STOP_ON_ERROR" = "n" ] && exec 2>"${HOMEDIR}/${ERR_LOGFILE}"
# compose filename for new .tar file
if SVN_VERSION="$(svnversion . | tr ":" "_")"; then
 [ "${SVN_VERSION:0:6}" == "export" ] && SVN_VERSION=""
 [ "$SVN_VERSION" != "" ] && SVN_VERSION="-r-$SVN_VERSION"
 SKRIPT_DATE+="$SVN_VERSION"
fi
[ "7570" == "${TYPE_LABOR_TYPE:0:4}" ] && AVM_SUBVERSION="7570-$AVM_SUBVERSION"
[ "y" == "${TYPE_TCOM_7570_70}" ] && TCOM_SUBVERSION="7570-$TCOM_SUBVERSION"
[ ${FREETZ_REVISION} ] && FREETZ_REVISION="-freetz-${FREETZ_REVISION}"
PANNEX="_annex${ANNEX}"
[ "$DSL_MULTI_ANNEX" == "y" ] && PANNEX=""
readConfig "MULTI_LANGUAGE" "MULTI_LANGUAGE" "${SRC}/etc/init.d"
#Language="_${FORCE_LANGUAGE}"
Language="_${avm_Lang}"
[ "$MULTI_LANGUAGE" == "y" ] && Language=""
[ "$FORCE_CLEAR_FLASH" == "y" ] && CLEAR="C_" || CLEAR="" 
[ "$ORI" != "y" ] && export NEWIMG="fw_${CLEAR}${CLASS}_W${SPNUM}V_${TCOM_VERSION_MAJOR}.${TCOM_VERSION}-${TCOM_SUBVERSION}_${CONFIG_PRODUKT}_${AVM_VERSION_MAJOR}.${AVM_VERSION}-${AVM_SUBVERSION}${FREETZ_REVISION}-sp2fr-${SKRIPT_DATE_ISO}${SVN_VERSION}_OEM-${OEM}${PANNEX}${Language}.image"
[ "$ORI" == "y" ] && export NEWIMG="${SPIMG}_OriginalTcomAdjusted${PANNEX}${Language}.image"
[ "$ATA_ONLY" = "y" ] && export NEWIMG="fw_${CLEAR}${CLASS}_W${SPNUM}V_${TCOM_VERSION_MAJOR}.${TCOM_VERSION}-${TCOM_SUBVERSION}_${CONFIG_PRODUKT}_${AVM_VERSION_MAJOR}.${AVM_VERSION}-${AVM_SUBVERSION}${FREETZ_REVISION}-sp2fr-${SKRIPT_DATE_ISO}${SVN_VERSION}_OEM-${OEM}_ATA-ONLY${Language}.image"
#only AVM + 2nd AVM Firmware was in use
[ "$TYPE_LOCAL_MODEL" == "y" ] && export NEWIMG="fw_${AVM_VERSION_MAJOR}.${AVM_VERSION}-${AVM_SUBVERSION}_${CONFIG_PRODUKT}_${AVM_2_VERSION_MAJOR}.${AVM_2_VERSION}-${AVM_2_SUBVERSION}${FREETZ_REVISION}-sp2fr-${SKRIPT_DATE_ISO}${SVN_VERSION}_OEM-${OEM}${PANNEX}${Language}.image"
echo "export MULTI_LANGUAGE=\"${MULTI_LANGUAGE}\"" >> incl_var
echo "export kernel_args=\"${kernel_args}\"" >> incl_var
echo "export NEWIMG=\"${NEWIMG}\"" >> incl_var
# print some info on screen
. $inc_DIR/print_settings
if [ "$VERBOSE" = "-v" ]; then
echo "Ready for packing... Press 'ENTER' to continue..."
 while !(read -s);do
    sleep 1
 done
fi
if [ "$SET_UP" = "n" ]; then
 #wrap all up again
 fw_pack "$SPDIR" "${NEWDIR}" "${NEWIMG}"
fi
. $inc_DIR/testerror