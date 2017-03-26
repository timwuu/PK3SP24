#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a pre- and a post- target defined where you can add customization code.
#
# This makefile implements macros and targets common to all configurations.
#
# NOCDDL


# Building and Cleaning subprojects are done by default, but can be controlled with the SUB
# macro. If SUB=no, subprojects will not be built or cleaned. The following macro
# statements set BUILD_SUB-CONF and CLEAN_SUB-CONF to .build-reqprojects-conf
# and .clean-reqprojects-conf unless SUB has the value 'no'
SUB_no=NO
SUBPROJECTS=${SUB_${SUB}}
BUILD_SUBPROJECTS_=.build-subprojects
BUILD_SUBPROJECTS_NO=
BUILD_SUBPROJECTS=${BUILD_SUBPROJECTS_${SUBPROJECTS}}
CLEAN_SUBPROJECTS_=.clean-subprojects
CLEAN_SUBPROJECTS_NO=
CLEAN_SUBPROJECTS=${CLEAN_SUBPROJECTS_${SUBPROJECTS}}


# Project Name
PROJECTNAME=MPLAB.X

# Active Configuration
DEFAULTCONF=PIC24FJ64GB002
CONF=${DEFAULTCONF}

# All Configurations
ALLCONFS=PIC24FJ64GB002 PIC18F2550 LPCUSBDK_16F1459 LPCUSBDK_18F14K50 PIC18F46J50_PIM PIC18F47J53_PIM PIC18F87J50_PIM PIC18F87J94_PIM PIC18F97J94_PIM PIC18F_Starter_Kit_1 PICDEM_FSUSB PICDEM_FSUSB_K50 PIC24FJ64GB004_PIM PIC24FJ128GB204_PIM PIC24FJ256GB110_PIM PIC24FJ256GB210_PIM PIC24EP512GU810_PIM PIC24FJ256DA210_DEV_BOARD PIC24F_Starter_Kit_1 PIC24F_Analog_Starter_Kit_1 PIC24E_USB_Starter_Kit_1 dsPIC33EP256MU506_PIM dsPIC33EP512MU810_PIM dsPIC33E_USB_Starter_Kit_1 


# build
.build-impl: .build-pre
	${MAKE} -f nbproject/Makefile-${CONF}.mk SUBPROJECTS=${SUBPROJECTS} .build-conf


# clean
.clean-impl: .clean-pre
	${MAKE} -f nbproject/Makefile-${CONF}.mk SUBPROJECTS=${SUBPROJECTS} .clean-conf

# clobber
.clobber-impl: .clobber-pre .depcheck-impl
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ64GB002 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F2550 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=LPCUSBDK_16F1459 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=LPCUSBDK_18F14K50 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F46J50_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F47J53_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F87J50_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F87J94_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F97J94_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F_Starter_Kit_1 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PICDEM_FSUSB clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PICDEM_FSUSB_K50 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ64GB004_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ128GB204_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256GB110_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256GB210_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24EP512GU810_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256DA210_DEV_BOARD clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24F_Starter_Kit_1 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24F_Analog_Starter_Kit_1 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24E_USB_Starter_Kit_1 clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33EP256MU506_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33EP512MU810_PIM clean
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33E_USB_Starter_Kit_1 clean



# all
.all-impl: .all-pre .depcheck-impl
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ64GB002 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F2550 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=LPCUSBDK_16F1459 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=LPCUSBDK_18F14K50 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F46J50_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F47J53_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F87J50_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F87J94_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F97J94_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC18F_Starter_Kit_1 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PICDEM_FSUSB build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PICDEM_FSUSB_K50 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ64GB004_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ128GB204_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256GB110_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256GB210_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24EP512GU810_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24FJ256DA210_DEV_BOARD build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24F_Starter_Kit_1 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24F_Analog_Starter_Kit_1 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=PIC24E_USB_Starter_Kit_1 build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33EP256MU506_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33EP512MU810_PIM build
	    ${MAKE} SUBPROJECTS=${SUBPROJECTS} CONF=dsPIC33E_USB_Starter_Kit_1 build



# dependency checking support
.depcheck-impl:
#	@echo "# This code depends on make tool being used" >.dep.inc
#	@if [ -n "${MAKE_VERSION}" ]; then \
#	    echo "DEPFILES=\$$(wildcard \$$(addsuffix .d, \$${OBJECTFILES}))" >>.dep.inc; \
#	    echo "ifneq (\$${DEPFILES},)" >>.dep.inc; \
#	    echo "include \$${DEPFILES}" >>.dep.inc; \
#	    echo "endif" >>.dep.inc; \
#	else \
#	    echo ".KEEP_STATE:" >>.dep.inc; \
#	    echo ".KEEP_STATE_FILE:.make.state.\$${CONF}" >>.dep.inc; \
#	fi
