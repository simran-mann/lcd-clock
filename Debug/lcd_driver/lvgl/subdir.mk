################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lcd_driver/lvgl/tft.c \
../lcd_driver/lvgl/touchpad.c 

OBJS += \
./lcd_driver/lvgl/tft.o \
./lcd_driver/lvgl/touchpad.o 

C_DEPS += \
./lcd_driver/lvgl/tft.d \
./lcd_driver/lvgl/touchpad.d 


# Each subdirectory must supply rules for building sources it contributes
lcd_driver/lvgl/%.o lcd_driver/lvgl/%.su lcd_driver/lvgl/%.cyclo: ../lcd_driver/lvgl/%.c lcd_driver/lvgl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I"/Users/simranmann/Desktop/STM32/EmbeddedGraphicsLVGL-MCU3-main/Projects/004_ClockAlarmUI/3_32F407DISCOVERY" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lcd_driver-2f-lvgl

clean-lcd_driver-2f-lvgl:
	-$(RM) ./lcd_driver/lvgl/tft.cyclo ./lcd_driver/lvgl/tft.d ./lcd_driver/lvgl/tft.o ./lcd_driver/lvgl/tft.su ./lcd_driver/lvgl/touchpad.cyclo ./lcd_driver/lvgl/touchpad.d ./lcd_driver/lvgl/touchpad.o ./lcd_driver/lvgl/touchpad.su

.PHONY: clean-lcd_driver-2f-lvgl

