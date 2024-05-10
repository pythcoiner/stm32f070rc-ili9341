cmake_minimum_required(VERSION 3.10)  # Set the minimum version of CMake required

project(plc_axis_nucleo)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include the directory where the header files are located
include_directories(include)
include_directories(stm32/STM32F0xx_HAL_Driver/Inc)
include_directories(stm32/STM32F0xx_HAL_Driver/Inc/Legacy)
include_directories(stm32/CMSIS/Device/ST/STM32F0xx/Include)
include_directories(stm32/CMSIS/Include)
include_directories(/usr/include/bits)


# Add all source files to the project
add_executable(${PROJECT_NAME}
        src/main.c
        include/main.h
        stm32/CMSIS/Device/ST/STM32F0xx/Include/stm32f070xb.h
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_tim_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_uart_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_rcc_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_gpio.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_dma.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_cortex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_pwr_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_flash_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_i2c_ex.c
        stm32/STM32F0xx_HAL_Driver/Src/stm32f0xx_hal_exti.c
        src/system_stm32f0xx.c
        src/sysmem.c
        src/syscalls.c
        src/stm32f0xx_it.c
        src/ili9341.c
)
