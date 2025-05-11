################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../lvgl/src/draw/nxp/lv_gpu_nxp.c 

OBJS += \
./lvgl/src/draw/nxp/lv_gpu_nxp.o 

C_DEPS += \
./lvgl/src/draw/nxp/lv_gpu_nxp.d 


# Each subdirectory must supply rules for building sources it contributes
lvgl/src/draw/nxp/%.o lvgl/src/draw/nxp/%.su lvgl/src/draw/nxp/%.cyclo: ../lvgl/src/draw/nxp/%.c lvgl/src/draw/nxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../USB_HOST/App -I../USB_HOST/Target -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Middlewares/ST/STM32_USB_Host_Library/Core/Inc -I../Middlewares/ST/STM32_USB_Host_Library/Class/CDC/Inc -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"/Users/simranmann/Desktop/STM32/clock_display/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lvgl" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/lcd" -I"/Users/simranmann/Desktop/STM32/clock_display/lcd_driver/tsc" -I"/Users/simranmann/Desktop/STM32/clock_display" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-lvgl-2f-src-2f-draw-2f-nxp

clean-lvgl-2f-src-2f-draw-2f-nxp:
	-$(RM) ./lvgl/src/draw/nxp/lv_gpu_nxp.cyclo ./lvgl/src/draw/nxp/lv_gpu_nxp.d ./lvgl/src/draw/nxp/lv_gpu_nxp.o ./lvgl/src/draw/nxp/lv_gpu_nxp.su

.PHONY: clean-lvgl-2f-src-2f-draw-2f-nxp

