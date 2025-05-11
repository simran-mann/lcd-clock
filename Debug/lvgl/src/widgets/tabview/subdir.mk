################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/widgets/tabview/lv_tabview.c 

OBJS += \
./lvgl/src/widgets/tabview/lv_tabview.o 

C_DEPS += \
./lvgl/src/widgets/tabview/lv_tabview.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/widgets/tabview/%.o lvgl/src/widgets/tabview/%.su lvgl/src/widgets/tabview/%.cyclo: ../lvgl/src/widgets/tabview/%.c lvgl/src/widgets/tabview/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-widgets-2f-tabview

clean-lvgl-2f-src-2f-widgets-2f-tabview:
	-$(RM) ./lvgl/src/widgets/tabview/lv_tabview.cyclo ./lvgl/src/widgets/tabview/lv_tabview.d ./lvgl/src/widgets/tabview/lv_tabview.o ./lvgl/src/widgets/tabview/lv_tabview.su

.PHONY: clean-lvgl-2f-src-2f-widgets-2f-tabview

