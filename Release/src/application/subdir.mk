################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/application/main.c 

OBJS += \
./src/application/main.o 

C_DEPS += \
./src/application/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/application/%.o: ../src/application/%.c src/application/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -march=armv7e-m -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -Wuninitialized -Wall -Wextra -Wshadow -Waggregate-return -Wfloat-equal -DGD32F30X_HD -DUSE_STDPERIPH_DRIVER -I"../src/cmsis" -I"../src/components/rtt" -I"../src/rtos2/Include" -I"../src/rtos2/RTX/Include" -I"../src/rtos2/RTX/Source" -I"../src/stdperiph/Include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


