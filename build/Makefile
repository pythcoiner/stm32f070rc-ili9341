######################################
# target
######################################
TARGET = ili9341

######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  \
../src/main.c \
../src/fonts.c \
../src/ili9341.c \
../src/ili9341_touch.c \
../src/stm32f0xx_it.c \
../src/stm32f0xx_hal_msp.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_gpio.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_dma.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_cortex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_spi.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_spi_ex.c \
../stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_exti.c \
../src/system_stm32f0xx.c \
../src/sysmem.c \
../src/syscalls.c  

# ASM sources
ASM_SOURCES =  \
startup_stm32f070rbtx.s

#######################################
# includes
#######################################

# AS includes
AS_INCLUDES =

# C includes
C_INCLUDES =  \
-I../include \
-I../stm32/STM32F0xx_HAL_Driver/Inc \
-I../stm32/STM32F0xx_HAL_Driver/Inc/Legacy \
-I../stm32/CMSIS/Device/ST/STM32F0xx/Include \
-I../stm32/CMSIS/Include

#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m0

# float-abi
FLOAT-ABI = -mfloat-abi=soft

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F070xB





# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif

# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F070RBTX_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin clean


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

# compile C sources -> .o
$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

# compile ASM sources -> .o
$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@


# Link .o into .elf
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

# .elf -> .hex
$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@

# .elf -> .bin
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	mkdir -p bin
	@if [ -f $(BUILD_DIR)/$(TARGET).bin ]; then cp $(BUILD_DIR)/$(TARGET).bin bin/; fi
	@if [ -f $(BUILD_DIR)/$(TARGET).elf ]; then cp $(BUILD_DIR)/$(TARGET).elf bin/; fi
	@if [ -f $(BUILD_DIR)/$(TARGET).hex ]; then cp $(BUILD_DIR)/$(TARGET).hex bin/; fi


	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
