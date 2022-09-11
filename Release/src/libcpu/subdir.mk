################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../src/libcpu/startup_gd32f30x_hd.S 

OBJS += \
./src/libcpu/startup_gd32f30x_hd.o 

S_UPPER_DEPS += \
./src/libcpu/startup_gd32f30x_hd.d 


# Each subdirectory must supply rules for building sources it contributes
src/libcpu/%.o: ../src/libcpu/%.S src/libcpu/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -march=armv7e-m -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -Wuninitialized -Wall -Wextra -Wshadow -Waggregate-return -Wfloat-equal -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


