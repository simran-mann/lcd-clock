################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lcd_driver/tsc/XPT2046.c 

OBJS += \
./lcd_driver/tsc/XPT2046.o 

C_DEPS += \
./lcd_driver/tsc/XPT2046.d 


# Each subdirectory must supply rules for building sources it contributes
lcd_driver/tsc/%.o lcd_driver/tsc/%.su lcd_driver/tsc/%.cyclo: ../lcd_driver/tsc/%.c lcd_driver/tsc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lcd_driver-2f-tsc

clean-lcd_driver-2f-tsc:
	-$(RM) ./lcd_driver/tsc/XPT2046.cyclo ./lcd_driver/tsc/XPT2046.d ./lcd_driver/tsc/XPT2046.o ./lcd_driver/tsc/XPT2046.su

.PHONY: clean-lcd_driver-2f-tsc

