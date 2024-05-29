# Define our host system
SET(CMAKE_SYSTEM_NAME Linux)

if(NOT DEFINED ENV{RASPBERRY_TOOL_PATH})
    message(FATAL_ERROR 
        "\n******************************************************\n"
        "undefined RASPBERRY_TOOL_PATH environment variable, see: $ENV{RASPBERRY_TOOL_PATH} \n"
            "download armv8 toolchain from https://github.com/tttapa/docker-arm-cross-toolchain \n"
            "export RASPBERRY_TOOL_PATH=<toolchain path>\n"
            "\n******************************************************\n"
            )
endif()

set(RASPBERRY_TOOL_PATH $ENV{RASPBERRY_TOOL_PATH})

# Define the cross compiler locations
SET(CMAKE_C_COMPILER   ${RASPBERRY_TOOL_PATH}/bin/armv8-rpi3-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER ${RASPBERRY_TOOL_PATH}/bin/armv8-rpi3-linux-gnueabihf-g++)
# Define the sysroot path for the RaspberryPi distribution in our tools folder 
SET(CMAKE_FIND_ROOT_PATH ${RASPBERRY_TOOL_PATH}/armv8-rpi3-linux-gnueabihf/sysroot/)

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")
SET(CMAKE_MODULE_LINKER_FLAGS "${CMAKE_MODULE_LINKER_FLAGS} --sysroot=${CMAKE_FIND_ROOT_PATH}")

# Use our definitions for compiler tools
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Search for libraries and headers in the target directories only
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

include(${CMAKE_CURRENT_LIST_DIR}/vars.cmake)

set(CMAKE_CXX_STANDARD 11)
include(${REMCU_VM_PATH}/cmake/common_linux_flags.cmake)

set(MCU_INCLUDE_MK_FILE ${REMCU_VM_PATH}/mcu_utils/linux.mk)

# set(STRIP_COMMAND ${RASPBERRY_TOOL_PATH}/bin/armv8-rpi3-linux-gnueabihf-strip)

set(TARGET_REMCU_OS_NAME Raspbian_armv8)

set(CROSS_MK_FILE ${REMCU_VM_PATH}/mcu_utils/armv8-rpi3.mk)

set(LICENSE_TYPE CMT)
