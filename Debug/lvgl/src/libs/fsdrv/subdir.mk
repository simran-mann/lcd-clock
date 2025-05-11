################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/libs/fsdrv/lv_fs_cbfs.c \
../lvgl/src/libs/fsdrv/lv_fs_fatfs.c \
../lvgl/src/libs/fsdrv/lv_fs_posix.c \
../lvgl/src/libs/fsdrv/lv_fs_stdio.c \
../lvgl/src/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./lvgl/src/libs/fsdrv/lv_fs_cbfs.o \
./lvgl/src/libs/fsdrv/lv_fs_fatfs.o \
./lvgl/src/libs/fsdrv/lv_fs_posix.o \
./lvgl/src/libs/fsdrv/lv_fs_stdio.o \
./lvgl/src/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./lvgl/src/libs/fsdrv/lv_fs_cbfs.d \
./lvgl/src/libs/fsdrv/lv_fs_fatfs.d \
./lvgl/src/libs/fsdrv/lv_fs_posix.d \
./lvgl/src/libs/fsdrv/lv_fs_stdio.d \
./lvgl/src/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/libs/fsdrv/%.o lvgl/src/libs/fsdrv/%.su lvgl/src/libs/fsdrv/%.cyclo: ../lvgl/src/libs/fsdrv/%.c lvgl/src/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-libs-2f-fsdrv

clean-lvgl-2f-src-2f-libs-2f-fsdrv:
	-$(RM) ./lvgl/src/libs/fsdrv/lv_fs_cbfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_cbfs.d ./lvgl/src/libs/fsdrv/lv_fs_cbfs.o ./lvgl/src/libs/fsdrv/lv_fs_cbfs.su ./lvgl/src/libs/fsdrv/lv_fs_fatfs.cyclo ./lvgl/src/libs/fsdrv/lv_fs_fatfs.d ./lvgl/src/libs/fsdrv/lv_fs_fatfs.o ./lvgl/src/libs/fsdrv/lv_fs_fatfs.su ./lvgl/src/libs/fsdrv/lv_fs_posix.cyclo ./lvgl/src/libs/fsdrv/lv_fs_posix.d ./lvgl/src/libs/fsdrv/lv_fs_posix.o ./lvgl/src/libs/fsdrv/lv_fs_posix.su ./lvgl/src/libs/fsdrv/lv_fs_stdio.cyclo ./lvgl/src/libs/fsdrv/lv_fs_stdio.d ./lvgl/src/libs/fsdrv/lv_fs_stdio.o ./lvgl/src/libs/fsdrv/lv_fs_stdio.su ./lvgl/src/libs/fsdrv/lv_fs_win32.cyclo ./lvgl/src/libs/fsdrv/lv_fs_win32.d ./lvgl/src/libs/fsdrv/lv_fs_win32.o ./lvgl/src/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-lvgl-2f-src-2f-libs-2f-fsdrv

