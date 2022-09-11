################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../src/rtos2/RTX/Source/GCC/irq_cm4f.S 

OBJS += \
./src/rtos2/RTX/Source/GCC/irq_cm4f.o 

S_UPPER_DEPS += \
./src/rtos2/RTX/Source/GCC/irq_cm4f.d 


# Each subdirectory must supply rules for building sources it contributes
src/rtos2/RTX/Source/GCC/%.o: ../src/rtos2/RTX/Source/GCC/%.S src/rtos2/RTX/Source/GCC/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -march=armv7e-m -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -Wuninitialized -Wall -Wextra -Wshadow -Waggregate-return -Wfloat-equal -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


