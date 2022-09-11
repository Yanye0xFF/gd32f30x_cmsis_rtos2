################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/cmsis/system_gd32f30x.c 

OBJS += \
./src/cmsis/system_gd32f30x.o 

C_DEPS += \
./src/cmsis/system_gd32f30x.d 


# Each subdirectory must supply rules for building sources it contributes
src/cmsis/%.o: ../src/cmsis/%.c src/cmsis/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -march=armv7e-m -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -Wuninitialized -Wall -Wextra -Wshadow -Waggregate-return -Wfloat-equal -DGD32F30X_HD -DUSE_STDPERIPH_DRIVER -I"../src/cmsis" -I"../src/components/rtt" -I"../src/rtos2/Include" -I"../src/rtos2/RTX/Include" -I"../src/rtos2/RTX/Source" -I"../src/stdperiph/Include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


