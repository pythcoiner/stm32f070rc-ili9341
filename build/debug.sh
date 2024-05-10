#!/bin/bash

# Start OpenOCD in the background, redirect output to null
openocd -f interface/stlink.cfg -f target/stm32f0x.cfg > /dev/null 2>&1 &
OPENOCD_PID=$!

# Wait for OpenOCD to start
sleep 1

# Start GDB with the provided ELF file, use a GDB command file
/usr/bin/arm-none-eabi-gdb -x openocd.gdb bin/ili9341.elf

# Stop OpenOCD when GDB exits
kill $OPENOCD_PID
