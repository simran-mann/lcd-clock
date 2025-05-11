################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lcd_driver/lcd/bsp_lcd.c 

OBJS += \
./lcd_driver/lcd/bsp_lcd.o 

C_DEPS += \
./lcd_driver/lcd/bsp_lcd.d 


# Each subdirectory must supply rules for building sources it contributes
lcd_driver/lcd/%.o lcd_driver/lcd/%.su lcd_driver/lcd/%.cyclo: ../lcd_driver/lcd/%.c lcd_driver/lcd/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"/Users/simranmann/Desktop/STM32/EmbeddedGraphicsLVGL-MCU3-main/Projects/004_ClockAlarmUI/3_32F407DISCOVERY" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lcd_driver-2f-lcd

clean-lcd_driver-2f-lcd:
	-$(RM) ./lcd_driver/lcd/bsp_lcd.cyclo ./lcd_driver/lcd/bsp_lcd.d ./lcd_driver/lcd/bsp_lcd.o ./lcd_driver/lcd/bsp_lcd.su

.PHONY: clean-lcd_driver-2f-lcd

