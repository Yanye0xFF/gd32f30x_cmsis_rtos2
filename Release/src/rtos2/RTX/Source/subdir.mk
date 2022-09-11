################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/rtos2/RTX/Source/rtx_delay.c \
../src/rtos2/RTX/Source/rtx_evflags.c \
../src/rtos2/RTX/Source/rtx_evr.c \
../src/rtos2/RTX/Source/rtx_kernel.c \
../src/rtos2/RTX/Source/rtx_lib.c \
../src/rtos2/RTX/Source/rtx_memory.c \
../src/rtos2/RTX/Source/rtx_mempool.c \
../src/rtos2/RTX/Source/rtx_msgqueue.c \
../src/rtos2/RTX/Source/rtx_mutex.c \
../src/rtos2/RTX/Source/rtx_semaphore.c \
../src/rtos2/RTX/Source/rtx_system.c \
../src/rtos2/RTX/Source/rtx_thread.c \
../src/rtos2/RTX/Source/rtx_timer.c 

OBJS += \
./src/rtos2/RTX/Source/rtx_delay.o \
./src/rtos2/RTX/Source/rtx_evflags.o \
./src/rtos2/RTX/Source/rtx_evr.o \
./src/rtos2/RTX/Source/rtx_kernel.o \
./src/rtos2/RTX/Source/rtx_lib.o \
./src/rtos2/RTX/Source/rtx_memory.o \
./src/rtos2/RTX/Source/rtx_mempool.o \
./src/rtos2/RTX/Source/rtx_msgqueue.o \
./src/rtos2/RTX/Source/rtx_mutex.o \
./src/rtos2/RTX/Source/rtx_semaphore.o \
./src/rtos2/RTX/Source/rtx_system.o \
./src/rtos2/RTX/Source/rtx_thread.o \
./src/rtos2/RTX/Source/rtx_timer.o 

C_DEPS += \
./src/rtos2/RTX/Source/rtx_delay.d \
./src/rtos2/RTX/Source/rtx_evflags.d \
./src/rtos2/RTX/Source/rtx_evr.d \
./src/rtos2/RTX/Source/rtx_kernel.d \
./src/rtos2/RTX/Source/rtx_lib.d \
./src/rtos2/RTX/Source/rtx_memory.d \
./src/rtos2/RTX/Source/rtx_mempool.d \
./src/rtos2/RTX/Source/rtx_msgqueue.d \
./src/rtos2/RTX/Source/rtx_mutex.d \
./src/rtos2/RTX/Source/rtx_semaphore.d \
./src/rtos2/RTX/Source/rtx_system.d \
./src/rtos2/RTX/Source/rtx_thread.d \
./src/rtos2/RTX/Source/rtx_timer.d 


# Each subdirectory must supply rules for building sources it contributes
src/rtos2/RTX/Source/%.o: ../src/rtos2/RTX/Source/%.c src/rtos2/RTX/Source/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU Arm Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m4 -march=armv7e-m -mthumb -mlittle-endian -mfloat-abi=hard -mfpu=fpv4-sp-d16 -mno-unaligned-access -O2 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -ffreestanding -Wuninitialized -Wall -Wextra -Wshadow -Waggregate-return -Wfloat-equal -DGD32F30X_HD -DUSE_STDPERIPH_DRIVER -I"../src/cmsis" -I"../src/components/rtt" -I"../src/rtos2/Include" -I"../src/rtos2/RTX/Include" -I"../src/rtos2/RTX/Source" -I"../src/stdperiph/Include" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


