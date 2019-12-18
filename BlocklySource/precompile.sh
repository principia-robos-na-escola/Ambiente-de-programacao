#!/bin/bash

if [ ! -d bins ]; then
    mkdir bins
fi

if [ -f bins/core.a ]; then
    echo "Core.a file already exists"
    exit 0
fi

GPP="esp32/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin/xtensa-esp32-elf-g++"
GCC="esp32/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin/xtensa-esp32-elf-gcc"
AR="esp32/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin/xtensa-esp32-elf-ar"

DEFINES="-DESP_PLATFORM -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DHAVE_CONFIG_H"

INC_CONFIG="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/config"
INC_APPTRACE="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/app_trace"
INC_UPDATE="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/app_update"
INC_ASIO="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/asio"
INC_BLSUPPORT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/bootloader_support"
INC_BT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/bt"
INC_COAP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/coap"
INC_CONSOLE="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/console"
INC_DRIVER="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/driver"
INC_ESPTLS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp-tls"
INC_ESP32="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp32"
INC_ESP32AA="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_adc_cal"
INC_ESPEVENT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_event"
INC_HCLIENT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_http_client"
INC_HSERVER="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_http_server"
INC_HOTA="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_https_ota"
INC_RINGBUF="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp_ringbuf"
INC_ETHER="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/ethernet"
INC_EXPAT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/expat"
INC_FATFS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/fatfs"
INC_FMBUS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/freemodbus"
INC_FRTOS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/freertos"
INC_HEAP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/heap"
INC_IDFTEST="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/idf_test"
INC_JSMN="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/jsmn"
INC_JSON="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/json"
INC_SODIUM="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/libsodium"
INC_LOG="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/log"
INC_LWIP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/lwip"
INC_MBEDTLS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/mbedtls"
INC_MDNS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/mdns"
INC_MECC="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/micro-ecc"
INC_MQTT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/mqtt"
INC_NEWLIB="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/newlib"
INC_NGHTTP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/nghttp"
INC_NVSF="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/nvs_flash"
INC_OSSL="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/openssl"
INC_PBUFC="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/protobuf-c"
INC_PCOMM="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/protocomm"
INC_PTHREAD="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/pthread"
INC_SDMMC="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/sdmmc"
INC_SCA="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/smartconfig_ack"
INC_SOC="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/soc"
INC_SFLASH="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/spi_flash"
INC_SPIFFS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/spiffs"
INC_TCPT="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/tcp_transport"
INC_TCPIP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/tcpip_adapter"
INC_ULP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/ulp"
INC_VFS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/vfs"
INC_WLEVEL="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/wear_levelling"
INC_WIFIP="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/wifi_provisioning"
INC_WPAS="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/wpa_supplicant"
INC_XDM="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/xtensa-debug-module"
INC_CAMERA="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp32-camera"
INC_FACE="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/esp-face"
INC_FB="-Iesp32/hardware/esp32/1.0.2/tools/sdk/include/fb_gfx"

INCLUDES="$INC_CONFIG $INC_APPTRACE $INC_UPDATE $INC_ASIO $INC_BLSUPPORT $INC_BT $INC_COAP $INC_CONSOLE $INC_DRIVER $INC_ESPTLS $INC_ESP32 $INC_ESP32AA $INC_ESPEVENT $INC_HCLIENT $INC_HSERVER $INC_HOTA $INC_RINGBUF $INC_ETHER $INC_EXPAT $INC_FATFS $INC_FMBUS $INC_FRTOS $INC_HEAP $INC_IDFTEST $INC_JSMN $INC_JSON $INC_SODIUM $INC_LOG $INC_LWIP $INC_MBEDTLS $INC_MDNS $INC_MECC $INC_MQTT $INC_NEWLIB $INC_NGHTTP $INC_NVSF $INC_OSSL $INC_PBUFC $INC_PCOMM $INC_PTHREAD $INC_SDMMC $INC_SCA $INC_SOC $INC_SFLASH $INC_SPIFFS $INC_TCPT $INC_TCPIP $INC_ULP $INC_VFS $INC_WLEVEL $INC_WIFIP $INC_WPAS $INC_XDM $INC_CAMERA $INC_FACE $INC_FB"

LIB_DIR="esp32/hardware/esp32/1.0.2/libraries"

echo $1

O_INCLUDES="-Iesp32/hardware/esp32/1.0.2/cores/esp32 -Iesp32/hardware/esp32/1.0.2/variants/esp32 -I$LIB_DIR/ArduinoOTA/src"
INC_WIFI="-I$LIB_DIR/WiFi/src"
INC_UP="-I$LIB_DIR/Update/src"

ALL_INCLUDES="$O_INCLUDES $INC_WIFI $INC_UP -I$LIB_DIR/WebServer/src -I$LIB_DIR/ESP32_AnalogWrite -I$LIB_DIR/ESPmDNS/src -I$LIB_DIR/FS/src"

GPP_FLAGS="-std=gnu++11 -fno-exceptions -Os -g3 -Wpointer-arith -fexceptions -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -fno-rtti -MMD -c -DF_CPU=240000000L"
GCC_FLAGS="-std=gnu99 -Os -g3 -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -Wpointer-arith -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -Wno-old-style-declaration -MMD -c"

O_DEFINES="-DARDUINO=10809 -DARDUINO_ESP32_DEV -DARDUINO_ARCH_ESP32 -DARDUINO_BOARD=\"ESP32_DEV\" -DARDUINO_VARIANT=\"esp32\" -DESP32 -DCORE_DEBUG_LEVEL=0"

LIB_CORE="esp32/hardware/esp32/1.0.2/cores/esp32"

CORE_INCLUDES="-Iesp32/hardware/esp32/1.0.2/cores/esp32 -Iesp32/hardware/esp32/1.0.2/variants/esp32"

find bins/ -type f -delete

#Compiled library "ArduinoOTA"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/ArduinoOTA/src/ArduinoOTA.cpp -o bins/ArduinoOTA.cpp.o
echo "Compiled ArduinoOTA"

#Compiled library "WiFi"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiMulti.cpp -o bins/WiFiMulti.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFi.cpp -o bins/WiFi.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiClient.cpp -o bins/WiFiClient.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiGeneric.cpp -o bins/WiFiGeneric.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiScan.cpp -o bins/WiFiScan.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/ETH.cpp -o bins/ETH.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiAP.cpp -o bins/WiFiAP.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiServer.cpp -o bins/WiFiServer.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiSTA.cpp -o bins/WiFiSTA.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WiFi/src/WiFiUdp.cpp -o bins/WiFiUdp.cpp.o
echo "Compiled WiFi"

#Compiled library "Update"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/Update/src/Updater.cpp -o bins/Updater.cpp.o
echo "Compiled Updater"

#Compiled library "WebServer"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WebServer/src/Parsing.cpp -o bins/Parsing.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WebServer/src/WebServer.cpp -o bins/WebServer.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/WebServer/src/detail/mimetable.cpp -o bins/mimetable.cpp.o
echo Compiled WebServer

#Compiled library "ESP32_AnalogWrite"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/ESP32_AnalogWrite/analogWrite.cpp -o bins/analogWrite.cpp.o
echo Compiled AnalogWrite

#Compiled library "ESPmDNS"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/ESPmDNS/src/ESPmDNS.cpp -o bins/ESPmDNS.cpp.o
echo Compiled ESPmDNS

#Compiled library "FS"
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/FS/src/vfs_api.cpp -o bins/vfs_api.cpp.o
$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES $LIB_DIR/FS/src/FS.cpp -o bins/FS.cpp.o
echo Compiled FS

#Compiled core...
for file in $LIB_CORE/*.c; do
    n=$(basename ${file})
    $GCC $DEFINES $INCLUDES $GCC_FLAGS $O_DEFINES $CORE_INCLUDES $LIB_CORE/$n -o bins/${n}.o
done

for file in $LIB_CORE/*.cpp; do
    n=$(basename ${file})
    $GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $CORE_INCLUDES $LIB_CORE/$n -o bins/${n}.o
done
echo Compiled Core

for dot_o in bins/*.o; do
    $AR cru bins/core.a $dot_o
done
echo Done compiling all
