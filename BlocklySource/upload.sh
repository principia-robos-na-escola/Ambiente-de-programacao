#!/bin/bash
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

O_INCLUDES="-Iesp32/hardware/esp32/1.0.2/cores/esp32 -Iesp32/hardware/esp32/1.0.2/variants/esp32 -I$LIB_DIR/ArduinoOTA/src"
INC_WIFI="-I$LIB_DIR/WiFi/src"
INC_UP="-I$LIB_DIR/Update/src"
INC_ULTRASONIC="-I$LIB_DIR/Ultrasonic/src"

ALL_INCLUDES="$O_INCLUDES $INC_WIFI $INC_UP $INC_ULTRASONIC -I$LIB_DIR/WebServer/src -I$LIB_DIR/ESP32_AnalogWrite -I$LIB_DIR/ESPmDNS/src -I$LIB_DIR/FS/src"

GPP_FLAGS="-std=gnu++11 -fno-exceptions -Os -g3 -Wpointer-arith -fexceptions -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -fno-rtti -MMD -c -DF_CPU=240000000L"
GCC_FLAGS="-std=gnu99 -Os -g3 -fstack-protector -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -mlongcalls -nostdlib -Wpointer-arith -w -Wno-error=unused-function -Wno-error=unused-but-set-variable -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wno-unused-parameter -Wno-sign-compare -Wno-old-style-declaration -MMD -c"

O_DEFINES="-DARDUINO=10809 -DARDUINO_ESP32_DEV -DARDUINO_ARCH_ESP32 -DARDUINO_BOARD=\"ESP32_DEV\" -DARDUINO_VARIANT=\"esp32\" -DESP32 -DCORE_DEBUG_LEVEL=0"

LIB_CORE="esp32/hardware/esp32/1.0.2/cores/esp32"

CORE_INCLUDES="-Iesp32/hardware/esp32/1.0.2/cores/esp32 -Iesp32/hardware/esp32/1.0.2/variants/esp32"

find bins -name 'SKETCH.*' -delete

$GPP $DEFINES $INCLUDES $GPP_FLAGS $O_DEFINES $ALL_INCLUDES -x c++ -include Arduino.h  $1 -o bins/SKETCH.o

#Linking everything together... Junta todos os .os a cima
#$GCC -nostdlib -Lesp32/hardware/esp32/1.0.2/tools/sdk/lib -Lesp32/hardware/esp32/1.0.2/tools/sdk/ld -T esp32_out.ld -T esp32.common.ld -T esp32.rom.ld -T esp32.peripherals.ld -T esp32.rom.spiram_incompatible_fns.ld -u ld_include_panic_highint_hdl -u call_user_start_cpu0 -Wl,--gc-sections -Wl,-static -Wl,--undefined=uxTopUsedPriority -u __cxa_guard_dummy -u __cxx_fatal_exception -Wl,--start-group bins/SKETCH.o bins/ArduinoOTA.cpp.o bins/ETH.cpp.o bins/WiFi.cpp.o bins/WiFiAP.cpp.o bins/WiFiClient.cpp.o bins/WiFiGeneric.cpp.o bins/WiFiMulti.cpp.o bins/WiFiSTA.cpp.o bins/WiFiScan.cpp.o bins/WiFiServer.cpp.o bins/WiFiUdp.cpp.o bins/Updater.cpp.o bins/Parsing.cpp.o bins/WebServer.cpp.o bins/mimetable.cpp.o bins/analogWrite.cpp.o bins/ESPmDNS.cpp.o bins/FS.cpp.o bins/vfs_api.cpp.o bins/core.a -lgcc -lopenssl -lbtdm_app -lfatfs -lwps -lcoexist -lwear_levelling -lesp_http_client -lprotobuf-c -lhal -lnewlib -ldriver -lbootloader_support -lpp -lfreemodbus -lmesh -lsmartconfig -ljsmn -lwpa -lethernet -lphy -lfrmn -lapp_trace -lfr_coefficients -lconsole -lulp -lwpa_supplicant -lfreertos -lbt -lmicro-ecc -lesp32-camera -lcxx -lxtensa-debug-module -ltcp_transport -lmdns -lvfs -lmtmn -lesp_ringbuf -lsoc -lcore -lfb_gfx -lsdmmc -llibsodium -lcoap -ltcpip_adapter -lprotocomm -lesp_event -limage_util -lc_nano -lesp-tls -lasio -lrtc -lspi_flash -lwpa2 -lwifi_provisioning -lesp32 -lface_recognition -lapp_update -lnghttp -lspiffs -lface_detection -lespnow -lnvs_flash -lesp_adc_cal -llog -ldl_lib -lsmartconfig_ack -lexpat -lfd_coefficients -lm -lmqtt -lc -lheap -lmbedtls -llwip -lnet80211 -lesp_http_server -lpthread -ljson -lesp_https_ota -lstdc++ -Wl,--end-group -Wl,-EL -o bins/SKETCH.elf
$GCC -nostdlib -Lesp32/hardware/esp32/1.0.2/tools/sdk/lib -Lesp32/hardware/esp32/1.0.2/tools/sdk/ld -T esp32_out.ld -T esp32.common.ld -T esp32.rom.ld -T esp32.peripherals.ld -T esp32.rom.spiram_incompatible_fns.ld -u ld_include_panic_highint_hdl -u call_user_start_cpu0 -Wl,--gc-sections -Wl,-static -Wl,--undefined=uxTopUsedPriority -u __cxa_guard_dummy -u __cxx_fatal_exception -Wl,--start-group bins/SKETCH.o bins/core.a -lgcc -lopenssl -lbtdm_app -lfatfs -lwps -lcoexist -lwear_levelling -lesp_http_client -lprotobuf-c -lhal -lnewlib -ldriver -lbootloader_support -lpp -lfreemodbus -lmesh -lsmartconfig -ljsmn -lwpa -lethernet -lphy -lfrmn -lapp_trace -lfr_coefficients -lconsole -lulp -lwpa_supplicant -lfreertos -lbt -lmicro-ecc -lesp32-camera -lcxx -lxtensa-debug-module -ltcp_transport -lmdns -lvfs -lmtmn -lesp_ringbuf -lsoc -lcore -lfb_gfx -lsdmmc -llibsodium -lcoap -ltcpip_adapter -lprotocomm -lesp_event -limage_util -lc_nano -lesp-tls -lasio -lrtc -lspi_flash -lwpa2 -lwifi_provisioning -lesp32 -lface_recognition -lapp_update -lnghttp -lspiffs -lface_detection -lespnow -lnvs_flash -lesp_adc_cal -llog -ldl_lib -lsmartconfig_ack -lexpat -lfd_coefficients -lm -lmqtt -lc -lheap -lmbedtls -llwip -lnet80211 -lesp_http_server -lpthread -ljson -lesp_https_ota -lstdc++ -Wl,--end-group -Wl,-EL -o bins/SKETCH.elf
echo Linking all together

#Aparentemente gera o arquivo partitions.bin
python esp32/hardware/esp32/1.0.2/tools/gen_esp32part.py -q esp32/hardware/esp32/1.0.2/tools/partitions/default.csv bins/SKETCH.partitions.bin
#Gera o .bin
python esp32/tools/esptool_py/2.6.1/esptool.py --chip esp32 elf2image --flash_mode dio --flash_freq 80m --flash_size 4MB -o bins/SKETCH.bin bins/SKETCH.elf
echo Creating .bin file

#Minha teoria eh de que fala o tamanho
esp32/tools/xtensa-esp32-elf-gcc/1.22.0-80-g6c4433a-5.2.0/bin/xtensa-esp32-elf-size -A bins/SKETCH.elf
echo Soneca doesn\'t know what this command just did

#Upload via wifi
python esp32/hardware/esp32/1.0.2/tools/espota.py -i 192.168.4.1 -p 3232 --auth= -f bins/SKETCH.bin
RETORNO=$?
if [ $RETORNO -eq 0 ]; then
    echo Done uploading to ESP32
fi
exit $RETORNO
