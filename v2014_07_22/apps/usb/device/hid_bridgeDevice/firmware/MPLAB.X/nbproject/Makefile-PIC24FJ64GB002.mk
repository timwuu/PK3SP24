#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-PIC24FJ64GB002.mk)" "nbproject/Makefile-local-PIC24FJ64GB002.mk"
include nbproject/Makefile-local-PIC24FJ64GB002.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=PIC24FJ64GB002
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/exp16/pic24fj64gb002/system.c ../src/app_device_custom_hid.c ../src/app_led_usb_status.c ../src/main.c ../src/usb_descriptors.c BL_Setup.c asmMain.s ../src/uart_buffer_D.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c ../../../../../../framework/usb/src/usb_device.c ../../../../../../framework/usb/src/usb_device_hid.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1015448813/system.o ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o ${OBJECTDIR}/BL_Setup.o ${OBJECTDIR}/asmMain.o ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o ${OBJECTDIR}/_ext/15502235/adc.o ${OBJECTDIR}/_ext/15502235/leds.o ${OBJECTDIR}/_ext/15502235/timer_1ms.o ${OBJECTDIR}/_ext/15502235/uart.o ${OBJECTDIR}/_ext/838585624/usb_device.o ${OBJECTDIR}/_ext/838585624/usb_device_hid.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1015448813/system.o.d ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d ${OBJECTDIR}/BL_Setup.o.d ${OBJECTDIR}/asmMain.o.d ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d ${OBJECTDIR}/_ext/15502235/adc.o.d ${OBJECTDIR}/_ext/15502235/leds.o.d ${OBJECTDIR}/_ext/15502235/timer_1ms.o.d ${OBJECTDIR}/_ext/15502235/uart.o.d ${OBJECTDIR}/_ext/838585624/usb_device.o.d ${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1015448813/system.o ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o ${OBJECTDIR}/BL_Setup.o ${OBJECTDIR}/asmMain.o ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o ${OBJECTDIR}/_ext/15502235/adc.o ${OBJECTDIR}/_ext/15502235/leds.o ${OBJECTDIR}/_ext/15502235/timer_1ms.o ${OBJECTDIR}/_ext/15502235/uart.o ${OBJECTDIR}/_ext/838585624/usb_device.o ${OBJECTDIR}/_ext/838585624/usb_device_hid.o

# Source Files
SOURCEFILES=../src/system_config/exp16/pic24fj64gb002/system.c ../src/app_device_custom_hid.c ../src/app_led_usb_status.c ../src/main.c ../src/usb_descriptors.c BL_Setup.c asmMain.s ../src/uart_buffer_D.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c ../../../../../../framework/usb/src/usb_device.c ../../../../../../framework/usb/src/usb_device_hid.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-PIC24FJ64GB002.mk dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,--script=../src/APP_p24FJ64GB002_IVT.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1015448813/system.o: ../src/system_config/exp16/pic24fj64gb002/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1015448813" 
	@${RM} ${OBJECTDIR}/_ext/1015448813/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1015448813/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/system_config/exp16/pic24fj64gb002/system.c  -o ${OBJECTDIR}/_ext/1015448813/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1015448813/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1015448813/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o: ../src/app_device_custom_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_device_custom_hid.c  -o ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o: ../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_led_usb_status.c  -o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/usb_descriptors.o: ../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/usb_descriptors.c  -o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/BL_Setup.o: BL_Setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BL_Setup.o.d 
	@${RM} ${OBJECTDIR}/BL_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  BL_Setup.c  -o ${OBJECTDIR}/BL_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/BL_Setup.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/BL_Setup.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o: ../src/uart_buffer_D.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/uart_buffer_D.c  -o ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/adc.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c  -o ${OBJECTDIR}/_ext/15502235/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/leds.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c  -o ${OBJECTDIR}/_ext/15502235/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/timer_1ms.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c  -o ${OBJECTDIR}/_ext/15502235/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/uart.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c  -o ${OBJECTDIR}/_ext/15502235/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_device.o: ../../../../../../framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_device.c  -o ${OBJECTDIR}/_ext/838585624/usb_device.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_device.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_device.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_device_hid.o: ../../../../../../framework/usb/src/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_device_hid.c  -o ${OBJECTDIR}/_ext/838585624/usb_device_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1    -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1015448813/system.o: ../src/system_config/exp16/pic24fj64gb002/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1015448813" 
	@${RM} ${OBJECTDIR}/_ext/1015448813/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1015448813/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/system_config/exp16/pic24fj64gb002/system.c  -o ${OBJECTDIR}/_ext/1015448813/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1015448813/system.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1015448813/system.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o: ../src/app_device_custom_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_device_custom_hid.c  -o ${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_device_custom_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o: ../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/app_led_usb_status.c  -o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/app_led_usb_status.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/main.c  -o ${OBJECTDIR}/_ext/1360937237/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/usb_descriptors.o: ../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/usb_descriptors.c  -o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/usb_descriptors.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/BL_Setup.o: BL_Setup.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BL_Setup.o.d 
	@${RM} ${OBJECTDIR}/BL_Setup.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  BL_Setup.c  -o ${OBJECTDIR}/BL_Setup.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/BL_Setup.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/BL_Setup.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o: ../src/uart_buffer_D.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../src/uart_buffer_D.c  -o ${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/1360937237/uart_buffer_D.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/adc.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/adc.c  -o ${OBJECTDIR}/_ext/15502235/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/adc.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/adc.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/leds.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/leds.c  -o ${OBJECTDIR}/_ext/15502235/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/leds.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/leds.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/timer_1ms.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/timer_1ms.c  -o ${OBJECTDIR}/_ext/15502235/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/timer_1ms.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/timer_1ms.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/15502235/uart.o: ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/15502235" 
	@${RM} ${OBJECTDIR}/_ext/15502235/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/15502235/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../bsp/exp16/pic24fj64gb002_pim/uart.c  -o ${OBJECTDIR}/_ext/15502235/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/15502235/uart.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/15502235/uart.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_device.o: ../../../../../../framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_device.c  -o ${OBJECTDIR}/_ext/838585624/usb_device.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_device.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_device.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/838585624/usb_device_hid.o: ../../../../../../framework/usb/src/usb_device_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/838585624" 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/838585624/usb_device_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../../../framework/usb/src/usb_device_hid.c  -o ${OBJECTDIR}/_ext/838585624/usb_device_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d"        -g -omf=elf   -fno-short-double -Os -I"../src" -I"../../../../../../framework" -I"../../../../../../bsp/exp16/pic24fj64gb002_pim" -I"../src/system_config/exp16/pic24fj64gb002" -DPIC24FJ64GB002 -DxDEBUG_MODE -msmart-io=1 -msfr-warn=off  
	@${FIXDEPS} "${OBJECTDIR}/_ext/838585624/usb_device_hid.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asmMain.o: asmMain.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmMain.o.d 
	@${RM} ${OBJECTDIR}/asmMain.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmMain.s  -o ${OBJECTDIR}/asmMain.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf   -Wa,-MD,"${OBJECTDIR}/asmMain.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/asmMain.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/asmMain.o: asmMain.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/asmMain.o.d 
	@${RM} ${OBJECTDIR}/asmMain.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  asmMain.s  -o ${OBJECTDIR}/asmMain.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf   -Wa,-MD,"${OBJECTDIR}/asmMain.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/asmMain.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../src/APP_p24FJ64GB002_IVT.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_ICD3=1  -omf=elf   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_ICD3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../src/APP_p24FJ64GB002_IVT.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf   -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/MPLAB.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/PIC24FJ64GB002
	${RM} -r dist/PIC24FJ64GB002

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
