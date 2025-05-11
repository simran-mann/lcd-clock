################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/widgets/msgbox/lv_msgbox.c 

OBJS += \
./lvgl/src/widgets/msgbox/lv_msgbox.o 

C_DEPS += \
./lvgl/src/widgets/msgbox/lv_msgbox.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/widgets/msgbox/%.o lvgl/src/widgets/msgbox/%.su lvgl/src/widgets/msgbox/%.cyclo: ../lvgl/src/widgets/msgbox/%.c lvgl/src/widgets/msgbox/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-widgets-2f-msgbox

clean-lvgl-2f-src-2f-widgets-2f-msgbox:
	-$(RM) ./lvgl/src/widgets/msgbox/lv_msgbox.cyclo ./lvgl/src/widgets/msgbox/lv_msgbox.d ./lvgl/src/widgets/msgbox/lv_msgbox.o ./lvgl/src/widgets/msgbox/lv_msgbox.su

.PHONY: clean-lvgl-2f-src-2f-widgets-2f-msgbox

