################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/hal/lv_hal_disp.c \
../lvgl/src/hal/lv_hal_indev.c \
../lvgl/src/hal/lv_hal_tick.c 

OBJS += \
./lvgl/src/hal/lv_hal_disp.o \
./lvgl/src/hal/lv_hal_indev.o \
./lvgl/src/hal/lv_hal_tick.o 

C_DEPS += \
./lvgl/src/hal/lv_hal_disp.d \
./lvgl/src/hal/lv_hal_indev.d \
./lvgl/src/hal/lv_hal_tick.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/hal/%.o lvgl/src/hal/%.su lvgl/src/hal/%.cyclo: ../lvgl/src/hal/%.c lvgl/src/hal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-hal

clean-lvgl-2f-src-2f-hal:
	-$(RM) ./lvgl/src/hal/lv_hal_disp.cyclo ./lvgl/src/hal/lv_hal_disp.d ./lvgl/src/hal/lv_hal_disp.o ./lvgl/src/hal/lv_hal_disp.su ./lvgl/src/hal/lv_hal_indev.cyclo ./lvgl/src/hal/lv_hal_indev.d ./lvgl/src/hal/lv_hal_indev.o ./lvgl/src/hal/lv_hal_indev.su ./lvgl/src/hal/lv_hal_tick.cyclo ./lvgl/src/hal/lv_hal_tick.d ./lvgl/src/hal/lv_hal_tick.o ./lvgl/src/hal/lv_hal_tick.su

.PHONY: clean-lvgl-2f-src-2f-hal

