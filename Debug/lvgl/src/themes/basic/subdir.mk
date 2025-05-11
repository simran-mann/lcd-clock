################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/themes/basic/lv_theme_basic.c 

OBJS += \
./lvgl/src/themes/basic/lv_theme_basic.o 

C_DEPS += \
./lvgl/src/themes/basic/lv_theme_basic.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/themes/basic/%.o lvgl/src/themes/basic/%.su lvgl/src/themes/basic/%.cyclo: ../lvgl/src/themes/basic/%.c lvgl/src/themes/basic/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-themes-2f-basic

clean-lvgl-2f-src-2f-themes-2f-basic:
	-$(RM) ./lvgl/src/themes/basic/lv_theme_basic.cyclo ./lvgl/src/themes/basic/lv_theme_basic.d ./lvgl/src/themes/basic/lv_theme_basic.o ./lvgl/src/themes/basic/lv_theme_basic.su

.PHONY: clean-lvgl-2f-src-2f-themes-2f-basic

