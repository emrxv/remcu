COMPILE_FLAGS = -fPIC -mcpu=cortex-a53 -mfpu=neon-fp-armv8 --target=arm-linux-gnueabihf --gcc-toolchain=$(RASPBERRY_TOOL_PATH)/x-tools/armv8-rpi3-linux-gnueabihf/bin/
IR_FLAGS += --target=arm-linux-gnueabihf
