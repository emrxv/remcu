

include(${CMAKE_CURRENT_LIST_DIR}/vars.cmake)

set(CMAKE_CXX_COMPILER clang)
set(CMAKE_C_COMPILER clang)

set(MCU_INCLUDE_MK_FILE ${REMCU_VM_PATH}/mcu_utils/windows.mk)

# set(STRIP_COMMAND echo)

set(LICENSE_TYPE APACHE_2.0)

set(TARGET_REMCU_OS_NAME Windows_x64)
