
#COMPILE_FLAGS = -fPIC -mcpu=cortex-a53 -mfpu=neon-fp-armv8 --target=arm-linux-gnueabihf --gcc-toolchain=$(RASPBERRY_TOOL_PATH)/x-tools/armv8-rpi3-linux-gnueabihf/bin/
#IR_FLAGS += --target=arm-linux-gnueabihf

# Define paths to the CMSIS and HAL directories
CMSIS_PATH = $(BUILD_DIRECTORY)/stm32/stm32f10X/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/CMSIS/Core/Include
HAL_PATH = $(BUILD_DIRECTORY)/stm32/stm32f10X/STM32F10x_StdPeriph_Lib_V3.5.0/Libraries/STM32F10x_StdPeriph_Driver/inc

# Compiler flags for Cortex-A53
COMPILE_FLAGS = -fPIC -mcpu=cortex-a53 -mthumb -O2 -Wall -I$(CMSIS_PATH) -I$(HAL_PATH) --target=arm-linux-gnueabihf --gcc-toolchain=$(RASPBERRY_TOOL_PATH)/x-tools/armv8-rpi3-linux-gnueabihf/bin/

# Include CMSIS and HAL paths in IR_FLAGS
IR_FLAGS += -I $(CMSIS_PATH) -I $(HAL_PATH) --target=arm-linux-gnueabihf
