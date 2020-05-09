set(MCU_UTIL_PATH ${REMCU_VM_PATH}/mcu_utils/)

set(MCU_MAKE_ARGUMENTS TARGET_MK=${MCU_INCLUDE_MK_FILE})
list(APPEND MCU_MAKE_ARGUMENTS MCU_UTIL_PATH=${MCU_UTIL_PATH})
list(APPEND MCU_MAKE_ARGUMENTS OUTPUT=${MCU_OBJECT_FILE})
list(APPEND MCU_MAKE_ARGUMENTS CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
list(APPEND MCU_MAKE_ARGUMENTS BUILD_DIRECTORY=${BUILD_DIRECTORY})
list(APPEND MCU_MAKE_ARGUMENTS DEVICE=${MCU_TYPE})
list(APPEND MCU_MAKE_ARGUMENTS MCU_LIB_NAME=${MCU_LIB_NAME})
list(APPEND MCU_MAKE_ARGUMENTS MCU_MAJOR_VERSION_LIB=${MCU_MAJOR_VERSION_LIB})
list(APPEND MCU_MAKE_ARGUMENTS MCU_SDK_PATH=${MCU_SDK_PATH})
list(APPEND MCU_MAKE_ARGUMENTS LLVM_ADIN_PATH=${LLVM_ADIN_PATH})
list(APPEND MCU_MAKE_ARGUMENTS CROSS_MK_FILE=${CROSS_MK_FILE})
list(APPEND MCU_MAKE_ARGUMENTS CLANG_PATH=${CLANG_PATH})

set(IR_TEST_MAKE_ARGUMENTS TARGET_MK=${MCU_INCLUDE_MK_FILE})
list(APPEND IR_TEST_MAKE_ARGUMENTS MCU_UTIL_PATH=${MCU_UTIL_PATH})
list(APPEND IR_TEST_MAKE_ARGUMENTS CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE})
list(APPEND IR_TEST_MAKE_ARGUMENTS LLVM_ADIN_PATH=${LLVM_ADIN_PATH})
list(APPEND IR_TEST_MAKE_ARGUMENTS CROSS_MK_FILE=${CROSS_MK_FILE})
list(APPEND IR_TEST_MAKE_ARGUMENTS CLANG_PATH=${CLANG_PATH})